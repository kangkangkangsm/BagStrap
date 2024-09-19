package com.example.bagStrap.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bagStrap.dao.CSCenterService;
import com.google.gson.Gson;

@Controller
public class CSCenterController {
	
	@Autowired
	CSCenterService csService;
	
	@RequestMapping("/cslist") 
    public String maintest(Model model) throws Exception{
         return "cslist";
    }
	
	@RequestMapping(value = "/cs-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String CSList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		//System.out.println(map);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		resultMap=csService.searchCS(map);

		return new Gson().toJson(resultMap);
	}

}
