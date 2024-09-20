package com.example.bagStrap.dao;

import java.util.HashMap;

public interface ShopService {
	HashMap<String, Object> searchItem(HashMap<String, Object> map);
	HashMap<String, Object> searchBookList(HashMap<String, Object> map);
	HashMap<String, Object> insertBookList(HashMap<String, Object> map);
	
	
}
