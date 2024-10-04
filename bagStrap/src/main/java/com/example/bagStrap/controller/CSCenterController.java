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

import com.example.bagStrap.dao.CSCenterService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CSCenterController {
	
	@Autowired
	CSCenterService csService;
	
	@RequestMapping("/cscenter") 
    public String CScenter(Model model) throws Exception{
         return "cscenter";
    }
	
	@RequestMapping("/noticelist") 
    public String noticelist(Model model) throws Exception{
         return "noticelist";
    }
	
	@RequestMapping("/noticedetail") 
    public String noticedetail(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		 System.out.println(map);
		 request.setAttribute("noticeId", map.get("noticeId"));
         return "noticedetail";
    }
	
	@RequestMapping("/noticeadd") 
    public String noticeadd(Model model) throws Exception{
         return "noticeadd";
    }
	
	@RequestMapping("/faqlist") 
    public String faqlist(Model model) throws Exception{
         return "faqlist";
    }
	
	@RequestMapping("/inquiry") 
    public String inquiry(Model model) throws Exception{
         return "inquiry";
    }
	
	@RequestMapping("/myinquiry") 
    public String myinquiry(Model model) throws Exception{
         return "myinquiry";
    }
	
	@RequestMapping("/history") 
    public String history(Model model) throws Exception{
         return "history";
    }
	
	@RequestMapping("/answerinq") 
    public String answerinq(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		System.out.println(map);
		request.setAttribute("inquiryId", map.get("inquiryId"));
        return "answerinq";
    }
	
	@RequestMapping("/answerdetail") 
    public String answerdetail(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		 System.out.println(map);
		 request.setAttribute("inquiryId", map.get("inquiryId"));
         return "answerdetail";
    }
	
	@RequestMapping("/cslist") 
    public String cslist(Model model) throws Exception{
         return "cslist";
    }
	
	@RequestMapping(value = "/notice-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String NoticeList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		resultMap=csService.NoticeList(map);

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/notice-detail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String NoticeDetail( Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		resultMap=csService.searchNoticeInfo(map);

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/notice-add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String NoticeAdd( Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		//System.out.println(map);
		resultMap=csService.addNotice(map);

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/faq-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String FaqList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		resultMap=csService.FaqList(map);

		return new Gson().toJson(resultMap);
	}
	

	
	@RequestMapping(value = "/inquiry-add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String InquiryAdd( Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		//System.out.println(map);
		resultMap=csService.addInquiry(map);

		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/inquiry-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String InquiryList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		resultMap=csService.selectInq(map);

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/delete-inquiry.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String DeleteInquiry(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		String json = map.get("selectItem").toString(); 
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		csService.removeInqBoard(map);

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/inquiry-remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String InquiryRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		resultMap=csService.deleteInq(map);

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/histroy-inq.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String HistoryInq(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		resultMap=csService.InqList(map);

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/update-inq.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String UpdateInq(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		resultMap=csService.updateInqList(map);

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/answer-inq.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String answerInq(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		resultMap=csService.addInqAnswer(map);

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/answer-detail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String AnswerDetail( Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		resultMap=csService.searchAnswerInfo(map);

		return new Gson().toJson(resultMap);
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
