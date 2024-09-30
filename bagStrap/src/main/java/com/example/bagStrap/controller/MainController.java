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
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

    @Autowired
    ShopService shopService;
    @Autowired
    HttpSession session;
    
    @RequestMapping("/main") 
    public String main3(Model model) throws Exception {
        return "intro/main";
    }

    
    @RequestMapping("/main2") 
    public String main2(Model model) throws Exception {
        return "intro/main2";
    }



}