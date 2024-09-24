	package com.example.bagStrap.model;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String userName;
	private String userNickName;
	private String password;
	private String email;
	private String addr;
	private String ban;
	private String status;
	private String phone;
	private String createdDate;
	private String updateDate;
	private int birth;
	private int gender;
	
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
	public String getPhone() {
		return phone;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public String getuUpdateDate() {
		return updateDate;
	}
	public String getEmail() {
		return email;
	}
}
	
