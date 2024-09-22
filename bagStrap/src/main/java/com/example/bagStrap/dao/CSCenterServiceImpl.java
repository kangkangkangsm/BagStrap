package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bagStrap.mapper.CSCenterMapper;
import com.example.bagStrap.model.Notice;
import com.example.bagStrap.model.StudyComm;

@Service
public class CSCenterServiceImpl implements CSCenterService{
	
	@Autowired
	CSCenterMapper CSMapper;

	@Override
	public HashMap<String, Object> searchCS(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap=new HashMap<String, Object>();
		List<StudyComm> list = CSMapper.searchList(map);
		
		resultMap.put("list", list);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> NoticeList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap=new HashMap<String, Object>();
		List<Notice> list=CSMapper.searchNotice(map);
		
		resultMap.put("list", list);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchNoticeInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			System.out.println(map);
			Notice notice=CSMapper.Noticeinfo(map);
			System.out.println(map);
			
			resultMap.put("info", notice);
			
			resultMap.put("result", "success");
			resultMap.put("message", "검색되었습니다.");
			
		}catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다. \n나중에 다시 시도해주세요.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> FaqList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Notice> list=CSMapper.faqlist(map);
		
		resultMap.put("list", list);
		resultMap.put("result", "success");
		
		return resultMap;
	}

}
