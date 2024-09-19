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
	
    //OrderItem
    private Integer quantity;              // 상품수량
    private BigDecimal price;              // 상품가격
    
	
	
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
}
	
