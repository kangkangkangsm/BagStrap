	package com.example.bagStrap.model;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String userName;
	private String userNickName;
	private String password;
	private String email;
	private String phoneNum;
	private String cDatetime;
	private String birth;
	private String gender;
	private String addressNo;
	
	public String getUserId() {
		return userId;
	}
	public String getUserName() {
		return userName;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public String getPassword() {
		return password;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public String getcDatetime() {
		return cDatetime;
	}
	public String birth() {
		return birth;
	}
	public String gender() {
		return gender;
		
	}
}
	
