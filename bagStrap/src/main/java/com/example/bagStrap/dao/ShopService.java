package com.example.bagStrap.dao;

import java.util.HashMap;

public interface ShopService {
	HashMap<String, Object> searchBookList(HashMap<String, Object> map);
	HashMap<String, Object> insertBookList(HashMap<String, Object> map);
	HashMap<String, Object> deleteCartItem(HashMap<String, Object> map);
	HashMap<String, Object> insertCartItem(HashMap<String, Object> map);
	HashMap<String, Object> changeCartItem(HashMap<String, Object> map);
	HashMap<String, Object> getBookCat(HashMap<String, Object> map);
	HashMap<String, Object> selectBookDetail(HashMap<String, Object> map);
	HashMap<String, Object> selectIntroBook(HashMap<String, Object> map);
	
}
