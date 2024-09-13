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
	

}
	
