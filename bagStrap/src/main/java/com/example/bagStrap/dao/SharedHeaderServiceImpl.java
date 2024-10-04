package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.bagStrap.mapper.SharedHeaderMapper;
import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.Notification;
import com.example.bagStrap.model.Order;
import com.example.bagStrap.model.RefundReason;
import com.example.bagStrap.model.StudyComm;


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

	@Transactional
	@Override
	public HashMap<String, Object> selectOrderList(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap();

		try {
			int totalPages = sharedHeaderMapper.selectOrderListCount(map);
			List<Order> orderList = sharedHeaderMapper.selectOrderList(map);
			List<Integer> orderYear = sharedHeaderMapper.selectOrderYear(map);
			
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("totalPages", totalPages);
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
			List<RefundReason> refundReasonList = sharedHeaderMapper.selectRefundReasonList();
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("orderList", orderList);
			resultMap.put("refundReasonList", refundReasonList);
			
		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}


		
		return resultMap;
	}


	@Override
	public HashMap<String, Object> selectCartList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub

		HashMap<String, Object> resultMap = new HashMap();

		try {
			List<Order> cartList = sharedHeaderMapper.selectCartList(map);
			
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("cartList", cartList);
			
		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}


		
		return resultMap;
	}

	@Transactional
	@Override
	public HashMap<String, Object> selectAdminOrderList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			
			int totalPages= sharedHeaderMapper.selectAdminOrderListCount(map);
			List<Order> orderList = sharedHeaderMapper.selectAdminOrderList(map);
			orderList.forEach(item -> {
				if(item.getRejectComment() == null) {
					item.setRejectComment("");
				}
			});
			
			resultMap.put("result", true);
			resultMap.put("message", "selectAdminOrderList");
			resultMap.put("orderList", orderList);
			resultMap.put("totalPages", totalPages);
			
		} catch(Exception e) {
			e.printStackTrace();
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}


		
		return resultMap;
	}


	@Override
	public HashMap<String, Object> updateOrderStatus(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();

		try {
			sharedHeaderMapper.updateOrderStatus(map);
			
			resultMap.put("result", true);
			resultMap.put("message", "주문 상태 변경됨");
			
		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		
		return resultMap;
	}


	@Override
	public HashMap<String, Object> selectMyReview(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			Order myReview = sharedHeaderMapper.selectMyReview(map);
			if(myReview != null) {
				resultMap.put("result", true);
				resultMap.put("myReview", myReview);	
				resultMap.put("message", "exist my review");

			} else {
				resultMap.put("result", false);
				resultMap.put("message", "don't exist my review");
			}
		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> insertMyReview(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			sharedHeaderMapper.insertMyReview(map);
				resultMap.put("result", true);
				resultMap.put("message", "작성되었습니다.");


		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> updateMyReview(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			sharedHeaderMapper.updateMyReview(map);
				resultMap.put("result", true);
				resultMap.put("message", "수정되었습니다.");

		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	@Override
	public HashMap<String, Object> deleteMyReview(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			sharedHeaderMapper.deleteMyReview(map);
				resultMap.put("result", true);
				resultMap.put("message", "삭제되었습니다.");

		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> selectStudyGroupForAdmin(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			int totalPages = sharedHeaderMapper.selectStudyGroupForAdminCount(map);
			List<StudyComm> studyList = sharedHeaderMapper.selectStudyGroupForAdmin(map);
			if(studyList != null) {
				resultMap.put("result", true);
				resultMap.put("totalPages", totalPages);	
				resultMap.put("studyList", studyList);	
				resultMap.put("message", "exist my studyList");

			} else {
				resultMap.put("result", false);
				resultMap.put("message", "don't exist my studyList");
			}
		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> updateStudyGroupForAdmin(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			sharedHeaderMapper.updateStudyGroupForAdmin(map);
				resultMap.put("result", true);
				resultMap.put("message", "승인되었습니다.");

		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> deleteStudyGroupForAdmin(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			sharedHeaderMapper.deleteStudyGroupForAdmin(map);
				resultMap.put("result", true);
				resultMap.put("message", "거절되었습니다.");

		} catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}

	@Transactional
	@Override
	public HashMap<String, Object> selectNotification(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			int totalPages = sharedHeaderMapper.selectNotificationCount(map);
			List<Notification> notiList = sharedHeaderMapper.selectNotification(map);
			System.out.println(totalPages);
			resultMap.put("totalPages", totalPages);
			resultMap.put("notiList", notiList);
			resultMap.put("result", true);
			resultMap.put("message", "notification");

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}

}
