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

import com.example.bagStrap.dao.DefaultService;
import com.example.bagStrap.model.User;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class DefaultController {
	
	@Autowired
	DefaultService defaultService;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/default") 
	public String mainView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("hello", map.get("hello"));
		return "defaultView";
	}
	
	@RequestMapping("/test") 
    public String maintest(Model model) throws Exception{
         return "test";
    }

	@RequestMapping(value = "/itemList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String printEmp(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> resultMap = new HashMap();
		User user = (User)session.getAttribute("user");
		map.put("userId", user.getUserId());
		

		// request로 list 보냈을 경우만 사용
			String json = map.get("selectedCodes").toString(); 
			ObjectMapper mapper = new ObjectMapper();
			List<Object> selectedCodes = mapper.readValue(json, new TypeReference<List<Object>>(){});
			map.put("selectedCodes", selectedCodes);
			
					
		
		resultMap = defaultService.searchItem(map);

		return new Gson().toJson(resultMap);
	}
}

