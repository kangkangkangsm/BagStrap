package com.example.bagStrap.model;

import java.sql.Date;

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
	private String boardstatus;
	private int views;
	private int likes;
	private String createdDateFormatted;
	private int cnt;
	private int cnt2;
	private int cnt3;
	private int cnt4;
	private int cntLike;
//TBL_STU_COMMENTS
	private String commentId;
	private String postId;
	private String parentCommentId;
	private String comcontents;
	private String comCreateDay;
	private String comUpdateDay;
	private String commentstatus;
	private int commentCnt;
	private String upMode;
	private String reMode;
	private String reUserId;
	private String reNickName;
//TBL_STU_COMM_BOARD_TYPES
	private int boardTypeId;
	private String name;
	
//USERS
	private String userId;
	private String userNo;
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
//TBL_LIKES
	private int likeId;
	private String likeUserId;
	private String targetId;
	private String targetType;
	private String likeDate;	
	private int likeCnt;
	private int commLikeCnt;
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
//TBL_STUDY_GROUP
		private int studyGroupId;
		private String studyAdminId;
		private int subjectTypeId;
		private String description;
		private String relatedBook;
		private String onOffMode;
		private int participants;
		private int maxparticipants;
		private String startdate;
		private String enddate;
		private String studytime;
		private String age;
		private String groupStatus;
		private String groupPassword;
		private String mypageStatus;
		private String genderGroup;
		private String groupPublic;
		private String relatedBookDirect;
		private String stgStartDate;
		private String stgEndDate;
		private String stgStudyTime;
		private int groupCnt;
		private String studyName;
		private int applyCnt;
		
	
		
//TBL_STUDY_APPLICATION
		private int fetchapplicationid;
		private int fetchappstudyid;
		private String fetchappuserid;
		private String selfintro;
		private String studygoal;
		private String stustatus;
		private String additionalquestions;
		private String fetchapplication_date;
		private String fetchapplstatus;
		private int applyY;
		private int applyN;
		private String rejectionMessage;
		private String sgHide;
		
//Book
		private Long bookId;            // 책 고유번호
	    private String publisher;       // 출판사
	    private String image;           // 책 이미지
	    private Long category;          // 카테고리 번호
	    private String ebook;           // 전자책 여부
		private String quantity;
		private String tbDescription;
		
//TBL_MESSAGE
		private int messageId;           
	    private int messageStudyGroupId;       
	    private String messageUserId;           
	    private String messageContent;         
	    private String messageType;           
		private String messageReplyToId;
		private String messageCreatedDate;
		private String messageIsDeleted;
		private String mFilepath;
						
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
	

