package com.example.bagStrap.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.bagStrap.dao.BookSearchService;
import com.google.gson.Gson;

@RestController
public class NaverBookSearchController {

    @Autowired
    private BookSearchService bookSearchService;

    @GetMapping("/search1")
    public ResponseEntity<?> searchBook(@RequestParam("query") String query) {
        try {
            // 검색 결과를 가져옴
            return ResponseEntity.ok(bookSearchService.searchBooks(query));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("검색 중 오류가 발생했습니다.");
        }
    }
    

    @RequestMapping(value = "/addBook.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insertBooks(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();

        // 요청으로 받은 bookList 처리
        List<HashMap<String, Object>> bookList = (List<HashMap<String, Object>>) map.get("bookList");
        
		bookSearchService.insertBooks(bookList);

        // 데이터 처리 (예: DB에 저장 등)
        resultMap.put("status", "success");

        return new Gson().toJson(resultMap);
    }
    
}
    
