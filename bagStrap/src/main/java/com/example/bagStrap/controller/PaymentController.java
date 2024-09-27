package com.example.bagStrap.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bagStrap.dao.PaymentService;
import com.example.bagStrap.model.User;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {
    
	@Autowired
	HttpSession session;
	@Autowired
	PaymentService paymentService;
	@RequestMapping("/payment") 
    public String main(Model model) throws Exception{
         return "/payment/payment";
    }
	@RequestMapping("/payment/order") 
    public String order(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("orderList", map.get("orderList"));
		request.setAttribute("priceSum", map.get("priceSum"));
        
		return "/payment/order";
    }

	@RequestMapping(value = "/order.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String order(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user.getUserNickName() != null) {				
				// request로 list 보냈을 경우만 사용
				
				String json = map.get("orderList").toString(); 
				ObjectMapper mapper = new ObjectMapper();
				List<Object> orderList = mapper.readValue(json, new TypeReference<List<Object>>(){});
				map.put("orderList", orderList);
				map.put("userId", user.getUserId());
				resultMap = paymentService.createOrder(map);
				
				if((boolean)resultMap.get("result")) {
					resultMap.put("totalAmount", map.get("priceSum"));
					resultMap.put("addressNo", map.get("addressNo"));
					resultMap.put("userName", user.getUserName());
					resultMap.put("userId", user.getUserId());
					resultMap.put("userEmail", user.getEmail());
					resultMap.put("phone", user.getPhone());
					
				}
				System.out.println(resultMap);

				
				

			} else {
				resultMap.put("isLogin", false);
				resultMap.put("isAdmin", false);
				resultMap.put("message", "로그인 후 이용해주세요");
			}
		} catch(NullPointerException e) {
			System.out.println(e);
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/completeOrder.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String createOrderTable(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user.getUserNickName() != null) {
				System.out.println(map);
				String json = map.get("orderList").toString(); 
				ObjectMapper mapper = new ObjectMapper();
				List<Object> orderList = mapper.readValue(json, new TypeReference<List<Object>>(){});
				map.put("orderList", orderList);
				map.put("userId", user.getUserId());
				resultMap = paymentService.completeOrder(map);

				System.out.println(resultMap);

				
				

			} else {

			}
		} catch(NullPointerException e) {
			System.out.println(e);
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/changeDefaultYN.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String changeDefaultYN(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user.getUserNickName() != null) {
				map.put("userId", user.getUserId());
				resultMap = paymentService.changeDefaultYN(map);
			}
			
		} catch(NullPointerException e) {
			System.out.println(e);
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/updateSaveYN.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateSaveYN(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user.getUserNickName() != null) {
				map.put("userId", user.getUserId());
				resultMap = paymentService.updateSaveYN(map);
			}
			
		} catch(NullPointerException e) {
			System.out.println(e);
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/selectMyAddress.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectMyAddress(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user.getUserNickName() != null) {
				map.put("userId", user.getUserId());
				resultMap = paymentService.selectMyAddress(map);
				resultMap.put("result", true);
				resultMap.put("message", "내 주소를 불러옴");
				
			} else {
				resultMap.put("result", false);
				resultMap.put("message", "내 주소를 불러는데 실패했습니다.");
			}
		} catch(NullPointerException e) {
			System.out.println(e);
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/refundList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectRefundList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user.getUserNickName() != null) {
				map.put("userId", user.getUserId());
				resultMap = paymentService.selectRefundList(map);
				
			} else {
				resultMap.put("result", false);
				resultMap.put("message", "로그인 후 이용해주세요");
			}
		} catch(NullPointerException e) {
			System.out.println(e);
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
}

