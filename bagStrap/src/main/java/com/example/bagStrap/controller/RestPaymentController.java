package com.example.bagStrap.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.bagStrap.dao.PaymentService;
import com.google.gson.Gson;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@RestController
public class RestPaymentController {
	
	@Autowired
	PaymentService paymentService;
	
	@Value("${IMP_API_KEY}")
    private String apiKey;
	 
    @Value("${IMP_API_SECRETKEY}")
    private String secretKey;
	
	@RequestMapping(value = "/refund.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String payment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap();
		ResponseEntity<Map> resultValue = null;		
		try {
			HashMap<String, Object> tokenMap = getToken();
			resultValue = paymentService.refund(map, tokenMap);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
		return new Gson().toJson(resultValue);
	}

    
	public HashMap<String, Object> getToken() throws Exception {
        Gson gson = new Gson();

        // 요청 본문 (JSON 형식의 데이터)
        HashMap<String, Object> impMap = new HashMap<String, Object>();
        impMap.put("imp_key", apiKey);
        impMap.put("imp_secret", secretKey);
        String jsonBody = gson.toJson(impMap);
        
        HashMap<String, Object> resultMap = (HashMap<String, Object>) paymentService.getToken(impMap).getBody(); 
        HashMap<String, Object> response = (HashMap<String, Object>) resultMap.get("response");
        
        return response;
	}
}

