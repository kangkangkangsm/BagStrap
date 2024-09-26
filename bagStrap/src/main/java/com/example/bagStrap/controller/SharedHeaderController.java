package com.example.bagStrap.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bagStrap.dao.SharedHeaderService;
import com.example.bagStrap.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SharedHeaderController {

	@Autowired
	SharedHeaderService sharedHeaderService;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/myStudy")
	public String main(Model model) throws Exception {
		return "/header/myStudy";
	}
	@RequestMapping("/myshop/orders")
	public String orders(Model model) throws Exception {
		return "/header/header_myshop_orders";
	}
	@RequestMapping("/myshop/refund")
	public String refund(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		 request.setAttribute("orderId", map.get("orderId"));
		 request.setAttribute("imp", map.get("imp"));
		return "/header/header_refund";
	}
	@RequestMapping("/myshop/cart")
	public String cart(Model model) throws Exception {
		return "/header/header_cart";
	}
	//아직 만든거 아님
	@RequestMapping(value = "/myStudy.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myStudy(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> resultMap = new HashMap();


		return new Gson().toJson(resultMap);
	}
	
	//sharedHeader 로딩 함수
	@RequestMapping(value = "/sharedHeader.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sharedHeader(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			User user = (User) session.getAttribute("user");
			if(user.getUserNickName() != null) {
				resultMap.put("isLogin", true);
				resultMap.put("userNickName", user.getUserNickName());
				resultMap.put("userId", user.getUserId());
				resultMap.put("isAdmin", user.getStatus().equals("ADMIN")?true : false);
			} else {
				resultMap.put("isLogin", false);
				resultMap.put("isAdmin", false);
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	//내가 주문한 상품 리스트
	@RequestMapping(value = "/orderList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectOrderList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.selectOrderList(map);
			} else {
				resultMap.put("result", true);
				resultMap.put("message", "로그인하쇼");
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	//환불신청 리스트 페이지
	@RequestMapping(value = "/orderListForRefund.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String orderListForRefund(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.selectOrderListForRefund(map);
			} else {

				resultMap.put("result", true);
				resultMap.put("message", "로그인하쇼");
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	// 장바구니
	@RequestMapping(value = "/cartList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectCartList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.selectCartList(map);
			} else {
				resultMap.put("result", true);
				resultMap.put("message", "로그인하쇼");
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}

}
