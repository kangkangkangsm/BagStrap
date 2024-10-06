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
	private String birth;
	private String gender;
	private String addressNo;
	private String address;
	private String addressDetail;
	private String zonecode;
	private String status;
	private String createdDate;
	private String updateDate;
	private String ban;
	
	//TBL_BOADRFILE
	private int fileNo;
	private int boardNo;
	private String idx;
	private String fileName;
	private String fileOrgName;
	private String filePath;
	private String userFile;
	private String fileSize;
	private String fileExt;
	private String thumbnailYN;
	private String fileCreateDate;
	
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
	public String getbirth() {
		return birth;
	}
	public String getgender() {
		return gender;	
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
	public String getban() {
		return ban;
	}
	
}
	
