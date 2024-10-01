package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.bagStrap.mapper.ShopMapper;
import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.Order;


@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	ShopMapper shopMapper;


	@Transactional
	@Override
	public HashMap<String, Object> searchBookList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap();
		
		try {
			System.out.println(map);
			int totalPages = shopMapper.searchBookListSize(map);
			List<Order> bookList = shopMapper.searchBookList(map);
			
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("bookList", bookList);
			resultMap.put("totalPages", totalPages);
			
		} catch(Exception e) {
			System.out.println("Exception : " + e);
			e.printStackTrace();
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

	@Override
	public HashMap<String, Object> insertCartItem(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap();
		try {
			map.put("quantity", 1);
			if(shopMapper.selectCartItem(map) != null) {
				shopMapper.updateCartItem(map);
			} else {
				shopMapper.insertCartItem(map);
			}
			
			resultMap.put("result", true);
			resultMap.put("message", "해당 상품이 장바구니에 추가되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
			resultMap.put("result", false);
			resultMap.put("message", "장바구니 추가에 실패했습니다.");
		}

		return resultMap;
	}

	@Override
	public HashMap<String, Object> getBookCat(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			List<Order> categoryList = shopMapper.selectBookCategory(map);
			List<Order> minMaxPrice = shopMapper.selectMaxPrice(map);
			
			resultMap.put("categoryList", categoryList);
			resultMap.put("minMaxPrice", minMaxPrice);
			resultMap.put("result", true);
			resultMap.put("message", "load category");
		}catch(Exception e) {
			e.printStackTrace();
			resultMap.put("result", false);
			resultMap.put("message", "shop sidebar exception");
		}

		return resultMap;
	}

	@Override
	public HashMap<String, Object> changeCartItem(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			shopMapper.changeCartItem(map);
			
			resultMap.put("result", true);
			resultMap.put("message", "update cartItem");
		}catch(Exception e) {
			e.printStackTrace();
			resultMap.put("result", false);
			resultMap.put("message", "update cartItem exception");
		}

		return resultMap;
	}

	@Override
	public HashMap<String, Object> selectBookDetail(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			List<Order> detailList = shopMapper.selectBookDetail(map);
			int totalPages = shopMapper.selectreviewListCount(map);
			List<Order> reviewList = shopMapper.selectreviewList(map);
			map.put("category", detailList.get(0).getCategory());
			List<Order> recommendList = shopMapper.selectRecommendedList(map);
			
			//TODO 리뷰 정보도 불러와야함
			
			resultMap.put("detailList", detailList);
			resultMap.put("totalPages", totalPages);
			resultMap.put("reviewList", reviewList);
			resultMap.put("recommendList", recommendList);
			resultMap.put("result", true);
			resultMap.put("message", "select bookDetail");
		}catch(Exception e) {
			e.printStackTrace();
			resultMap.put("result", false);
			resultMap.put("message", "select bookDetail exception");
		}

		return resultMap;
	}
	@Override
	public HashMap<String, Object> selectIntroBook(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			List<Order> categoryList = shopMapper.selectIntroBook(map);
			resultMap.put("introBook", categoryList);
			resultMap.put("result", true);
			resultMap.put("message", "인트로 북!!");
		}catch(Exception e) {
			e.printStackTrace();
			resultMap.put("result", false);
			resultMap.put("message", "인트로!");
		}

		return resultMap;
	}

	
}
