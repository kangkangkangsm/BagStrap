package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.Order;
import com.example.bagStrap.model.RefundReason;


@Mapper
public interface SharedHeaderMapper {
	List<Item> searchItem(HashMap<String, Object> map);
	List<Item> searchCodes(HashMap<String, Object> map);
	List<Order> selectOrderList(HashMap<String, Object> map);
	List<Integer> selectOrderYear(HashMap<String, Object> map);
	List<Order> selectOrderListForRefund(HashMap<String, Object> map);
	List<RefundReason> selectRefundReasonList();
	
}
