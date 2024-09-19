	package com.example.bagStrap.model;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String userName;
	private String userNickName;
	private String password;
	private String addr;
	private String ban;
	private String status;
	private String phoneNum;
	private String cDatetime;
	private String uDatetime;
	
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
	public String getAddr() {
		return addr;
	}
	public String getBan() {
		return ban;
	}
	public String getStatus() {
		return status;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public String getcDatetime() {
		return cDatetime;
	}
	public String getuDatetime() {
		return uDatetime;
	}
}
	
