	package com.example.bagStrap.model;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String userName;
	private String userNickName;
	private String password;
	private String email;
	private String phone;
	private String cDatetime;
	private String birth;
	private String gender;
	private String addressNo;
	private String address;
	private String addressDetail;
	private String zonecode;
	private String status;
	
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
	public String getPhone() {
		return phone;
	}
	public String getcDatetime() {
		return cDatetime;
	}
	public String getbirth() {
		return birth;
	}
	public String getgender() {
		return gender;
		
	}
	public String getstatus() {
		return status;
		
	}
	public String getaddressNo() {
		return addressNo;
	}
	public String getaddress() {
		return address;
	}
	public String getaddressDetail() {
		return zonecode;
	}
}
	
