package com.example.bagStrap.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class BookSearchService {

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
}
