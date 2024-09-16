	package com.example.bagStrap.model;

import lombok.Data;

@Data
//TBL_STU_COMM
public class StudyComm {
	private String boardId;
	private String boardType;
	private String title;
	private String content;
	private String author;
	private String createdDate;
	private String updateDate;
	private int views;
	private int likes;
	
//TBL_STU_COMMENTS
	private String commentId;
	private String postId;
	private String parentCommentId;

//TBL_STU_COMM_BOARD_TYPES
	private int boardTypeId;
	private String name;
	
//USERS
	private String userId;
	private String userName;
	private String userNickname;
	private String password;
	private String email;
	private String addr;
	private String ban;
	private String status;
	private String phoneNum;
	private String cDatetime;
	private String uDatetime;
}
	
