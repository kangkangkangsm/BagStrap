package com.example.bagStrap.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bagStrap.dao.JoinService;
import com.example.bagStrap.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;

@Controller
public class JoinController {

	@Autowired
	JoinService joinService;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/join.do") 
    public String search(Model model) throws Exception{
         return "/header/header_join";
    }
	
	  @RequestMapping("/joinadd1.do") public String insert(Model model) throws
	  Exception{ return "/header/header_join"; 
	  }
	  
	  @RequestMapping("/addAddress1.do") public String insertAddress(Model model) throws
	  Exception{ return "/header/header_join"; 
	  }
	  
	  @RequestMapping("/myinfo.do") public String searchMyInfo(Model model) throws
	  Exception{ return "/header/header_myinfo"; 
	  }
	  
	@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String joinList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap = joinService.searchJoin(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/joinadd1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String joinAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap = joinService.addJoin(map);
		System.out.println("1111111111111111111111111111111111111");

		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/joinMultiCheck1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String joinMuitiCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap = joinService.doubleCheckJoin(map);
		System.out.println("resultMap1 : " + resultMap);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/nickNameMultiCheck1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String nickNameMuitiCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap = joinService.doubleNickName(map);
		System.out.println("resultMap2 : " + resultMap);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/addAddress1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addAdress(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap = joinService.addAddress(map);
		System.out.println("resultMap3 : " + resultMap);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/myInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			User user = (User) session.getAttribute("user");
			if(user.getUserNickName() != null) {
				map.put("userId", user.getUserId());

			} else {
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	
	
	
	
	
}
