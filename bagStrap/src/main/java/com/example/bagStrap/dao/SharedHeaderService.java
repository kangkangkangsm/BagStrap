package com.example.bagStrap.dao;

import java.util.HashMap;

public interface SharedHeaderService {
	HashMap<String, Object> searchItem(HashMap<String, Object> map);
	HashMap<String, Object> selectNotification(HashMap<String, Object> map);
	HashMap<String, Object> selectOrderList(HashMap<String, Object> map);
	HashMap<String, Object> selectCartList(HashMap<String, Object> map);
	HashMap<String, Object> selectOrderListForRefund(HashMap<String, Object> map);
	HashMap<String, Object> selectAdminOrderList(HashMap<String, Object> map);
	HashMap<String, Object> updateOrderStatus(HashMap<String, Object> map);
	HashMap<String, Object> selectMyReview(HashMap<String, Object> map);
	HashMap<String, Object> insertMyReview(HashMap<String, Object> map);
	HashMap<String, Object> updateMyReview(HashMap<String, Object> map);
	HashMap<String, Object> deleteMyReview(HashMap<String, Object> map);
	HashMap<String, Object> selectStudyGroupForAdmin(HashMap<String, Object> map);
	HashMap<String, Object> updateStudyGroupForAdmin(HashMap<String, Object> map);
	HashMap<String, Object> deleteStudyGroupForAdmin(HashMap<String, Object> map);
	
}
