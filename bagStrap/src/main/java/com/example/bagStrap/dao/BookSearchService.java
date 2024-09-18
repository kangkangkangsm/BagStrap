package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.example.bagStrap.mapper.BookSearchMapper;

@Service
public class BookSearchService {

	@Autowired
	BookSearchMapper bookSearchMapper;
    @Value("${naver.api.url}")
    private String naverApiUrl;

    @Value("${naver.api.client.id}")
    private String clientId;

    @Value("${naver.api.client.secret}")
    private String clientSecret;
    

    public Map<String, Object> searchBooks(String query) {
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.set("X-Naver-Client-Id", clientId);
        headers.set("X-Naver-Client-Secret", clientSecret);
        
        HttpEntity<String> entity = new HttpEntity<>(headers);
        
        String url = String.format("%s?query=%s", naverApiUrl, query);
        
        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, entity, Map.class);
        return response.getBody();
    
    }
    public void insertBooks(List<HashMap<String, Object>> bookList) {
    	bookSearchMapper.insertBooks(bookList);
    }
}
