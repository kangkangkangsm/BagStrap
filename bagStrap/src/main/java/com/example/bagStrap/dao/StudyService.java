package com.example.bagStrap.dao;

import java.util.HashMap;

public interface StudyService {
	HashMap<String, Object> searchItem(HashMap<String, Object> map);
	
	//스터디 커뮤니티 카테고리 타입
	HashMap<String, Object> selectStuComm(HashMap<String, Object> map);
	
	HashMap<String, Object> selectStuCommListBoard(HashMap<String, Object> map);
	
}
