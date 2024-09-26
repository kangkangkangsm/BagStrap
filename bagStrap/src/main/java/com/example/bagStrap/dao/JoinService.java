package com.example.bagStrap.dao;

import java.util.HashMap;

import com.example.bagStrap.model.User;

import jakarta.servlet.http.HttpSession;

public interface JoinService {
	
	HashMap<String, Object> searchJoin(HashMap<String, Object> map);
	
	HashMap<String, Object> addJoin(HashMap<String,Object> map);
	
	HashMap<String, Object> doubleCheckJoin(HashMap<String, Object> map);
	
	HashMap<String, Object> doubleNickName(HashMap<String, Object> map);
	
	HashMap<String, Object> addAddress(HashMap<String, Object> map);
	
	HashMap<String, Object> searchmyInfo(HashMap<String, Object> map);

	HashMap<String, Object> searchMyinfoAddress(HashMap<String, Object> map);

}
