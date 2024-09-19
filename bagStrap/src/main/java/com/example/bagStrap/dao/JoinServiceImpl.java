package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bagStrap.mapper.IntroMapper;
import com.example.bagStrap.mapper.JoinMapper;
import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.Join;


@Service
public class JoinServiceImpl implements JoinService{

	@Autowired
	JoinMapper joinMapper;
	
	@Override
	public HashMap<String, Object> searchJoin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Join> list = joinMapper.joinList(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
			resultMap.put("message", "읽어내기 성공");
		}catch(Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "실패!!!!");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addJoin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			joinMapper.joinInsert(map);
			resultMap.put("result", "success");
			resultMap.put("message", "삽입성공");
		}catch(Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "실패!!!!");
		}
		return resultMap;
	}
	
}
