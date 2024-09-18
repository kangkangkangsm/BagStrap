package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bagStrap.mapper.CSCenterMapper;
import com.example.bagStrap.model.StudyComm;

@Service
public class CSCenterServiceImpl implements CSCenterService{
	
	@Autowired
	CSCenterMapper CSMapper;

	@Override
	public HashMap<String, Object> searchCS(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap=new HashMap<String, Object>();
		List<StudyComm> list =CSMapper.searchList(map);
		
		resultMap.put("list", list);
		resultMap.put("result", "success");
		
		return resultMap;
	}

}
