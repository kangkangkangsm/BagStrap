package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Join;

@Mapper
public interface JoinMapper {

	List<Join> joinList(HashMap<String, Object> map);
	
	void joinInsert(HashMap<String, Object> map);
	
}
