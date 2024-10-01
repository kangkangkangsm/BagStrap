package com.example.bagStrap.dao;

import java.util.ArrayList;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.example.bagStrap.mapper.PaymentMapper;
import com.example.bagStrap.mapper.SharedHeaderMapper;
import com.example.bagStrap.model.Order;
import com.google.gson.Gson;


@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	PaymentMapper paymentMapper;
	@Autowired
	SharedHeaderMapper sharedHeaderMapper;


	@Override
	public ResponseEntity<Map> updateRefundStatus(HashMap<String, Object> refundMap,HashMap<String, Object> tokenMap) {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			
			//status update
			System.out.println(refundMap);
			sharedHeaderMapper.updateRefundStatus(refundMap);
			List<Order> orderList = paymentMapper.updateRefundStatus(refundMap);
			refundMap.put("orderList", orderList);
			resultMap.put("result", true);
			resultMap.put("message", "처리되었습니다.");

			return refundLogic(refundMap, tokenMap, true);

		} catch(Exception e) {
			e.printStackTrace();
			ResponseEntity<Map> response = ResponseEntity.ok(new HashMap<String, Object>()); 
			response.getBody().put("message","환불 처리 중 오류가 발생했습니다.");
			return response;
		}

	}
	
	@Transactional
	@Override
	public ResponseEntity<Map> refund(HashMap<String, Object> refundMap,HashMap<String, Object> tokenMap) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int[] amount = {0};
		try {
			//실제 주문개수와 환불신청개수 확인 및 즉시 환불 가능 여부 체크
			List<Order> checkList = paymentMapper.checkRefund(refundMap);
			boolean[] check = {false, false}; // 0: 환불 수량 에러 , 1: 즉시 환불 불가 = 테이블만 생성
			if(checkList.size() != 0) {
				checkList.forEach(item -> {
					System.out.println("calc: " + item.getCalc());
					if(item.getCalc() <0) {
						check[0] = true;
					}
				});	
			}

			if(check[0]) {
				ResponseEntity<Map> response = ResponseEntity.ok(new HashMap<String, Object>()); 
				response.getBody().put("message","구매한 수량보다 많은 책은 환불 할 수 없습니다.");
				return response;
			} 
			
	        //환불 테이블 생성
			ResponseEntity<Map> response = ResponseEntity.ok(new HashMap<String, Object>()); 
			makeRefundTable(refundMap);
        	//updateOrderStatus(refundMap,"중");
			response.getBody().put("idx", refundMap.get("refundFile"));
			response.getBody().put("message", "환불 신청이 완료되었습니다. 관리자 확인 후 환불 처리됩니다.");
			
			return response;

		} catch(Exception e) {
			e.printStackTrace();
			ResponseEntity<Map> response = ResponseEntity.ok(new HashMap<String, Object>()); 
			response.getBody().put("message","환불 처리 중 오류가 발생했습니다.");
			return response;
		}
	}
	//실제 환불 진행
	private ResponseEntity<Map> refundLogic(HashMap<String, Object> refundMap,HashMap<String, Object> tokenMap, boolean admin) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int[] amount = {0};
		try {
			// 환불 로직
			if (!admin) {
				List<HashMap<String, Object>> orderList = (List<HashMap<String, Object>>) refundMap.get("orderList");
				orderList.forEach(item -> {
					System.out.println(item.get("bookPrice"));
					int bookPrice = (item.get("bookPrice") != null) ? (int) item.get("bookPrice") : (int) item.get("price");
					int bookQuantity = (item.get("bookQuantity") != null) ? (int) item.get("bookQuantity") : (int) item.get("quantity");
					amount[0] += bookPrice*bookQuantity;
				});
			} else {
				List<Order> orderList = (List<Order>) refundMap.get("orderList");
				orderList.forEach(item -> {
					int bookPrice = item.getPrice().intValue();
					int bookQuantity =  item.getQuantity();
					amount[0] += bookPrice*bookQuantity;
				});
			}

			if (amount[0] == 0) {
				ResponseEntity<Map> response = ResponseEntity.ok(new HashMap<String, Object>()); 
				response.getBody().put("message", "처리되었습니다. 환불금액은 0원입니다.");
				
				return response;
			}
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
	        requestBody.put("imp_uid", refundMap.get("imp")); // 취소할 결제의 imp_uid
	        requestBody.put("reason", "구매취소"); // 취소 사유
	        requestBody.put("amount", amount[0]); // 취소 금액 (전체 금액 취소 시 생략 가능)
	        String jsonBody = gson.toJson(requestBody);
	        
	        // HttpEntity에 본문과 헤더 담기
	        HttpEntity<String> requestEntity = new HttpEntity<>(jsonBody, headers);
	        // POST 요청 보내기
	        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, requestEntity, Map.class);
			
	        if((int)response.getBody().get("code") != -1) {
		        //환불 테이블 생성
	        	if(!admin) {
	        		makeRefundTable(refundMap);	
	        	}
	        	//TODO 부분 환불됨 결제되면 무조건 처리돼
	        	//updateOrderStatus(refundMap, "됨");
				response.getBody().put("idx", refundMap.get("refundFile"));
				//response.getBody().put("message","환불되었습니다.");

	        }
			response.getBody().put("message", "환불되었습니다.");

	        System.out.println(response.getBody());
			return ResponseEntity.ok(response.getBody());

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return ResponseEntity.ok(resultMap);
		}
	}
	public void  makeRefundTable(HashMap<String, Object> refundMap) {
		// TODO Auto-generated method stub		
		try {
			paymentMapper.insertRefund(refundMap);
        	paymentMapper.insertRefundItem(refundMap);
        	
        	// 환불 수량 체크하기
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * public void updateOrderStatus(HashMap<String, Object> refundMap, String str)
	 * { HashMap<String, Object> map = new HashMap<String, Object>();
	 * map.putAll(refundMap); List<HashMap<String, Object>> orderList =
	 * (List<HashMap<String, Object>>) map.get("orderList");
	 * System.out.println("check해야함"); System.out.println(map);
	 * orderList.forEach(item -> {
	 * 
	 * item.put("bookQuantity", 0); }); System.out.println(map); boolean[] check =
	 * {false}; List<Order> checkList = paymentMapper.checkRefund(map);
	 * if(checkList.size() != 0) { checkList.forEach(item -> {
	 * System.out.println("calc: " + item.getCalc()); if(item.getCalc() > 0) {
	 * check[0] = true; } }); } if(check[0]) { refundMap.put("newStatus", "부분 환불 " +
	 * str); } else { refundMap.put("newStatus", "환불 " + str); }
	 * 
	 * paymentMapper.updateOrderStatus(refundMap); }
	 */
	@Override
	public HashMap<String, Object> selectRefundList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			int totalPages = paymentMapper.selectRefundListCount(map);
			List<Order> refundList = paymentMapper.selectRefundList(map);
			resultMap.put("totalPages", totalPages);
			resultMap.put("refundList", refundList);
			resultMap.put("result", true);
			
		} catch(Exception e) {
			failedResultMap(resultMap, e.getMessage());
		}
		return resultMap;
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
			
			if(map.get("addressNo").toString().equals("0")) saveAddress(map,resultMap);
			
			resultMap.put("result", true);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception e : " + e);
		}
		return resultMap;
	}
	private void saveAddress(HashMap<String, Object> map, HashMap<String, Object> resultMap) {
		// 주소 저장 시 최대 개수 체크
		if(map.get("saveYN").equals("Y")) {
			map.put("checkSave", "check");		
			if(paymentMapper.selectAddress(map).size() >= 10) {
				map.replace("saveYN", "N");
				resultMap.put("message", "배송지 저장 개수 3개 넘어서 저장은 안대용~");
			} else {
				paymentMapper.updateAddressDefaultToN(map);
			};
			map.remove("checkSave");
		} 
		
		System.out.println(map);
		// 배송 주소 저장
		try {
			if(map.get("reqComment") == null) map.put("reqComment", "");
			if(map.get("entrancePassword") == null) map.put("entrancePassword", "");
			System.out.println(map);
			int idx = paymentMapper.insertAddress(map);
			resultMap.put("addressNo", map.get("addressNo"));
		}catch(Exception e) {
			e.printStackTrace();
			failedResultMap(resultMap, "주소지 입력에 실패했습니다.");
			throw new RuntimeException("Address insertion failed", e);
			
		}
	}
	@Override
	public HashMap<String, Object> changeDefaultYN(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
			try {
				paymentMapper.changeDefaultYN(map);
				resultMap.put("result", true);
				resultMap.put("message", "기본 배송지가 변경되었습니다");
			}catch(Exception e) {
				e.printStackTrace();
				failedResultMap(resultMap, "기본 배송지 설정에 실패했습니다.");
			}
		return resultMap;
	}
	@Override
	public HashMap<String, Object> updateSaveYN(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
			try {
				paymentMapper.updateSaveYN(map);
				resultMap.put("result", true);
				resultMap.put("message", "배송지에서 제거되었습니다");
			}catch(Exception e) {
				e.printStackTrace();
				failedResultMap(resultMap, "배송지 제거에 실패했습니다.");
			}
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> completeOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		String message = "주문이 완료되었습니다"; 
		//상점 책 개수 업데이트
		if(!updateBookTable(map)) {
			message = "책 개수 변경 에러";
			resultMap.put("result", false);
			resultMap.put("message", message);
		}
		
		//상점 책 개수 업데이트
		if(!createOrderTable(map)) {
			message = "orderList 못만들어용";
			resultMap.put("result", false);
			resultMap.put("message", message);
		}
		
		//카트에서 삭제
		if(!deleteCart(map)) {
			message = "카트에서 못지워용";
			resultMap.put("result", false);
			resultMap.put("message", message);
		}
		
		
		resultMap.put("result", true);
		resultMap.put("message", message);

		return resultMap;
	}
	// 내 주소 불러오기
	@Override
	public HashMap<String, Object> selectMyAddress(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Order> addressList = paymentMapper.selectMyAddress(map);
		resultMap.put("addressList", addressList);

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

	//북테이블 개수 변경
	private boolean updateBookTable(HashMap<String, Object> map) {
		
		try {
			 paymentMapper.updateBookTable(map); 
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	//오더 테이블 및 아이템 테이블 생성	
	private boolean createOrderTable(HashMap<String, Object> map) {
		try {
			 paymentMapper.createOrder(map); 
			 paymentMapper.createOrderItem(map); 
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	private boolean deleteCart(HashMap<String, Object> map) {
		try {
			 paymentMapper.deleteCart(map); 
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Transactional
	@Override
	public HashMap<String, Object> selectOrderComplete(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			System.out.println("selectOrderComplete: "+map);
			List<Order> selectOrderComplete = paymentMapper.selectOrderComplete(map);
			List<Integer> categories = new ArrayList<>();
			selectOrderComplete.forEach(item -> {
				if(!categories.contains(item.getCategory())) {
					categories.add(item.getCategory());
				};
			});
			map.put("categories", categories);
			
			System.out.println("selectOrderComplete-categories: "+map);
			List<Order> selectOrderCompleteStudy = paymentMapper.selectOrderCompleteStudy(map);
			
			resultMap.put("selectOrderComplete", selectOrderComplete);
			resultMap.put("selectOrderCompleteStudy", selectOrderCompleteStudy);
	
		} catch(Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}


	
	
	
}
