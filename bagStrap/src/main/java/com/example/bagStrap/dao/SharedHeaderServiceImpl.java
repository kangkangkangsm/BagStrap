package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bagStrap.mapper.SharedHeaderMapper;
import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.Order;


@Service
public class SharedHeaderServiceImpl implements SharedHeaderService{

	@Autowired
	SharedHeaderMapper sharedHeaderMapper;


	@Override
	public HashMap<String, Object> searchItem(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap();
		
		try {
			List<Item> list = sharedHeaderMapper.searchItem(map);
			List<Item> codeList = sharedHeaderMapper.searchCodes(map);
			
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("list", list);
			resultMap.put("codeList", codeList);
			
		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}


		
		return resultMap;
	}

	
	@Override
	public HashMap<String, Object> selectOrderList(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap();

		try {
			List<Order> orderList = sharedHeaderMapper.selectOrderList(map);
			List<Integer> orderYear = sharedHeaderMapper.selectOrderYear(map);
			
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("orderList", orderList);
			resultMap.put("orderYear", orderYear);
			
		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}


		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> selectOrderListForRefund(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap();

		try {
			List<Order> orderList = sharedHeaderMapper.selectOrderListForRefund(map);
			
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("orderList", orderList);
			
		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}


		
		return resultMap;
	}
	
}
