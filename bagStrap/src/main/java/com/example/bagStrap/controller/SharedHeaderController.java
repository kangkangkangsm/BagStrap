package com.example.bagStrap.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import aj.org.objectweb.asm.TypeReference;

@Controller
public class SharedHeaderController {
	public class ItemController {
		
		@RequestMapping("/head/main") 
	    public String main(Model model) throws Exception{
	         return "head_main";
	    }


		@RequestMapping(value = "/itemList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String printEmp(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			System.out.println(map);
			return null;
		}
	}


}
