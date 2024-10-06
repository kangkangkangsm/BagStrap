package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.Notification;
import com.example.bagStrap.model.Order;
import com.example.bagStrap.model.RefundReason;
import com.example.bagStrap.model.StudyComm;


@Mapper
public interface SharedHeaderMapper {
	List<Item> searchItem(HashMap<String, Object> map);
	List<Item> searchCodes(HashMap<String, Object> map);
	int selectOrderListCount(HashMap<String, Object> map);
	List<Order> selectOrderList(HashMap<String, Object> map);
	List<Integer> selectOrderYear(HashMap<String, Object> map);
	List<Order> selectOrderListForRefund(HashMap<String, Object> map);
	List<RefundReason> selectRefundReasonList();
	List<Order> selectCartList(HashMap<String, Object> map);
	int selectAdminOrderListCount(HashMap<String, Object> map);
	List<Order> selectAdminOrderList(HashMap<String, Object> map);
	void updateOrderStatus(HashMap<String, Object> map);
	Order selectMyReview(HashMap<String, Object> map);
	void insertMyReview(HashMap<String, Object> map);
	void updateMyReview(HashMap<String, Object> map);
	void deleteMyReview(HashMap<String, Object> map);
	int selectStudyGroupForAdminCount(HashMap<String, Object> map);
	List<StudyComm> selectStudyGroupForAdmin(HashMap<String, Object> map);
	void updateStudyGroupForAdmin(HashMap<String, Object> map);
	void deleteStudyGroupForAdmin(HashMap<String, Object> map);
	int selectNotificationCount(HashMap<String, Object> map);
	List<Notification> selectNotification(HashMap<String, Object> map);
	void updateNoti(HashMap<String, Object> map);
	void deleteNoti(HashMap<String, Object> map);

	
}
