package com.example.bagStrap.model;

import lombok.Data;

@Data

public class Notice {
	//tbl_notice
	private int noticeId;
	private String title;
	private String content;
	private String author;
	private int hit;
	private String category;
	private String createdDate;
	private String updateDate;
	
	private String createdDateFormatted;
	
	//USERS
	private String userId;
	private String userName;
	private String userNickName;
	private String password;
	private String email;
	private String addr;
	private String ban;
	private String status;
	private String phoneNum;
	private String cDatetime;
	private String uDatetime;
	
	//tbl_faq
	private int faqId;
	private String question;
	private String answer;
	private String faqCategory;
	private String created;
	private String updated;
	
	//tbl_inquiries
	private int inquiryId;
	private String inqcategory;
	private String inqTitle;
	private String message;
	private String inqcDate;
	private String inquDate;
	private String statusAnswer;
}
