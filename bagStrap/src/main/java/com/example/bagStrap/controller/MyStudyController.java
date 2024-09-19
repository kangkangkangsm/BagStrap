package com.example.bagStrap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyStudyController {

	@RequestMapping("/calendar.do") 
    public String calendar(Model model) throws Exception{

<<<<<<< song
        return "/study/calendar";
=======
        return "/calendar";
>>>>>>> main
    }
}