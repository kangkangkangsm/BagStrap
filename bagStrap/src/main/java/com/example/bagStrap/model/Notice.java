package com.example.bagStrap.model;

import lombok.Data;

@Data
//tbl_notice
public class Notice {
	private int noticeId;
	private String title;
	private String content;
	private String author;
	private int hit;
	private String category;
	private String createdDate;
	private String updateDate;
	
	private String createdDateFormatted;
	
	//tbl_faq
	private int faqId;
	private String question;
	private String answer;
	private String faqCategory;
	private String created;
	private String updated;
}
