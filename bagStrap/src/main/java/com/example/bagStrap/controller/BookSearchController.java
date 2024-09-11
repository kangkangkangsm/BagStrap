package com.example.bagStrap.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class BookSearchController {

    private static final String KAKAO_API_KEY = "2f08d038d65384d4cd73c73993f414c6";  // 발급받은 Kakao API Key

    @GetMapping("/search")
    public String searchPage() {
        return "search"; // 검색창을 띄울 JSP 파일
    }

    @GetMapping("/searchBook")
    public String searchBook(@RequestParam("query") String query, Model model) {
        String apiUrl = "https://dapi.kakao.com/v3/search/book?target=title&query=" + query;

        // Kakao API 호출을 위한 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK " + KAKAO_API_KEY);
        
        HttpEntity<String> entity = new HttpEntity<>(headers);
        RestTemplate restTemplate = new RestTemplate();

        // Kakao API 호출
        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);
        System.out.println(response);
        // JSON 결과를 JSP로 전달
        model.addAttribute("books", response.getBody());
        return "result";  // 검색 결과를 보여줄 JSP 파일
    }
    
    
}
