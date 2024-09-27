package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bagStrap.mapper.ShopMapper;
import com.example.bagStrap.model.Item;


@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	ShopMapper shopMapper;


	@Override
	public HashMap<String, Object> searchItem(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap();
		
		try {
			List<Item> list = shopMapper.searchItem(map);
			List<Item> codeList = shopMapper.searchCodes(map);
			
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
	public HashMap<String, Object> searchBookList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap();
		
		try {
			List<Item> bookList = shopMapper.searchBookList(map);
			
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("bookList", bookList);
			
		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
	
		return resultMap;
	}

	@Override
	public HashMap<String, Object> insertBookList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		
		try {
			Item insertBookList = shopMapper.insertBookList(map);
			
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("insertBookList", insertBookList);
			
		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> deleteCartItem(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap();
		try {
			shopMapper.deleteCartItem(map);
			resultMap.put("result", true);
			resultMap.put("message", "해당 상품이 장바구니에서 삭제되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
			resultMap.put("result", false);
			resultMap.put("message", "삭제에 실패했습니다.");
		}

		return resultMap;
	}

	
}
