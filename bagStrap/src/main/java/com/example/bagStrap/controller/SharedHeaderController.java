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

import jakarta.servlet.http.HttpSession;

@Controller
public class SharedHeaderController {

	@Autowired
	SharedHeaderService sharedHeaderService;
	@Autowired
	HttpSession session;

	@RequestMapping("/myStudy.do")
	public String main(Model model) throws Exception {
		return "/header/myStudy";
	}
	@RequestMapping("/myshop/orders.do")
	public String orders(Model model) throws Exception {
		return "/header/header_myshop_orders";
	}

	@RequestMapping(value = "/myStudy.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myStudy(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> resultMap = new HashMap();


		return new Gson().toJson(resultMap);
	}
	
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

			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	
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
	

}
