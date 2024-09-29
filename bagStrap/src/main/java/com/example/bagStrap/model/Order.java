	package com.example.bagStrap.model;

import java.math.BigDecimal;
import java.sql.Date;

import lombok.Data;

@Data
public class Order {
	private String orderdateYear;                // 주문 날짜(년월일)
	private String arriveddateDay;                // 주문 날짜(월일 요일)
	private String year;                // 주문 식별 ID
	//Order
    private String orderId;                // 주문 식별 ID
    private String userId;                 // 회원 이름
    private Date orderDate;                // 주문 생성 날짜
    private String shippingAddress;        // 배송할 주소
    private String status;                 // 배송상태 / 환불여부
    private String imp;                 // 배송상태 / 환불여부
    private int orderQuantity;
    // 주문하는 책 수량
    
    //OrderItem
    private Integer quantity;              // 상품수량
    private BigDecimal price;              // 상품가격

  //TBL_BOADRFILE
  		private int fileNo;
  		private int boardNo;
  		private String idx;
  		private String fileName;
  		private String fileOrgName;
  		private String filePath;
  		private String fileSize;
  		private String fileExt;
  		private String thumbnailYN;
  		private String fileCreateDate;
	
	
	//Book
	private Long bookId;            // 책 고유번호
    private String title;           // 책 이름
    private String description;     // 책 상세설명
    private String author;          // 책 작가이름
    private String publisher;       // 출판사
    private String image;           // 책 이미지
    private Long category;          // 카테고리 번호
    private String ebook;           // 전자책 여부
    private Date createdDate;       // 책 등록 날짜
    private Date updateDate;        // 책 마지막 수정 날짜
    private int discount;			// 할인율
    private int min;
    private int max;
    
    //Address
    private Long addressNo;        // NUMBER
    private String userName;       // VARCHAR2(50 BYTE)
    private String phone;          // VARCHAR2(15 BYTE)
    private String address;        // VARCHAR2(255 BYTE)
    private String addressDetail;  // VARCHAR2(255 BYTE)
    private Long zonecode;         // NUMBER
    private String defaultYN;      // CHAR(1 BYTE)
    private String reqComment;     // VARCHAR2(500 BYTE)
    private String entrancePassword;// VARCHAR2(100 BYTE)
    private String saveYN;         // CHAR(1 BYTE)
    
    //Refund
    private int calc;
    private String refundReason;
    private String reason;
    private String refundId;
    private String refundDate;
    private int refundFile;
    private String refundStatus;
    private String refundQuantity;
    private String rejectComment;
    
    //Review
    private int rating;
    private String reviewComment;
    //category
    private String name;
    private int boardTypeId;
    

  //TBL_STUDY_GROUP
  		private int studyGroupId;
  		private String studyAdminId;
  		private int subjectTypeId;
  		private String studyDescription;
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
  		
  		
    public String getRejectComment() {
		return rejectComment;
	}
	public void setRejectComment(String rejectComment) {
		this.rejectComment = rejectComment;
	}
	public BigDecimal getPrice() {
    	return price;
    }
    public int getQuantity() {
    	return quantity;
    }
    public int getOrderQuantity() {
    	return orderQuantity;
    }
    public int getCalc() {
    	return calc;
    }
    public String getStatus() {
    	return status;
    }

    public String getRefundStatus() {
    	return refundStatus;
    }
}
	
