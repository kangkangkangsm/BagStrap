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

import com.example.bagStrap.dao.StudyService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class StudyController {
	
	@Autowired
	StudyService studyService;
	
	@RequestMapping("/study.do") 
    public String main(Model model) throws Exception{
         return "study/study_home";
    }
	
	@RequestMapping("/study_comm.do") 
    public String study_comm(Model model) throws Exception{
         return "study/study_comm";
    }
	

	@RequestMapping(value = "/study.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String study(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> resultMap = new HashMap();


		return new Gson().toJson(resultMap);
	}
	
	//스터디 커뮤니티 카테고리 타입
	@RequestMapping(value = "/selectStuCommType.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectStuCommType(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		resultMap = studyService.selectStuComm(map);
		return new Gson().toJson(resultMap);
	}
}

