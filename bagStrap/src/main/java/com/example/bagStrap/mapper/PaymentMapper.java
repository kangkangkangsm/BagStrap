package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Order;


@Mapper
public interface PaymentMapper {
	List<Order> selectAddress(HashMap<String, Object> map);
	int insertAddress(HashMap<String, Object> map);
	List<Order> selectBookList(HashMap<String, Object> map);
	void updateBookTable(HashMap<String, Object> map);
	void createOrder(HashMap<String, Object> map);
	void createOrderItem(HashMap<String, Object> map);

	
}
