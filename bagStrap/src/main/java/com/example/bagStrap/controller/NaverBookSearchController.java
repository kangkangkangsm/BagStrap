package com.example.bagStrap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.bagStrap.dao.BookSearchService;

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
}
