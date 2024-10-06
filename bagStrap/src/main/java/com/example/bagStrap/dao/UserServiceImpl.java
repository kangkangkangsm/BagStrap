package com.example.bagStrap.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.bagStrap.mapper.UserMapper;
import com.example.bagStrap.model.User;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;

	@Transactional
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
	@Transactional
	@Override
	public HashMap<String, Object> checkAccountInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap();
		try {
			if(map.get("flg").toString().equals("id")) {
				User userInfo = userMapper.selectId(map);
				if(userInfo != null) {
					resultMap.put("result", true); 
					resultMap.put("userInfo", userInfo);				
					resultMap.put("confirm", "confirmId");				
				} else {
					resultMap.put("result", false);
					resultMap.put("message", "존재하지않는 회원정보입니다.");
				}
			} else if (map.get("flg").toString().equals("pwd")) {
				User userInfo = userMapper.selectPwd(map);
				if(userInfo != null) {
					resultMap.put("result", true); 
					resultMap.put("userInfo", userInfo);	
					resultMap.put("confirm", "confirmPwd");
				} else {
					resultMap.put("result", false);
					resultMap.put("message", "존재하지않는 회원정보입니다.");
				}
			}
		} catch(NullPointerException e) {
			resultMap.put("result", false);
			resultMap.put("message", "널널~합니다~");
		}
		catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요.");
		}
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> changePwd(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
				userMapper.changePwd(map);
				resultMap.put("result", true); 
				resultMap.put("message", "비밀번호가 변경되었습니다.");		
		} catch(NullPointerException e) {
			resultMap.put("result", false);
			resultMap.put("message", "비밀번호 변경에 실패했습니다.");
		}
		catch(Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "비밀번호 변경에 실패했습니다.");
		}
		return resultMap;
	}

	
}
