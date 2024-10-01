package com.example.bagStrap.model;

import lombok.Data;

@Data

public class Notification {
    private int notificationId;  // 알림 고유 ID
    private String boardNo;        // 게시글 번호
    private String category;       // 알림 출처
    private String userId;         // 사용자 ID
    private String status;         // 상태
    private int cnt;           // 카운트
    private String createdDate;    // 생성일 (String으로 캐스팅)
    private String message;        // 메시지
}
