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
import com.example.bagStrap.dao.SmsService;
import com.example.bagStrap.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;

@Controller
public class JoinController {

	@Autowired
	JoinService joinService;
	@Autowired
	HttpSession session;
	/*
	 * @Autowired SmsService smsService;
	 */

	@RequestMapping("/join") 
    public String search(Model model) throws Exception{
         return "/header/header_join";
    }
	
	  @RequestMapping("/joinadd1") public String insert(Model model) throws
	  Exception{ return "/header/header_join"; 
	  }
	  
	  @RequestMapping("/addAddress1") public String insertAddress(Model model) throws
	  Exception{ return "/header/header_join"; 
	  }
	  
	  @RequestMapping("/myinfo") public String searchMyInfo(Model model) throws
	  Exception{ return "/header/header_myinfo"; 
	  }
	  
	  @RequestMapping("/quit") public String deleteQuitMyInfo(Model model) throws
	  Exception{ return "/header/header_quit"; 
	  }
	  
	  @RequestMapping("/admin-users") public String adminUsers(Model model) throws
	  Exception{ return "/admin/admin_users"; 
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
	
	@RequestMapping(value = "/myinfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			User user = (User) session.getAttribute("user");
			if(user.getUserNickName() != null) {
				map.put("userId", user.getUserId());
			resultMap = joinService.searchmyInfo(map);
			} else {
				
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/addressUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addressUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap = joinService.reloadAddress(map);
		System.out.println("resultMap4 : " + resultMap);
		return new Gson().toJson(resultMap);
	}
	/*
	 * @RequestMapping(value = "confirm.dox", method = RequestMethod.POST, produces
	 * = "application/json;charset=UTF-8")
	 * 
	 * @ResponseBody public String confirmMessage(Model model, @RequestParam
	 * HashMap<String, Object> map) throws Exception { System.out.println(map);
	 * HashMap<String, Object> resultMap = smsService.makeConfirmNumbWithAPI(map);
	 * resultMap.put("result", "success"); return new Gson().toJson(resultMap); }
	 */

	
	@RequestMapping(value = "/NickUpdate1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String NickUpdate1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap = joinService.updateNickName(map);
		System.out.println("resultMap5 : " + resultMap);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/deleteQuit1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			User user = (User) session.getAttribute("user");
			if(user.getUserId() != null) {
				map.put("userId", user.getUserId());
			resultMap = joinService.QuitId(map);
			} else {
				
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin2", false);
		}

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/recheckPassword.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String recheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		try {
	        User user = (User) session.getAttribute("user");
	        String inputPassword = (String) map.get("password");
	        
	        if (user != null && inputPassword != null && user.getPassword().equals(inputPassword)) {
	            resultMap.put("result", "success");
	        } else {
	            resultMap.put("result", "fail");
	            resultMap.put("message", "비밀번호가 일치하지 않습니다.");
	        }
	    } catch (NullPointerException e) {
	        resultMap.put("isLogin3", false);
	    }

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/adminUsers.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String adminUsersList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap = joinService.adminUsersCheck(map);
		System.out.println("resultMap6 : " + resultMap);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/updateAdmin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateAdmin1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap = joinService.updateAdminUsers(map);
		System.out.println("resultMap7 : " + resultMap);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/getOutUser.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String outUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			User user = (User) session.getAttribute("user");
			if(user.getUserId() != null) {
				map.put("userId", user.getUserId());
				map.put("password", user.getPassword());
			resultMap = joinService.extrabanout(map);
			} else {
				
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin4", false);
		}

		return new Gson().toJson(resultMap);
	}
	
	
	
	
}	
	
	
	
	
	
