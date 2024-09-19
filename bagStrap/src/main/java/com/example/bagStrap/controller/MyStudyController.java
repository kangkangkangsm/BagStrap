package com.example.bagStrap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyStudyController {

	@RequestMapping("/study_calendar.do") 
    public String calendar(Model model) throws Exception{

        return "study/calendar";
    }
}