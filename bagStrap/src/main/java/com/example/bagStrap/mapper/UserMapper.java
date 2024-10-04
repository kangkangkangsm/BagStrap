package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.User;


@Mapper
public interface UserMapper {
	User login(HashMap<String, Object> map);
	User selectId(HashMap<String, Object> map);
	User selectPwd(HashMap<String, Object> map);
	void changePwd(HashMap<String, Object> map);
}
