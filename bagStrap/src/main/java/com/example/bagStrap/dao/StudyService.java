package com.example.bagStrap.dao;

import java.util.HashMap;

public interface StudyService {
	HashMap<String, Object> searchItem(HashMap<String, Object> map);
	//
	//스터디 사이드바 커뮤니티 카테고리 타입
	HashMap<String, Object> selectStuComm(HashMap<String, Object> map);
	//스터디 사이드바 나의 게시글 개수
	HashMap<String, Object> sidebarCnt(HashMap<String, Object> map);
	//스터디 커뮤니티 컨텐츠 
	HashMap<String, Object> selectStuCommListBoard(HashMap<String, Object> map);
	//나의 게시글, 댓글 목록
	HashMap<String, Object> myCnt(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 상세보기
	HashMap<String, Object> selectCommView(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 상세보기 댓글작성
	HashMap<String, Object> insertViewComment(HashMap<String, Object> map);
}
