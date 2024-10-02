package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bagStrap.mapper.JoinMapper;
import com.example.bagStrap.model.User;

import jakarta.servlet.http.HttpSession;


@Service
public class JoinServiceImpl implements JoinService{

	@Autowired
	JoinMapper joinMapper;
	
	@Override
	public HashMap<String, Object> searchJoin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			System.out.println("map1 : " + map);
			List<User> list = joinMapper.joinList(map);
			System.out.println("map2 : " + map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
			resultMap.put("message", "읽어내기 성공");
		}catch(Exception e) {
			e.printStackTrace();
			resultMap.put("result", "fail");
			resultMap.put("message", "실패!!");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addJoin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			System.out.println("map3 : " + map);
			
			joinMapper.joinInsert(map);
			System.out.println("map4 : " + map);
			resultMap.put("idx",map.get("USER_NO"));
			resultMap.put("result", "success");
			resultMap.put("message", "삽입에 성공하셨습니다!!");
		}catch(Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "에러가 발생했습니다. 다시 시도해주세요!!");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> doubleCheckJoin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
	        System.out.println("map5: " + map);
	        int count = joinMapper.joinMultiCheck(map);  
	        System.out.println("중복된 아이디 개수: " + count);  

	       
	        if (count > 0) {
	            resultMap.put("result", "fail");
	            resultMap.put("message", "이미 사용 중인 아이디입니다.");
	        }else {
	            resultMap.put("result", "success");
	            resultMap.put("message", "사용 가능한 아이디입니다.");
	        }  
	        
	    } catch(Exception e) {
	        resultMap.put("result", "fail");  
	        resultMap.put("message", "서버 오류가 발생했습니다.");
	    }
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> doubleNickName(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			System.out.println("map6 : " + map);
			int count2 = joinMapper.nickNameMultiCheck(map);
			System.out.println("중복된 닉네임 개수 : " + count2);
			
			if(count2 > 0) {
				resultMap.put("result", "fail");
				resultMap.put("message", "이미 사용 중인 닉네임입니다.");
			}else {
				resultMap.put("result", "success");
				resultMap.put("message", "사용 가능한 닉네임입니다.");
			}
			
		}catch(Exception e) {
	        resultMap.put("result", "fail");  
	        resultMap.put("message", "서버 오류가 발생했습니다.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addAddress(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try{
			System.out.println("map7 : " + map);
			joinMapper.addressInsert(map);
			System.out.println("map8 : " + map);
			resultMap.put("result", "success");
			resultMap.put("message", "상세주소를 입력해주세요."); 
		}catch(Exception e) {
			 e.printStackTrace();
			resultMap.put("result", "fail");
			resultMap.put("message", "주소 저장 실패!!!!"); 
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchmyInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<User> list	 = joinMapper.myInfoList(map);
			resultMap.put("result", "success");
			resultMap.put("messsage", "마이인포성공!!");
			resultMap.put("userList", list);
		}catch(Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("messsage", "마이인포실패!!");
			e.printStackTrace();
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> reloadAddress(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			joinMapper.addressUpdate(map);
			resultMap.put("result", "success");
			resultMap.put("message","주소업데이트성공!!");
		}catch(Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "주소업데이트실패!!");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> updateNickName(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			System.out.println("map11 : " + map);
			joinMapper.nickUpdate(map);
			System.out.println("map12 : " + map);
			resultMap.put("result", "success");
			resultMap.put("message","닉네임업데이트성공!!");
		}catch(Exception e) {
			System.err.println("예외 발생: " + e.getMessage());
			resultMap.put("result", "fail");
			resultMap.put("message", "닉네임업데이트실패!!");
			e.printStackTrace();
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> QuitId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			System.out.println("map9 : " + map);
			joinMapper.deleteQuit(map);
			System.out.println("map10 : " + map);
			resultMap.put("result", "success");
			resultMap.put("message","회원탈퇴성공!!");
		}catch(Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "회원탈퇴실패!!");
			e.printStackTrace();
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> PasswordCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			System.out.println("map13" + map);
			int count3 = joinMapper.confirmPassword(map);
			System.out.println("map14" + map);
			if(count3>0) {
				resultMap.put("result", "success");
				resultMap.put("message", "비밀번호가 일치합니다.");
			} else {
				resultMap.put("result", "fail");
				resultMap.put("message", "비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			}
		}catch(Exception e) {
			resultMap.put("result", "fail");  
	        resultMap.put("message", "서버 오류가 발생했습니다.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> adminUsersCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<User> list = joinMapper.adminUsers(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
			resultMap.put("message", "리스트뽑아내기성공!!");
		}catch(Exception e) {
			e.printStackTrace();
			resultMap.put("result", "fail");
			resultMap.put("message", "리스트뽑아내기실패!!");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> updateAdminUsers(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			System.out.println("map15" + map);
			joinMapper.adminUPdate(map);
			System.out.println("map16" + map);
			resultMap.put("result", "success");
			resultMap.put("message", "차단성공!!");
		} catch(Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "차단실패!!!!!!!");
		}
		return resultMap;
	}
}
