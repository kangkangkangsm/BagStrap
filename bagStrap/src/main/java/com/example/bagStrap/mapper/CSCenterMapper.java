package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.StudyComm;

@Mapper
public interface CSCenterMapper {
	List<StudyComm> searchList (HashMap<String, Object> map);
}
