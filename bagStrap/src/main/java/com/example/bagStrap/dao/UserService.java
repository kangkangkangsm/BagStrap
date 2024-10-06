package com.example.bagStrap.dao;

import java.util.HashMap;

public interface UserService {
	HashMap<String, Object> login(HashMap<String, Object> map);
	HashMap<String, Object> checkAccountInfo(HashMap<String, Object> map);
	HashMap<String, Object> changePwd(HashMap<String, Object> map);

	
}
