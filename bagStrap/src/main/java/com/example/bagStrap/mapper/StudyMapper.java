package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.StudyComm;


@Mapper
public interface StudyMapper {
	List<Item> searchItem(HashMap<String, Object> map);
	List<Item> searchCodes(HashMap<String, Object> map);
	
	//스터디 커뮤니티 카테고리 타입
	List<StudyComm> selectStuComm(HashMap<String, Object> map);
	//스터디 커뮤니티 리스트 
	List<StudyComm> selectStuCommList(HashMap<String, Object> map);
}
