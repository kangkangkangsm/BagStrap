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
	
	int CountNoticeList(HashMap<String, Object> map);
	
	Notice Noticeinfo(HashMap<String, Object> map);
	
	void insertNotice(HashMap<String, Object> map);
	
	List<Notice> faqlist(HashMap<String, Object> map);

	void insertInquiry(HashMap<String, Object> map);
	
	List<Notice> searchInqList(HashMap<String, Object> map);
	
	void deleteInqBoard(HashMap<String, Object> map);
	
	void deleteInq(HashMap<String, Object> map);
	
	List<Notice> historyInq(HashMap<String, Object> map);
	
	void updateInq(HashMap<String, Object> map);
	
	int CountInqList(HashMap<String, Object> map);
	
	void insertInqAnswer(HashMap<String, Object> map);
	
	Notice Answerinfo(HashMap<String, Object> map);
}
