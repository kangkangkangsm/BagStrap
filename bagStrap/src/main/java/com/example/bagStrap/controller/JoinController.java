package com.example.bagStrap.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bagStrap.dao.JoinService;
import com.google.gson.Gson;

@Controller
public class JoinController {

	@Autowired
	JoinService joinService;
	
	@RequestMapping("/join.do") 
    public String search(Model model) throws Exception{
         return "/header/header_join";
    }
	
	
	  @RequestMapping("/joinadd1.do") public String insert(Model model) throws
	  Exception{ return "/header/header_join"; }
	 
	

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
	
}
