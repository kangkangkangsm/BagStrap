package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Order;


@Mapper
public interface PaymentMapper {
	List<Order> selectAddress(HashMap<String, Object> map);
	
	int updateAddressDefaultToN(HashMap<String, Object> map);
	int insertAddress(HashMap<String, Object> map);
	List<Order> selectBookList(HashMap<String, Object> map);
	void updateBookTable(HashMap<String, Object> map);
	void createOrder(HashMap<String, Object> map);
	void createOrderItem(HashMap<String, Object> map);
	void deleteCart(HashMap<String, Object> map);
	List<Order> selectMyAddress(HashMap<String, Object> map);
	void changeDefaultYN(HashMap<String, Object> map);
	void updateSaveYN(HashMap<String, Object> map);
	List<Order> checkRefund(HashMap<String, Object> map);
	void insertRefund(HashMap<String, Object> map);
	void insertRefundItem(HashMap<String, Object> map);
	int selectRefundListCount(HashMap<String, Object> map);
	List<Order> selectRefundList(HashMap<String, Object> map);
	void updateOrderStatus(HashMap<String, Object> map);
	List<Order> updateRefundStatus(HashMap<String, Object> map);
	List<Order> selectOrderComplete(HashMap<String, Object> map);
	List<Order> selectOrderCompleteStudy(HashMap<String, Object> map);

	
}	

