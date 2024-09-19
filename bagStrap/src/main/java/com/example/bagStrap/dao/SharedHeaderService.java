package com.example.bagStrap.dao;

import java.util.HashMap;

public interface SharedHeaderService {
	HashMap<String, Object> searchItem(HashMap<String, Object> map);
	HashMap<String, Object> selectOrderList(HashMap<String, Object> map);
	HashMap<String, Object> selectOrderListForRefund(HashMap<String, Object> map);

}
