package com.example.bagStrap.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bagStrap.dao.SharedHeaderService;
import com.example.bagStrap.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SharedHeaderController {

	@Autowired
	SharedHeaderService sharedHeaderService;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/myStudy")
	public String main(Model model) throws Exception {
		return "/header/myStudy";
	}
	@RequestMapping("/admin/orders")
	public String adminOrders(Model model) throws Exception {
		return "/admin/admin_order_list";
	}
	@RequestMapping("/myshop/orders")
	public String orders(Model model) throws Exception {
		return "/header/header_myshop_orders";
	}
	@RequestMapping("/myshop/refund")
	public String refund(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		 request.setAttribute("orderId", map.get("orderId"));
		 request.setAttribute("imp", map.get("imp"));
		return "/header/header_refund";
	}
	@RequestMapping("/myshop/refundList") 
    public String refundList(Model model) throws Exception{
		return "/header/header_refund_list";
    }
	@RequestMapping("/myshop/cart")
	public String cart(Model model) throws Exception {
		return "/header/header_cart";
	}

	@RequestMapping("/admin/studyList")
	public String adminStudyList(Model model) throws Exception {
		return "/admin/admin_study_list";
	}
    @RequestMapping("/myshop/review") 
    public String shop_cart(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		 request.setAttribute("book", map.get("book"));
        return "header/header_review";
    }
	
	//sharedHeader 로딩 함수
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
				resultMap.put("isAdmin", user.getstatus().equals("ADMIN")?true : false);
			} else {
				resultMap.put("isLogin", false);
				resultMap.put("isAdmin", false);
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	//내가 주문한 상품 리스트
	@Transactional
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
	//환불신청 리스트 페이지
	@RequestMapping(value = "/orderListForRefund.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String orderListForRefund(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.selectOrderListForRefund(map);
			} else {

				resultMap.put("result", true);
				resultMap.put("message", "로그인하쇼");
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	// 장바구니
	@RequestMapping(value = "/cartList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectCartList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.selectCartList(map);
			} else {
				resultMap.put("result", true);
				resultMap.put("message", "로그인하쇼");
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	//관리자 오더 관리
	@RequestMapping(value = "/adminOrderList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String adminOrderList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.selectAdminOrderList(map);
			} else {
				resultMap.put("result", true);
				resultMap.put("message", "로그인하쇼");
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	//update order
	@RequestMapping(value = "/updateOrderStatus.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateOrderStatus(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.updateOrderStatus(map);
			} else {
				resultMap.put("result", true);
				resultMap.put("message", "로그인하쇼");
			}
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	//Review
	@RequestMapping(value = "/selectMyReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectMyReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.selectMyReview(map);
			} 
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/insertMyReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertMyReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.insertMyReview(map);
			} 
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/updateMyReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateMyReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.updateMyReview(map);
			} 
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/deleteMyReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteMyReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.deleteMyReview(map);
			} 
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/selectStudyGroupForAdmin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectStudyGroupForAdmin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.selectStudyGroupForAdmin(map);
			} 
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/updateStudyGroupForAdmin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateStudyGroupForAdmin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.updateStudyGroupForAdmin(map);
			} 
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/deleteStudyGroupForAdmin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteStudyGroupForAdmin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			User user = (User) session.getAttribute("user");
			if(user != null) {
				map.put("userId", user.getUserId());
				
				resultMap = sharedHeaderService.deleteStudyGroupForAdmin(map);
			} 
		} catch(NullPointerException e) {
			resultMap.put("isLogin", false);
		}

		return new Gson().toJson(resultMap);
	}
}
