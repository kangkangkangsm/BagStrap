package com.example.bagStrap.dao;

import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public interface CSCenterService {
	HashMap<String, Object> searchCS (HashMap<String, Object> map);
	
	//목록
	HashMap<String, Object> NoticeList(HashMap<String, Object> map);
	
	//상세 조회
	HashMap<String, Object> searchNoticeInfo(HashMap<String, Object> map);
	
	// 공지사항 등록
	HashMap<String, Object> addNotice(HashMap<String, Object> map);
	
	//목록(faq)
	HashMap<String, Object> FaqList(HashMap<String, Object> map);
	
	//faq카테고리
	
	
	//문의 등록
	HashMap<String, Object> addInquiry(HashMap<String, Object> map);
	
	//내 문의
	HashMap<String, Object> selectInq(HashMap<String, Object> map);
	
	//문의 선택 삭제
	HashMap<String, Object> removeInqBoard(HashMap<String, Object> map);
	
	//문의 삭제
	HashMap<String, Object> deleteInq(HashMap<String, Object> map);
	
	//목록(문의)
	HashMap<String, Object> InqList(HashMap<String, Object> map);
	
	//답변 상태 업데이트
	HashMap<String, Object> updateInqList(HashMap<String, Object> map);
	
	//답변 등록
	HashMap<String, Object> addInqAnswer(HashMap<String, Object> map);
	
	//답변 상세
	HashMap<String, Object> searchAnswerInfo(HashMap<String, Object> map);
}
