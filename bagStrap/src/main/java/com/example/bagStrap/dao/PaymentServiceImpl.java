package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.example.bagStrap.mapper.PaymentMapper;
import com.example.bagStrap.model.Order;
import com.google.gson.Gson;


@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	PaymentMapper paymentMapper;

	@Override
	public ResponseEntity<Map> refund(HashMap<String, Object> refundMap,HashMap<String, Object> tokenMap) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		  RestTemplate restTemplate = new RestTemplate();
	        Gson gson = new Gson();
	        String token = (String) tokenMap.get("access_token");

	        // API 엔드포인트
	        String url = "https://api.iamport.kr/payments/cancel";
	        // 요청 헤더 설정
	        
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        headers.setBearerAuth(token); // 인증 토큰 설정
	        
	        System.out.println("토큰 값: " + token);
	        
	        Map<String, Object> requestBody = new HashMap<>();
	        requestBody.put("imp_uid", "imp_959782040252"); // 취소할 결제의 imp_uid
	        //requestBody.put("imp_uid", refundMap.get("imp_uid")); // 취소할 결제의 imp_uid
	        requestBody.put("reason", "구매취소"); // 취소 사유
	        requestBody.put("amount", 1004); // 취소 금액 (전체 금액 취소 시 생략 가능)
	        //requestBody.put("amount", refundMap.get("amount")); // 취소 금액 (전체 금액 취소 시 생략 가능)
	        String jsonBody = gson.toJson(requestBody);
	        
	        // HttpEntity에 본문과 헤더 담기
	        HttpEntity<String> requestEntity = new HttpEntity<>(jsonBody, headers);
	        // POST 요청 보내기
	        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, requestEntity, Map.class);
	        				
			return ResponseEntity.ok(response.getBody());
		
	}

	@Override
	public ResponseEntity<Map> getToken(HashMap<String, Object> map) {
	        RestTemplate restTemplate = new RestTemplate();

	        // API 엔드포인트
	        String url = "https://api.iamport.kr/users/getToken";
	        // 요청 헤더 설정
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        String jsonBody = new Gson().toJson(map);
	        // HttpEntity에 본문과 헤더 담기
	        HttpEntity<String> requestEntity = new HttpEntity<>(jsonBody, headers);
	        // POST 요청 보내기
	        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, requestEntity, Map.class);
	        System.out.println("hi");
			return ResponseEntity.ok(response.getBody());
	}

	@Override
	public HashMap<String, Object> createOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		
		try {
			// 책 구매 수량 체크
			if(!isBookAvailableForPurchase(map)) {
				failedResultMap(resultMap, "책없어용");
				return resultMap;
			}
			System.out.println("수량 이상 무");
			// 가격 이상 유무 체크
			if(!checkPriceSum(map)) {
				failedResultMap(resultMap, "가격이 일치하지않습니다");
				return resultMap;
			}
			System.out.println("가격 이상 무");
			
			// 주소 저장 시 최대 개수 체크
			if(map.get("saveYN").equals("Y")) {
				map.put("checkSave", "check");		
				if(paymentMapper.selectAddress(map).size() >= 2) {
					map.replace("saveYN", "N");
					resultMap.put("message", "배송지 저장 개수 10개 넘어서 저장은 안대용~");
				};
				map.remove("checkSave");
			} 
			
			System.out.println(map);
			// 배송 주소 저장
			//paymentMapper.insertAddress(map);
			System.out.println("AddressNo = " + map.get("addressNo"));
			
			//TODO 오더 및 오더 아이템 생성하기
			
			resultMap.put("result", true);	
		} catch(Exception e) {
			System.out.println("Exception e : " + e);
		}
		return resultMap;
	}
	//책 수량이 같은지 체크
	private boolean isBookAvailableForPurchase(HashMap<String, Object> map) {
		List<Order> orderList = paymentMapper.selectBookList(map);
		List<Object> objList = (List<Object>) map.get("orderList");
		
		return objList.size() == orderList.size();
	}
	
	private boolean checkPriceSum(HashMap<String, Object> map) {
		List<Order> orderList = paymentMapper.selectBookList(map);
		int priceSum = Integer.parseInt(map.get("priceSum").toString());
		
		final int[] comparePrice = {0};
		orderList.forEach(item -> {
			comparePrice[0] += item.getPrice().intValue() * item.getOrderQuantity();
			System.out.println(priceSum);
			System.out.println(comparePrice[0]);
		});
		
		return priceSum == comparePrice[0];
	}
	private void failedResultMap(HashMap<String, Object> map, String message) {
		map.put("message", message);
		map.put("result", false);
	}
}
