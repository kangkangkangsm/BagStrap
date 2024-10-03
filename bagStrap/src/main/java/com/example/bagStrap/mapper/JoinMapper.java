package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.User;

@Mapper
public interface JoinMapper {

	List<User> joinList(HashMap<String, Object> map);
	
	void joinInsert(HashMap<String, Object> map);
	
	int joinMultiCheck(HashMap<String, Object> map);
	
	int nickNameMultiCheck(HashMap<String, Object> map);
	
	/*주소추가*/
	void addressInsert(HashMap<String, Object> map);
	
	List<User> myInfoList(HashMap<String, Object> map);
	
	void addressUpdate(HashMap<String, Object> map);
	
	void nickUpdate(HashMap<String, Object> map);
	
	void deleteQuit(HashMap<String, Object> map);
	
	/* 탈퇴시 비밀번호 일치 확인 */
	int confirmPassword (HashMap<String, Object> map);
	
	List<User> adminUsers (HashMap<String, Object> map);
	
	void adminUPdate (HashMap<String, Object> map);
	
	int banExtra(HashMap<String, Object> map);
}
