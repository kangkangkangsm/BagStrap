package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

@Service
public interface PaymentService {
	ResponseEntity<Map> refund (HashMap<String, Object> refundMap, HashMap<String, Object> tokenMap);
	ResponseEntity<Map> getToken(HashMap<String, Object> map);
	HashMap<String, Object> createOrder(HashMap<String, Object> map);

	
}
