package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Notice;
import com.example.bagStrap.model.StudyComm;

@Mapper
public interface CSCenterMapper {
	List<StudyComm> searchList (HashMap<String, Object> map);
	
	List<Notice> searchNotice(HashMap<String, Object> map);
	
	Notice Noticeinfo(HashMap<String, Object> map);
	
	void insertNotice(HashMap<String, Object> map);
	
	List<Notice> faqlist(HashMap<String, Object> map);
}
