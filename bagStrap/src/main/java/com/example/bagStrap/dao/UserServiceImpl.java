package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bagStrap.mapper.DefaultMapper;
import com.example.bagStrap.mapper.UserMapper;
import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.User;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;


	@Override
	public HashMap<String, Object> login(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap();
		
		try {
			User userInfo = userMapper.login(map);
			if(userInfo.getPassword().equals(map.get("password"))) {
				resultMap.put("result", true); 
				resultMap.put("userInfo", userInfo);
				resultMap.put("message", userInfo.getUserNickName()+"님 환영합니다.");
				
				
			} else {
				resultMap.put("result", false);
				//TODO 닉네임 정보 확인 후 메세지 작성 : 
				resultMap.put("message", "비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.");
				
			}
			
		} catch(NullPointerException e) {
			resultMap.put("result", false);
			resultMap.put("message", "존재하지않는 아이디입니다. 아이디를 확인해주세요.");
		}
		catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요.");
		}


		
		return resultMap;
	}

	
}
