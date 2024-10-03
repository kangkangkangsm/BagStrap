package com.example.bagStrap.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bagStrap.dao.ShopService;
import com.example.bagStrap.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ShopController {

    @Autowired
    ShopService shopService;
    @Autowired
    HttpSession session;
    
    // 이미지 목록 설정
    private List<String> imageUrls = Arrays.asList(
        "/src/sample1.png",
        "/src/sample2.png",
        "/src/sample3.png"
    );
    
    private int currentImageIndex = 0;
    
    @RequestMapping("/shop") 
    public String shop(Model model) throws Exception {
        return "shop/shop_home";
    }

    @RequestMapping("/shop/list") 
    public String shopList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		 request.setAttribute("category", map.get("category"));
        return "shop/shop_list";
    }
    @RequestMapping("/shop/detail") 
    public String shopDetail(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		 request.setAttribute("bookId", map.get("bookId"));
        return "shop/shop_detail";
    }
    
    
    

    @RequestMapping(value = "/bookList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String shop(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        System.out.println(map);
        HashMap<String, Object> resultMap = new HashMap<>();
      
		System.out.println(map);
		resultMap = shopService.searchBookList(map);

        
        return new Gson().toJson(resultMap);
    }
    

    @RequestMapping(value = "/insertBookList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insertBookList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
      
		resultMap = shopService.insertBookList(map);

        
        return new Gson().toJson(resultMap);
    }
    
    @RequestMapping(value = "/deleteCartItem.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String deleteCartItem(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        
        User user = (User) session.getAttribute("user");
        map.put("userId", user.getUserId());
		resultMap = shopService.deleteCartItem(map);

        
        return new Gson().toJson(resultMap);
    }

    @RequestMapping(value = "/insertCartItem.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insertCartItem(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        
        User user = (User) session.getAttribute("user");
        if(user.getUserId() != null) {
            map.put("userId", user.getUserId());
    		resultMap = shopService.insertCartItem(map);	
        }

        
        return new Gson().toJson(resultMap);
    }
    @RequestMapping(value = "/changeCartItem.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changeCartItem(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        
        User user = (User) session.getAttribute("user");
        if(user.getUserId() != null) {
            map.put("userId", user.getUserId());
    		resultMap = shopService.changeCartItem(map);	
        }

        
        return new Gson().toJson(resultMap);
    }
    @RequestMapping(value = "/getBookCat.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getBookCat(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();


    		resultMap = shopService.getBookCat(map);	

        
        return new Gson().toJson(resultMap);
    }
    @RequestMapping(value = "/selectBookDetail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String selectBookDetail(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();

	        User user = (User) session.getAttribute("user");
	        if(user != null) {
	            map.put("userId", user.getUserId());
	        }
			resultMap = shopService.selectBookDetail(map);	

        
        return new Gson().toJson(resultMap);
    }
    @RequestMapping(value = "/selectIntroBook.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String selectIntroBook(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    	HashMap<String, Object> resultMap = new HashMap<>();
   			resultMap = shopService.selectIntroBook(map);	  
        return new Gson().toJson(resultMap);
    }
}