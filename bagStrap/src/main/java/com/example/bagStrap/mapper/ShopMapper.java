package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.Order;


@Mapper
public interface ShopMapper {

	int searchBookListSize(HashMap<String, Object> map);
	List<Order> searchBookList(HashMap<String, Object> map);
	Item insertBookList(HashMap<String, Object> map);
	void deleteCartItem(HashMap<String, Object> map);
	void insertCartItem(HashMap<String, Object> map);
	void changeCartItem(HashMap<String, Object> map);
	Order selectCartItem(HashMap<String, Object> map);
	void updateCartItem(HashMap<String, Object> map);
	List<Order> selectBookCategory(HashMap<String, Object> map);
	List<Order> selectMaxPrice(HashMap<String, Object> map);
	List<Order> selectBookDetail(HashMap<String, Object> map);
	int selectreviewListCount(HashMap<String, Object> map);
	List<Order> selectreviewList(HashMap<String, Object> map);

	
}
