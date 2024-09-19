package com.example.bagStrap.dao;

import java.util.HashMap;

public interface JoinService {
	
	HashMap<String, Object> searchJoin(HashMap<String, Object> map);
	
	HashMap<String, Object> addJoin(HashMap<String,Object> map);
	
}
