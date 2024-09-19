package com.example.bagStrap.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bagStrap.dao.StudyService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudyController {
	
	@Autowired
	StudyService studyService; 
	@Autowired
	HttpSession session;
	
	@RequestMapping("/defaultView") 
    public String defaultView(Model model) throws Exception{
         return "study/defaultView";
    }
	@RequestMapping("/study") 
    public String mainz(Model model) throws Exception{
         return "study/study_home";
    }
	
	@RequestMapping("/study_comm") 
	 public String study_comm(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		 request.setAttribute("boardTypeId2", map.get("boardTypeId2"));
		 request.setAttribute("name2", map.get("name"));
		return "/study/study-comm";
	}       
	@RequestMapping("/study_comm_default") 
	 public String study_comm_default(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		 request.setAttribute("boardId", map.get("boardId"));
       return "/study/study-comm-detail";
	}       
	// 스터디 커뮤니티 나의 게시글, 댓글 
	@RequestMapping("/study-comm-myboard.do") 
    public String study_comm_myboard(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		 request.setAttribute("itemMode", map.get("itemMode"));
		return "study/study-comm-myboard";
    }
	// 스터디 커뮤니티 게시글 작성
	@RequestMapping("/commInsert.do") 
    public String commInsert(Model model) throws Exception{
         return "study/study-comm-insert";
    }
	
	        
	@RequestMapping(value = "/study.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String study(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> resultMap = new HashMap();


		return new Gson().toJson(resultMap);
	}
	
	//스터디 커뮤니티 사이드바 카테고리 타입 (사이드바)
	@RequestMapping(value = "/selectStuCommType.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectStuCommType(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		resultMap = studyService.selectStuComm(map);
		return new Gson().toJson(resultMap);
	}
	
	//스터디 커뮤니티 리스트
	@RequestMapping(value = "/selectStuCommListBoard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectStuCommListBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		resultMap = studyService.selectStuCommListBoard(map);
		return new Gson().toJson(resultMap);
	}
	//스터디 사이드바 나의 게시글, 댓글 목록 개수 (사이드바)
	@RequestMapping(value = "/sidebarCnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sidebarCnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		resultMap = studyService.sidebarCnt(map);
		return new Gson().toJson(resultMap);
		}
	//스터디 커뮤니티 디테일 나의 게시글, 댓글 목록 개수
	@RequestMapping(value = "/myCnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myCnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		resultMap = studyService.myCnt(map);
		return new Gson().toJson(resultMap);
		}
	//스터디 커뮤니티 상세 글 
	@RequestMapping(value = "/selectCommView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectCommView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		resultMap = studyService.selectCommView(map);
		return new Gson().toJson(resultMap);
	}
	//스터디 커뮤니티 상세 글 - 댓글작성
		@RequestMapping(value = "/insertViewComment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String insertViewComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap();
			System.out.println(map);
			resultMap = studyService.insertViewComment(map);
			return new Gson().toJson(resultMap);
		}
	
}