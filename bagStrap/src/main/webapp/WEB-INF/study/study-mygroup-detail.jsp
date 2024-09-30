<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
   <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/style.css">
   <title>첫번째 페이지</title>
</head>
<style>
	body, html {
	    height: 100%;
	    margin: 0;
	    font-family: Arial, sans-serif;
	}
	.study-mygroup-detail-member-admin-panel-container {
	  display: block;
	  margin: 0 auto;
	}

	.study-mygroup-detail-member-admin-header {
	    text-align: center;
	    margin-bottom: 30px;
	}

	.study-mygroup-detail-member-admin-header h2 {
	    color: #2c3e50;
	    font-size: 1.8em;
	}

	.study-mygroup-detail-member-admin-header p {
	    color: #7f8c8d;
	    font-size: 1em;
	}

	/* 콘텐츠 영역 레이아웃 */
	.study-mygroup-detail-member-admin-content {
	  display: block; /* 상하 레이아웃으로 변경 */
	  align-items: center;
	  justify-content: center;
	}

	/* 테이블 스타일 */
	.study-mygroup-detail-member-admin-table {
	  margin: 20px auto;
	}

	.study-mygroup-detail-member-admin-table h3 {
	    margin-bottom: 20px;
	    color: #2c3e50;
	    font-size: 1.4em;
	    text-align: center;
	}

	/* 테이블 스타일링 */
	.study-mygroup-detail-member-admin-table table {
	    width: 100%;
	    border-collapse: collapse;
	}

	.study-mygroup-detail-member-admin-table th,
	.study-mygroup-detail-member-admin-table td {
	    padding: 10px;
	    text-align: center;
	    border-bottom: 1px solid #ecf0f1;
		line-height: 40px;
		
	}

	.study-mygroup-detail-member-admin-table th {
	    background-color: #f7f9fa;
	    color: #34495e;
	    font-weight: bold;
		line-height: 40px;
	}

	.study-mygroup-detail-member-admin-table tr:hover {
	    background-color: #f1f2f6;
	}

	/* 프로필 이미지 스타일 */
	.study-mygroup-detail-member-profile-img {
	    width: 40px;
	    height: 40px;
	    border-radius: 50%;
	}

	/* 버튼 스타일 */
	.study-mygroup-detail-member-btn {
	    padding: 8px 8px;
	    border-radius: 5px;
	    border: none;
	    cursor: pointer;
	    font-size: 0.9em;
	    color: #fff;
	    margin: 0 2px;
	    transition: background-color 0.3s ease;
	    min-width: 50px;
	}

	/* 그룹장 위임 버튼 */
	.study-mygroup-detail-member-assign-btn {
	    background-color: #3498db;
	}

	.study-mygroup-detail-member-assign-btn:hover {
	    background-color: #2980b9;
	}

	/* 강퇴 버튼 */
	.study-mygroup-detail-member-remove-btn {
	    background-color: #e74c3c;
	}

	.study-mygroup-detail-member-remove-btn:hover {
	    background-color: #c0392b;
	}

	/* 승인 버튼 */
	.study-mygroup-detail-member-approve-btn {
	    background-color: #2ecc71;
	}

	.study-mygroup-detail-member-approve-btn:hover {
	    background-color: #27ae60;
	}

	/* 거절 버튼 */
	.study-mygroup-detail-member-reject-btn {
	    background-color: #e74c3c;
	}

	.study-mygroup-detail-member-reject-btn:hover {
	    background-color: #c0392b;
	}
	.study-group-insert-container {
	  max-width: 900px;
	  margin: 10px auto;
	  padding: 20px;
	  margin-left : -1px;
	  border-radius: 10px;
	  
	}

	h2 {
	  text-align: center;
	  margin-bottom: 20px;
	}

	.study-group-insert-form {
	  display: flex;
	  flex-direction: column;
	  gap: 20px;
	}

	.study-group-insert-row {
	  display: flex;
	  justify-content: space-between;
	  gap: 20px;
	}

	.study-group-insert-form-group {
	  display: flex;
	  flex-direction: column;
	  flex: 1;
	}

	.study-group-insert-form-group label {
	  margin-bottom: 8px;
	  font-weight: bold;
	}

	.study-group-insert-actions {
	  display: flex;
	  justify-content: flex-end;
	  gap: 15px;
	}

	.study-group-insert-submit-btn {
	  padding: 10px 20px;
	  background-color: #007BFF;
	  color: white;
	  border: none;
	  border-radius: 5px;
	  cursor: pointer;
	}

	.study-group-insert-submit-btn:hover {
	  background-color: #0056b3;
	}

	textarea {
	  resize: none;
	  padding: 10px;
	  border: 1px solid #ddd;
	  border-radius: 5px;
	}
	.group-title {
	    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* 폰트 스타일 변경 */
	    font-size: 2.5em; /* 텍스트 크기 조정 */
	    color: #2c3e50; /* 글자 색상 */
	    text-align: center; /* 가운데 정렬 */
	    font-weight: bold; /* 굵기 설정 */
	    letter-spacing: 2px; /* 글자 간격 */
	    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
	    margin: 20px 0; /* 상하 간격 */
	    display: inline-block; /* inline-block 설정으로 테두리 효과 */
	    padding-bottom: 10px; /* 하단 여백 */
	}
	.study-mygroup-detail2-sidebar {
	  background-color: #f4f7f6; /* 사이드바 배경 색상 */
	  padding: 20px;
	  border-radius: 15px;
	  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 효과 */
	  max-width: 250px;
	  min-height: 100vh; /* 사이드바의 전체 높이 설정 */
	  position: sticky;
	  top: 0;
	}

	/* 사이드바 헤더 (이미지) */
	.sidebar-header {
	  text-align: center;
	  margin-bottom: 30px;
	}

	.study-group-image {
	  width: 200px;
	  height: 200px;
	  border-radius: 20%; /* 둥근 모서리 */
	  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15); /* 이미지 그림자 */
	}

	/* 사이드바 메뉴 */
	.sidebar-menu ul {
	  list-style-type: none;
	  padding: 0;
	  margin: 0;
	}

	.sidebar-item {
	  padding: 10px 15px;
	  margin: 10px 0;
	  color: #34495e;
	  font-size: 1.1em;
	  text-align: center;
	  cursor: pointer;
	  border-radius: 8px;
	  transition: background 0.3s, color 0.3s;
	}

	.sidebar-item:hover {
	  background: #3498db;
	  color: #ffffff;
	}

	/* 가입 유저 목록 스타일 */
	.joined-users-title {
	  text-align: center;
	  font-size: 1.2em;
	  margin: 20px 0;
	  color: #2c3e50;
	}

	.user-list {
	  max-height: 550px;
	
	}

	/* 사용자 카드 스타일 */
	.user-cards {
	  list-style-type: none;
	  padding: 0;
	}

	.user-card {
	  display: flex;
	  align-items: center;
	  padding: 10px;
	  margin: 10px 0;
	  border-radius: 8px;
	  background-color: #ffffff;
	  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 카드 그림자 */
	  transition: background 0.3s, transform 0.3s;
	}

	.user-card:hover {
	  background-color: #ecf0f1;
	  transform: scale(1.03);
	}

	.user-profile-img {
	  width: 40px;
	  height: 40px;
	  border-radius: 50%;
	  margin-right: 10px;
	  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	}

	.user-name {
	  font-size: 1em;
	  font-weight: 600;
	  color: #2c3e50;
	}
	/* 그룹 전체 컨테이너 */
	.group-detail-wrapper {
	  width: 85%;
	  max-width: 1200px;
	  margin: 50px auto;
	  font-family: 'Noto Sans', sans-serif;
	}

	/* 그룹 헤더 스타일 */
	.group-header {
	background: linear-gradient(45deg, #FFC107 0%, #FFC107 10%, #2196F3 30%, #2196F3 70% , #FF5722 85% );
	  text-align: center;
	  padding: 40px;
	  border-radius: 15px;
	  color: white;
	  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
	}

	.group-main-title {
	  font-size: 2.8em;
	  margin: 0;
	  letter-spacing: 2px;
	}

	.group-subtitle {
	  font-size: 1.4em;
	  margin-top: 15px;
	  color: #e3f2fd;
	}

	/* 그룹 설명 섹션 스타일 */
	.group-description-section {
	  background: #f1f1f1;
	  border-radius: 12px;
	  padding: 20px 30px;
	  margin: 30px 0;
	  text-align: center;
	  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	}

	.group-description {
	  font-size: 1.3em;
	  color: #2c3e50;
	}

	/* 그룹 정보 카드 섹션 */
	.group-info-container {
	  display: flex;
	  flex-wrap: wrap;
	  justify-content: space-between;
	  gap: 15px;
	}

	.info-card {
	  background: #ffffff;
	  flex: 1;
	  min-width: 140px;
	  padding: 15px;
	  border-radius: 12px;
	  text-align: center;
	  transition: transform 0.3s ease, box-shadow 0.3s ease;
	  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
	}

	.info-card:hover {
	  transform: translateY(-3px);
	  box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
	}

	.info-card span {
	  display: block;
	  font-size: 1.2em;
	  color: #3498db;
	  font-weight: 600;
	}

	.info-card p {
	  font-size: 1em;
	  margin-top: 8px;
	  color: #34495e;
	}

	/* 추가 정보 섹션 스타일 */
	.additional-info-container {
	  display: flex;
	  justify-content: space-between;
	  gap: 20px;
	  margin-top: 30px;
	}

	.goal-card, .book-card {
	  flex: 1;
	  background: #ecf0f1;
	  border-radius: 15px;
	  padding: 30px;
	  text-align: center;
	  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	}

	.goal-card h3, .book-card h3 {
	  font-size: 1.8em;
	  color: #2c3e50;
	  margin-bottom: 15px;
	}

	.goal-card p, .book-card p {
	  font-size: 1.2em;
	  color: #7f8c8d;
	}

	.book-image {
	  width: 120px;
	  height: auto;
	  margin-bottom: 15px;
	}

	.book-details h4 {
	  font-size: 1.4em;
	  color: #2c3e50;
	}

	.book-details p {
	  text-align: left;
	  font-size: 1em;
	  margin: 8px 0;
	}
	/* 전체 채팅 컨테이너 스타일 */
	.chat-container {
	  width: 100%;
	  height: 1110px; /* 전체 컨테이너 높이 설정 */
	  border: 1px solid #ddd;
	  border-radius: 8px;
	  display: flex;
	  flex-direction: column;
	  margin-left:-20px;
	  margin-top: -30px;
	}

	/* 채팅 메시지 리스트 스타일 */
	.chat-messages {
	  flex: 1;
	  padding: 15px;
	  overflow-y: auto;
	  display: flex;
	  flex-direction: column;
	  gap: 5px; /* 메시지 간 간격 */
	}

	/* 메시지 스타일 */
	.message {
	  display: flex;
	  align-items: flex-start;
	}

	/* 사용자 이미지와 닉네임 */
	.message-user {
	  display: flex;
	  align-items: center;
	  margin-right: 10px;
	}

	.user-img {
	  width: 40px;
	  height: 40px;
	  border-radius: 50%;
	  margin-right: 8px;
	}

	.user-name {
	  font-weight: bold;
	}

	/* 메시지 입력 영역 */
	.message-input-container {
	  display: flex;
	  align-items: center;
	  padding: 10px;
	  border-top: 1px solid #ddd;
	  background: #fff;
	}

	/* 채팅 메시지 리스트 스타일 */
	.chat-messages {
	  flex: 1;
	  padding: 15px;
	  overflow-y: auto;
	  display: flex;
	  flex-direction: column;
	  gap: 5px; /* 메시지 간 간격 */
	}

	/* 메시지 스타일 */
	.message {
	  display: flex;
	  align-items: flex-start;
	  position: relative; /* 삭제 버튼 위치를 위한 설정 */
	}

	/* 삭제 버튼 스타일 */
	.delete-button {
	  position: absolute;
	  bottom: 2px;
	  right: 5px;
	  font-size: 12px;
	  color: red;
	  display: none; /* 기본적으로는 보이지 않도록 */
	  cursor: pointer;
	}

	/* 메시지에 마우스를 올렸을 때 삭제 버튼 보이기 */
	.message:hover .delete-button {
	  display: block; /* hover 시 삭제 버튼 표시 */
	}

	/* 사용자 이미지와 닉네임 */
	.message-user {
	  display: flex;
	  align-items: center;
	  margin-right: 10px;
	}

	.user-img {
	  width: 40px;
	  height: 40px;
	  border-radius: 50%;
	  margin-right: 8px;
	}

	.user-name {
	  font-weight: bold;
	}

	/* 메시지 입력 영역 */
	.message-input-container {
	  display: flex;
	  align-items: center;
	  padding: 10px;
	  border-top: 1px solid #ddd;
	  background: #fff;
	}

	/* 입력 필드 */
	.message-input {
	  flex: 1;
	  padding: 10px;
	  border: 1px solid #ddd;
	  border-radius: 4px;
	  margin-right: 10px;
	}

	/* 전송 버튼 */
	.send-btn {
	  background: #007bff;
	  color: #fff;
	  border: none;
	  padding: 10px 20px;
	  border-radius: 4px;
	  cursor: pointer;
	}

	.send-btn:hover {
	  background: #0056b3;
	}

	/* 본인 메시지 스타일 (오른쪽) */
	.message-right {
	  display: flex;
	  flex-direction: row-reverse;
	  justify-content: flex-end;
	  align-items: flex-end;
	  margin-left: auto;
	  margin-right: 0;
	  text-align: right;
	}

	/* 다른 사용자 메시지 스타일 (왼쪽) */
	.message-left {
	  display: flex;
	  justify-content: flex-start;
	  align-items: flex-start;
	  margin-right: auto;
	  margin-left: 0;
	  text-align: left;
	}

	/* 메시지 내용 스타일 */
	.message-content {
	  background: #e1f5fe;
	  padding: 8px 10px; /* 패딩 값을 줄여서 메시지가 더 컴팩트하게 보이도록 */
	  border-radius: 8px;
	  max-width: 100%; /* 개별 메시지의 최대 너비를 조정하여 전체 레이아웃에서 자연스럽게 줄바꿈 되도록 */
	  word-wrap: break-word; /* 긴 단어 자동 줄바꿈 */
	  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}

	.message-right .message-content {
	  background: #d1f1d1; /* 본인 메시지 배경색 */
	}

	.message-content p {
	  margin: 0;
	  line-height: 1.5; /* 줄 간격을 최적화하여 줄바꿈 시 자연스럽게 표현되도록 */
	  color: #333;
	}

	/* 메시지 시간 스타일 */
	.message-time {
	  font-size: 11px;
	  color: #999;
	  margin-top: 4px; /* 메시지 내용과 시간 간격 최소화 */
	  text-align: right;
	}

	/* 파일 업로드 아이콘 스타일 */
	.file-upload-icon {
	  width: 25px;
	  height: 25px;
	  margin-right: 10px;
	}

	/* 파일 미리보기 스타일 */
	.file-preview {
	  width: 100px;
	  height: 100px;
	  margin-top: 10px;
	}
	.user-img {
	  width: 40px;
	  height: 40px;
	  border-radius: 50%;
	  margin-right: 8px;
	}

	.user-name {
	  font-weight: bold;
	}
	/* Pagination 스타일 */
	.study-mygroup-detail-pagination {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    margin: 30px 0;
	    gap: 10px;
	}

	.study-mygroup-detail-pagination button {
	    background-color: #f8f9fa;
	    border: 1px solid #dee2e6;
	    color: #007bff;
	    padding: 10px 15px;
	    cursor: pointer;
	    transition: background-color 0.3s, color 0.3s;
	    border-radius: 4px;
	    font-size: 1em; /* 글자 크기 조정 */
	}

	.study-mygroup-detail-pagination button:hover {
	    background-color: #007bff;
	    color: #fff;
	}

	.study-mygroup-detail-pagination button.active {
	    background-color: #007bff;
	    color: #fff;
	    cursor: default;
	}

	.study-mygroup-detail-pagination button:disabled {
	    background-color: #e9ecef;
	    color: #6c757d;
	    cursor: not-allowed;
	    border: 1px solid #dee2e6;
	}
   </style>
<body>
   <div id="app">
      <main class="main-container">
           <aside class="sidebar">
         <jsp:include page="/layout/header_sidebar.jsp"></jsp:include>
           </aside>
         <div class="study-mygroup-detail2-content">
             <div class="study-mygroup-detail2-container">
                 <!-- 사이드바 시작 -->
				 <div class="study-mygroup-detail2-sidebar">
				   <div class="sidebar-header">
				     <img :src="detailList.filePath" alt="스터디 사진" class="study-group-image"/>
				   </div>
				   <nav class="sidebar-menu">
				     <ul>
				       <li @click="fnSidebar('1')" class="sidebar-item">그룹 정보</li>
				       <li @click="fnSidebar('2')" class="sidebar-item">자유게시판</li>
				       <template v-if="adminlist.userId === sessionUserId">
				         <li @click="fnSidebar('3')" class="sidebar-item">회원 관리</li>
				         <li @click="fnSidebar('4')" class="sidebar-item">그룹 관리</li>
				       </template>
				     </ul>
				   </nav>

				   <!-- 유저 목록 영역 -->
				   <div class="joined-users-title">가입한 유저 목록 ({{applyY + 1}} 명)</div>
				   <div class="user-list">
				     <ul class="user-cards">
				       <!-- 관리자 -->
				       <li class="user-card">
				         <template v-if="adminlist.filePath">
				           <img :src="adminlist.filePath" alt="유저 사진" class="user-profile-img"/>
				         </template>
				         <template v-if="!adminlist.filePath">
				           <img src="../src/profile.png" alt="유저 사진" class="user-profile-img"/>
				         </template>
				         <template v-if="adminlist.userId === sessionUserId">
				           <span class="user-name">👑 {{adminlist.userNickName}}(나)</span>
				         </template>
				         <template v-else>
				           <span class="user-name">👑 {{adminlist.userNickName}}</span>
				         </template>
				       </li>

				       <!-- 일반 유저 목록 -->
				       <li v-for="item in userList" class="user-card">
				         <template v-if="item.filePath">
				           <img :src="item.filePath" alt="유저 사진" class="user-profile-img"/>
				         </template>
				         <template v-if="!item.filePath">
				           <img src="../src/profile.png" alt="유저 사진" class="user-profile-img"/>
				         </template>
				         <template v-if="item.userId === sessionUserId">
				           <span class="user-name">{{item.userNickName}}(나)</span>
				         </template>
				         <template v-else>
				           <span class="user-name">{{item.userNickName}}</span>
				         </template>
				       </li>
				     </ul>
				   </div>
				   <!-- 페이징 -->
				 <template v-if=" totalPages >= 2">
		   			<div class="study-mygroup-detail-pagination">
		   			    <button @click="fnUserList(currentPage - 1)" :disabled="currentPage <= 1">⇦</button>
		   			    <button @click="fnUserList(currentPage + 1)" :disabled="currentPage >= totalPages">⇨</button>
		   			</div>
				</template>
				 </div>
		
			        <!-- 사이드바 끝 -->

                 <!-- 콘텐츠 영역 -->
                 <div class="study-mygroup-detail2-content" style="margin-top : -60px;">
                     <div class="study-mygroup-detail2-top-bar"></div>
                     <div class="study-mygroup-detail2-email-list">
                     <div class="study-meta">
                     
                     <!-- ===========================================그룹정보=========================================== -->
					 <template v-if="pageView == '1'">
					   <div class="group-detail-wrapper">
					     <!-- 헤더 섹션 -->
					     <div class="group-header">
					    
					       <h1 class="group-subtitle">{{ detailList.studyName }}</h1>
					     </div>

					     <!-- 그룹 설명 섹션 -->
					     <section class="group-description-section">
					       <p class="group-description">{{ detailList.description }}</p>
					     </section>

					     <!-- 그룹 정보 카드 섹션 -->
					     <div class="group-info-container">
					       <div class="info-card">
					         <span>👑 그룹장</span>
					         <p>{{ adminlist.userNickName }}</p>
					       </div>
					       <div class="info-card">
					         <span>👥 인원</span>
					         <p>{{ detailList.applyY }} / {{ detailList.maxparticipants }}</p>
					       </div>
					       <div class="info-card">
					         <span>🗂️ 스터디 방식</span>
					         <p>{{ detailList.onOffMode }}</p>
					       </div>
					       <div class="info-card">
					         <span>🧒 연령대</span>
					         <p>{{ detailList.age }}</p>
					       </div>
					       <div class="info-card">
					         <span>⏰ 스터디 시간</span>
					         <p>{{ detailList.stgStudyTime }}</p>
					       </div>
					       <div class="info-card">
					         <span>👫 성별</span>
					         <p>{{ detailList.genderGroup }}</p>
					       </div>
						   <div class="info-card">
	   				         <span>🗓️ 시작날짜</span>
	   				         <p>{{ detailList.stgStartDate }}</p>
	   				       </div>
						   <div class="info-card">
      				         <span>🗓️ 종료날짜</span>
      				         <p>{{ detailList.stgEndDate }}</p>
      				       </div>
					     </div>

					     <!-- 학습 목표 및 도서 정보 섹션 -->
					     <div class="additional-info-container">
					       <div class="goal-card">
					         <h3>나의 학습 목표 </h3>
							 <template v-if="editgoal == 'N'">
							 <a href="#" @click="fneditgoal()">✏️ 수정하기</a>
					         <div style="margin-top:10px;"><p>{{ searchUserlist.studygoal }}</p></div>
							</template>
							<template v-if="editgoal == 'Y'">
							 <a href="#" @click="fneditgoalresult(searchUserlist.fetchapplicationid,searchUserlist.studygoal)">✏️ 수정완료</a>
					         <div style="margin-top:10px;"><textarea v-model="searchUserlist.studygoal" style="width:95%; height:170px;" @keyup.enter="fneditgoalresult(searchUserlist.fetchapplicationid,searchUserlist.studygoal)"></textarea></div>
							</template>
				 	       </div>
				
					       <div class="book-card">
					         <h3> 관련 도서 정보</h3>
					         <img :src="detailList.image" alt="도서 이미지" class="book-image">
					         <div class="book-details">
					           <h4>{{ detailList.title }}</h4>
					           <p>저자: {{ detailList.author }}</p>
					         </div>
					       </div>
					     </div>
					   </div>
					 </template>
						   <!-- ===========================================그룹 정보=========================================== -->
						   <!-- ===========================================자유게시판=========================================== -->
						   <template v-if="pageView == '2'">
						     <div class="chat-container" style="margin-top:40px;">
						       <!-- 채팅 메시지 리스트 -->
						       <div id="chat-messages" class="chat-messages">
						         <!-- 메시지 한 개의 예시 -->
						         <div class="message" v-for="item in messagelist">
						           <template v-if="item.messageUserId !== sessionUserId">
						             <!-- 왼쪽 정렬 (다른 사용자) -->
						             <div class="message-left">
						               <div class="message-user">
						                 <img :src="item.filePath" alt="User Image" class="user-img">
						                 <span class="user-name">{{ item.userNickName }}</span>
						               </div>
						               <div class="message-content">
										<img :src="item.mFilepath" style="width:300px; heihgt:300px;">
						                 <p>{{ item.messageContent }}</p>
						                 <span class="message-time">{{ item.messageCreatedDate }}</span>
						               </div>
						             </div>
						           </template>

						           <template v-if="item.messageUserId === sessionUserId">
						             <!-- 오른쪽 정렬 (본인) -->
						             <div class="message-right">
						               <div class="message-content">
										<img :src="item.mFilepath" style="width:300px; heihgt:300px;">
						                 <p>{{ item.messageContent }}</p>
						                 <span class="message-time">{{ item.messageCreatedDate }}</span>
						                 <span class="delete-button" @click="fnDeleteMessage(item.messageId)">삭제</span>
						               </div>
						             </div>
						           </template>
						         </div>
						       </div>

						       <!-- 메시지 입력 영역 -->
						       <div class="message-input-container">
						         <input type="text" id="chatInput" placeholder="메시지를 입력하세요..." class="message-input" v-model="messageContent" @keyup.enter="fnMessage()">
						         <div>
									
						           <label for="file-upload" style="cursor: pointer;">
						             <img src="../src/첨부이모티콘.png" class="file-upload-icon">
						           </label>
						           <input type="file" id="file-upload" style="display: none;" @change="fnFileChange" />
						          <div><img v-if="filePreview" :src="filePreview" style="width: 100px; height: 100px;" /></div> <!-- 이미지 미리보기 -->
						            <div v-if="fileName">{{ fileName }}</div>
									 
						           </div>
						         </div>
						         <button id="sendBtn" class="send-btn" @click="fnMessage()">전송</button>
						       </div>
						     </div>
						   </template>
						   <!-- ===========================================자유게시판=========================================== -->
						   <!-- ===========================================회원관리=========================================== -->
						   <template v-if="pageView == '3'">
						     <div class="study-mygroup-detail-member-admin-panel-container" style="max-width: 800px; width: 100%; margin: auto;">
						       <!-- 페이지 헤더 -->
						       <div class="study-mygroup-detail-member-admin-header" style="margin-top:40px;">
						         <p>여기에서 그룹원 관리 및 가입 신청을 처리할 수 있습니다.</p>
						       </div>

						       <!-- 메인 콘텐츠 영역 (상하 레이아웃) -->
						       <div class="study-mygroup-detail-member-admin-content" style="display: block;">
						         
						         <!-- 좌측 회원 리스트 (1단) -->
						         <details id="memberListfirst" class="study-mygroup-detail-member-admin-table" @toggle="closeOtherDetails('memberListDetails')" style="margin-bottom: 20px; max-width: 800px; width: 100%;">
						           <summary style="cursor: pointer; padding: 10px; background: #f7f9fa; border: 1px solid #ddd; border-radius: 4px; text-align: center;">
						             회원 리스트
						           </summary>
						           
						           <!-- 드롭다운 내용 -->
						           <div style="margin-top: 10px;">
						             <table>
						               <thead>
						                 <tr>
						                   <th>프로필</th>
						                   <th>닉네임</th>
						                   <th>활동</th>
						                 </tr>
						               </thead>
						               <tbody>
						                 <tr>
						                   <td>
						                     <template v-if="adminlist.filePath">
						                       <img :src="adminlist.filePath" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
						                     </template>
						                     <template v-if="!adminlist.filePath">
						                       <img src="../src/profile.png" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
						                     </template>
						                   </td>
						                   <td>👑{{adminlist.userNickName}}</td>
						                   <td class="study-mygroup-detail-member-action-buttons"> 그룹장</td>
						                 </tr>
						                 <tr v-for="item in searchjoinGroup">
						                   <template v-if="item.rejectionMessage !== 'Y'">
						                     <td>
						                       <template v-if="item.filePath">
						                         <img :src="item.filePath" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
						                       </template>
						                       <template v-if="!item.filePath">
						                         <img src="../src/profile.png" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
						                       </template>
						                     </td>
						                     <td>{{item.userNickName}}</td>
						                     <td class="study-mygroup-detail-member-action-buttons">
						                       <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-assign-btn" @click="fnassignLeader(item.fetchappuserid,item.userNickName )">그룹장 위임</button>
						                       <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-remove-btn" @click="removeMember(item.fetchappuserid)">강퇴</button>
						                     </td>
						                   </template>
						                   <template v-else>
						                     <td colspan="2">
						                       <input type="text" style="height:40px; width:100%;" v-model="rejectionMessage" placeholder="강퇴 사유를 입력해주세요." />
						                     </td>
						                     <td class="study-mygroup-detail-member-action-buttons">
						                       <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-remove-btn" @click="removeMemberResult(item.fetchappuserid,item.userNickName)">강퇴</button>
											   <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-remove-btn" @click="removeMember()">취소</button>
						                     </td>
						                   </template>
						                 </tr>
						               </tbody>
						             </table>
						           </div>
						         </details>

						         <!-- 우측 가입 신청 목록 (2단) -->
						         <details id="memberListSecond" class="study-mygroup-detail-member-admin-table" @toggle="closeOtherDetails('memberListSecond')" style="margin-bottom: 20px; max-width: 800px; width: 100%;">
						           <summary style="cursor: pointer; padding: 10px; background: #f7f9fa; border: 1px solid #ddd; border-radius: 4px; text-align: center;">
						             가입 신청 목록
						           </summary>
						           
						           <!-- 드롭다운 내용 -->
						           <div style="margin-top: 10px;">
						             <table>
						               <thead>
						                 <tr>
						                   <th>프로필</th>
						                   <th>닉네임</th>
						                   <th>활동</th>
						                 </tr>
						               </thead>
						               <tbody>
										<template v-for="item in searchnotjoinGroup">
						                 <tr style="background-color: #f2f2f2;">
						                   <td>
						                     <template v-if="item.filePath">
						                       <img :src="item.filePath" class="study-mygroup-detail-member-profile-img" alt="유저 사진" style="background-color: #f2f2f2;"/>
						                     </template>
						                     <template v-if="!item.filePath">
						                       <img src="../src/profile.png" class="study-mygroup-detail-member-profile-img" alt="유저 사진" style="background-color: #f2f2f2;" />
						                     </template>
						                   </td>
						                   <td style="background-color: #f2f2f2;">{{item.userNickName}}</td>
						                   <td class="study-mygroup-detail-member-action-buttons" style="background-color: #f2f2f2;">
						                     <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-approve-btn" @click="fnJoinMember(item.fetchappuserid, item.userNickName)">승인</button>
						                     <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-reject-btn" @click="fnStuGroupUnblocking(item.fetchappuserid,'2')">거절</button>
						                   </td>
						                 </tr>
										 <tr>
										     <td style="background-color: #f2f2f2;">자기소개</td>
										     <td colspan="2" style="text-align: left; background-color: #f9f9f9;">{{item.selfintro}}</td>
										 </tr>
										 <tr>
										     <td style="background-color: #f2f2f2;">학습목표</td>
										     <td colspan="2" style="text-align: left; background-color: #f9f9f9;">{{item.studygoal}}</td>
										 </tr>
										 <tr>
										     <td style="background-color: #f2f2f2;">추가질문</td>
										     <td colspan="2" style="text-align: left; background-color: #f9f9f9;">{{item.additionalquestions}}</td>
										 </tr>
										 </template>
						               </tbody>
						             </table>
						           </div>
						         </details>

								 <!-- 우측 가입 신청 목록 (하단) -->
 						         <details id="memberListthird" class="study-mygroup-detail-member-admin-table" @toggle="closeOtherDetails('memberListthird')" style="margin-bottom: 20px; max-width: 800px; width: 100%;">
 						           <summary style="cursor: pointer; padding: 10px; background: #f7f9fa; border: 1px solid #ddd; border-radius: 4px; text-align: center;">
 						             가입 차단된 사용자 리스트(강퇴)
 						           </summary>
								   
								   <!-- 드롭다운 내용 -->
	   					           <div style="margin-top: 10px;">
	   					             <table>
	   					               <thead>
	   					                 <tr>
	   					                   <th>프로필</th>
	   					                   <th>닉네임</th>
										   <th>차단사유</th>
	   					                   <th>활동</th>
	   					                 </tr>
	   					               </thead>
	   					               <tbody>
	   					                 <tr v-for="item in searchnotLeaveGroup">
	   					                   <td>
	   					                     <template v-if="item.filePath">
	   					                       <img :src="item.filePath" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
	   					                     </template>
	   					                     <template v-if="!item.filePath">
	   					                       <img src="../src/profile.png" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
	   					                     </template>
	   					                   </td>
	   					                   <td>{{item.userNickName}}</td>
										   <td>{{item.rejectionMessage}}</td>
	   					                   <td class="study-mygroup-detail-member-action-buttons">
	   					                     <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-approve-btn" @click="fnStuGroupUnblocking(item.fetchappuserid,'1')">차단해제</button>
	   					                   
	   					                   </td>
	   					                 </tr>
	   					               </tbody>
	   					             </table>
	   					           </div>
	   					         </details>
								 
						       </div>
						     </div>
						   </template>

   						   <!-- ===========================================회원관리=========================================== -->
						   <!-- ===========================================그룹관리=========================================== -->
   						   <template v-if = "pageView == '4'">
							<div class="study-group-insert-container">
								<div class="study-mygroup-detail-member-admin-header" style="margin-top:10px;">
							         <p>여기에서 그룹 정보 수정 및 삭제가 가능합니다.</p>
							       </div>
							  <div class="study-group-insert-form">
							    <div class="study-group-insert-row">
							      <div class="study-group-insert-form-group">
							        <label for="field">스터디 영역</label>
							        <input type="text" id="studyName" name="studyName" v-model="detailList.name" maxlength="24" disabled>
							      </div>
							      <div class="study-group-insert-form-group">
							        <label for="studyName">스터디 이름 (24자 이내)</label>
							        <input type="text" id="studyName" name="studyName" v-model="detailList.studyName" maxlength="24">
							      </div>
							    </div>

							    <div class="study-group-insert-row">
							      <div class="study-group-insert-form-group">
							        <label for="startDate">스터디 기간 (시작일)</label>
							        <input type="date" id="startDate" name="startDate" v-model="detailList.stgStartDate">
							      </div>
							      <div class="study-group-insert-form-group">
							        <label for="endDate">스터디 기간 (종료일)</label>
							        <input type="date" id="endDate" name="endDate" v-model="detailList.stgEndDate">
							      </div>
							    </div>

							    <div class="study-group-insert-row">
							      <div class="study-group-insert-form-group">
							        <label for="time">스터디 시간 설정</label>
							        <input type="time" id="time" name="time" v-model="detailList.stgStudyTime">
							      </div>
							      <div class="study-group-insert-form-group">
							        <label for="ageGroup">연령별</label>
							        <select id="ageGroup" name="ageGroup" v-model="detailList.age">
							          <option value="중딩">중딩</option>
							          <option value="고딩">고딩</option>
							          <option value="대딩">대딩</option>
							          <option value="성딩">성인</option>
							        </select>
							      </div>
							    </div>

							    <div class="study-group-insert-row">
							      <div class="study-group-insert-form-group">
							        <label for="studyType">온라인/오프라인</label>
							        <select id="studyType" name="studyType" v-model="detailList.onOffMode">
							          <option value="온라인">온라인</option>
							          <option value="오프라인">오프라인</option>
							          <option value="">혼합</option>
							        </select>
							      </div>
							      <div class="study-group-insert-form-group">
							        <label for="members">모집 인원</label>
							        <select id="members" name="members" v-model="detailList.maxparticipants">
							          <option value="2">1:1(과외)</option>
							          <option value="3">3명</option>
							          <option value="4">4명</option>
							          <option value="5">5명</option>
							          <option value="6">6명</option>
							          <option value="7">7명</option>
							          <option value="8">8명</option>
							          <option value="9">9명</option>
							          <option value="10">10명</option>
							          <option value="11">11명</option>
							          <option value="12">12명</option>
							          <option value="13">13명</option>
							          <option value="14">14명</option>
							          <option value="15">15명</option>
							          <option value="16">16명</option>
							          <option value="17">17명</option>
							          <option value="18">18명</option>
							          <option value="19">19명</option>
							          <option value="20">20명</option>
							        </select>
							      </div>
							    </div>

							    <div class="study-group-insert-row">
							      <div class="study-group-insert-form-group">
							        <label for="gender">성별</label>
							        <select id="gender" name="gender" v-model="detailList.genderGroup">
							          <option value="남성">남성</option>
							          <option value="여성">여성</option>
							          <option value="">성별무관</option>
							        </select>
							      </div>
							      <div class="study-group-insert-form-group">
							        <label for="book">참고 할 교재</label>
							        <select id="book" name="book" v-model="detailList.bookId">
							          <option v-for="item in typeList" :value="item.bookId">{{item.title}}</option>
							        </select>
							      </div>
							    </div>

							    <div class="study-group-insert-form-group">
							      <label for="description">스터디 설명 (50자이내)</label>
							      <textarea id="description" name="description" v-model="detailList.description" maxlength="50" style="height:67px;"></textarea>
							    </div>

							    <div class="study-group-insert-form-group">
							      <label for="file">변경할 스터디 그룹 이미지</label>
								  <label style="margin-top:10px;"for="file">수정할 파일 업로드</label>
			  	   		           <input type="file" @change="fnFileChange"/>
			  	   				   <div><img v-if="filePreview" :src="item.filePath" style="margin-top:10px; width: 100px; height: 100px;" /></div> 
								   <!-- 이미지 미리보기 -->
							    </div>

							    <div class="study-group-insert-actions">
							      <button class="study-group-insert-submit-btn" 
							        @click="fnGroupUpdate(detailList.studyName,detailList.stgStartDate,detailList.stgEndDate,
							        detailList.stgStudyTime,detailList.age,detailList.onOffMode,detailList.genderGroup,detailList.bookId,detailList.description
									,detailList.maxparticipants)">
							        변경완료
							      </button>
							      <button class="study-group-insert-submit-btn" @click="fnhomeback()">취소</button>
							      <button class="study-group-insert-submit-btn" @click="fngroupdelete()">그룹삭제</button>
							    </div>
							  </div>
							</div>
   							</template>
   						   <!-- ===========================================그룹관리=========================================== -->
				        </div>
				    </div>
				</div>
	        </div>
	    </main>
	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>
<script>
	//localStorage.setItem('data', JSON.stringify(data));
	// JSON.parse(localStorage.getItem('data')).result
	 const app = Vue.createApp({
	        data() {
	            return {
					isLogin: false,
					sessionUserId: '',
					sessionUserNickName: '',
					studyGroupId: '${studyGroupId}',
					detailList : {},
					adminlist : {},
					searchUserlist : {},
					pageView : '1',
					searchjoinGroup : [],
					categoryList:[],
					typeList : [],
					fileName: '', // 파일명 저장
	                filePreview: '', // 이미지 미리보기 URL 저장
					searchnotjoinGroup : [],
					searchnotLeaveGroup : [],
					messagelist : [],
					editgoal : "N",
					userList : [],
					currentPage: 1,      // 현재 페이지
					pageSize: 7,        // 한 페이지에 보여줄 개수
					totalPages: 5,
					file : null
					
					
										
	            };
	        },
	        methods: {
				fnUserList(page = 1){
					var self = this;
					var startIndex = (page - 1) * self.pageSize;
					var outputNumber = self.pageSize;
					self.currentPage = page;
					var nparmap = {studyGroupId : self.studyGroupId,
								   startIndex: startIndex, 
								   outputNumber: outputNumber, };
					$.ajax({
						url:"selectStuGroupSubscriptionSearchPage.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) {
							console.log(data);
							self.userList = data.userList;
							self.applyY = data.applyY;
							self.totalPages = Math.ceil(self.applyY / self.pageSize);
							
						}
					});
		        },
				fneditgoalresult(fetchapplicationid,studygoal){
					var self = this;
					var nparmap = {fetchapplicationid : fetchapplicationid,studygoal : studygoal };
					$.ajax({
						url:"updateStuGoal.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) {
							alert("수정완료");
							self.editgoal = "N"; 
							self.fnDetail();
							self.fnSidebar(1);
						}
					});
		        },
				fneditgoal(){
					this.editgoal = "Y";
				},
				fnDeleteMessage(messageId){
					var self = this;
					var nparmap = {messageId : messageId};
					$.ajax({
						url:"deletGroupMessage.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							self.fnDetail();
							self.fnSidebar(2);
							self.fnMessageSelect()
						}
					});
		        },
				fnMessageSelect(){
					var self = this;
					var nparmap = {studyGroupId : self.studyGroupId};
					$.ajax({
						url:"selectStuGroupMessage.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							self.fnDetail();
							 
							self.messagelist = data.messagelist;
							
						}
					});
		        },
				fnMessage(){
					var self = this;
					var nparmap = { studyGroupId : self.studyGroupId ,sessionId : self.sessionUserId , messageContent : self.messageContent
					};
					$.ajax({
						url:"insertStuGroupMessage.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							 
							self.messageContent ="";
							var idx = data.idx;
							console.log(idx);
							if (self.file) {
								  const formData = new FormData();
								  formData.append('file1', self.file);
								  formData.append('idx', idx);
								  $.ajax({
										url: '/fileUpload.dox',
										type: 'POST',
										data: formData,
										processData: false,  
										contentType: false,  
										success: function() {
										self.filePreview = "";
										self.fileName = "";
										self.fnDetail();
										self.fnSidebar(2);
										self.fnMessageSelect();						
										},
										error: function(jqXHR, textStatus, errorThrown) {
										  console.error('업로드 실패!', textStatus, errorThrown);
										}
								  });		
							  } else {
								self.fnDetail();
								self.fnSidebar(2);
								self.fnMessageSelect();					
							  }		
						}
					});
		        },			   
				fngroupdelete(){
					var self = this;
					if(!confirm("그룹을 삭제합니다. 되돌릴 수 없습니다.")){
						return;
					}
					var nparmap = { studyGroupId : self.studyGroupId
					};
					$.ajax({
						url:"deleteStuGroup.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							 
							alert("그룹 삭제 완료..bye bye~");
							$.pageChange("/study-comm-myboard", { itemMode: "board"});
							
						}
					});
		        },
				fnhomeback(){
					var self = this;
					self.fnSidebar(1);
					self.fnDetail();
				},
				fnJoinMember(fetchappuserid,userNickName){
					var self = this;
					// 인원 초과시 거절 
					var a = self.detailList.applyY;
					var b = self.detailList.maxparticipants; 
					if(a >= b){
						alert("인원 초과입니다.");
						return;
					};
					var nparmap = { studyGroupId : self.studyGroupId ,fetchappuserid : fetchappuserid
					};
					$.ajax({
						url:"updateStuGroupJoin.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							 
							alert(userNickName +"님 가입 완료");
							self.fnDetail();
							self.fnSidebar(3);
							self.fnUserList(page = 1);
							
						}
					});
		        },
				fnassignLeader(fetchappuserid,userNickName){
					var self = this;
					if(!confirm(userNickName + "님에게 그룹장을 위임합니다. 되돌릴수 없어요!")){
						return;
					}
					var nparmap = { studyGroupId : self.studyGroupId ,fetchappuserid : fetchappuserid, sessionId : self.sessionUserId
					};
					$.ajax({
						url:"updateStuGroupBossDelegation.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							 
							alert("그룹장 위임 완료");
							self.fnDetail();
							self.fnSidebar(1);
							self.fnUserList(page = 1);
						}
					});
		        },
				fnStuGroupUnblocking(fetchappuserid,a){
					if(a == '1'){
						if(!confirm("차단 해제합니다?(재가입가능)")){
							return;
						};								
					};
					if(a == '2'){
						if(!confirm("가입을 거절합니다?")){
							return;
						};							
					};
					var self = this;
					var nparmap = { studyGroupId : self.studyGroupId ,fetchappuserid : fetchappuserid
					};
					$.ajax({
						url:"deleteStuGroupUnblocking.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							 
							if(a == '1'){
							alert("차단해제 되었습니다.");								
							};
							if(a == '2'){
							alert("가입이 거절되었습니다.");								
							};
							self.fnDetail();
							self.fnSidebar(3);
							
						}
					});
		        },
				removeMemberResult(fetchappuserid,userNickName){
					var self = this;
					if(!confirm("정말 강퇴 시킵니다?!")){
						self.rejectionMessage ="";
						return;
					}
					var nparmap = { studyGroupId : self.studyGroupId ,fetchappuserid : fetchappuserid,
									rejectionMessage : self.rejectionMessage
					};
					$.ajax({
						url:"updateStuGroupLeave.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							 
							alert(userNickName + "님이 강퇴되었습니다.");
							self.fnDetail();
							self.fnSidebar(3);
							self.fnUserList(page = 1);
						}
					});
		        },
				removeMember(fetchappuserid){
					var self = this;
					var nparmap = { studyGroupId : self.studyGroupId ,fetchappuserid : fetchappuserid
					};
					$.ajax({
						url:"updateStuGroupLeaveMode.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							 
							self.fnDetail();
							self.fnSidebar(3);
							self.fnUserList(page = 1);
							
						}
					});
		        },
				fnGroupUpdate(studyName,stgStartDate,stgEndDate,stgStudyTime,age,onOffMode,genderGroup,bookId,description,maxparticipants){
					var self = this;
					var studyGroupId = self.studyGroupId;
					var nparmap = {studyName : studyName , stgStartDate : stgStartDate ,
									stgEndDate : stgEndDate ,stgStudyTime : stgStudyTime,
									age : age ,  onOffMode : onOffMode,
									genderGroup : genderGroup , bookId : bookId , studyGroupId : studyGroupId,
									description : description, maxParticipants : maxparticipants
					};
					$.ajax({
						url:"updateStuGroup.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							 
							var idx = data.idx;
							console.log(idx);
							if (self.file) {
								  const formData = new FormData();
								  formData.append('file1', self.file);
								  formData.append('idx', idx);
								  $.ajax({
										url: '/fileUpload.dox',
										type: 'POST',
										data: formData,
										processData: false,  
										contentType: false,  
										success: function() {
										self.filePreview = "";
										self.fileName = "";
										self.file = "";
										self.fnDetail();
		  								self.fnSidebar(1);
		  								alert("정보변경 완료");
										},
										error: function(jqXHR, textStatus, errorThrown) {
										  console.error('업로드 실패!', textStatus, errorThrown);
										}
								  });		
							  } else {
								self.fnDetail();
								self.fnSidebar(1);
								self.filePreview = "";
								self.fileName = "";
								alert("정보변경 완료");
								
							  }		
						}
					});
		        },			   
            fnFileChange(event) {
                const file = event.target.files[0];
                this.file = file;

                // 파일명이 있으면 표시
                this.fileName = file.name;

                // 이미지 파일인 경우 미리보기 표시
                if (file && file.type.startsWith('image/')) {
                    const reader = new FileReader();
                    reader.onload = (e) => {
                        this.filePreview = e.target.result;
                    };
                    reader.readAsDataURL(file); // 이미지 파일을 읽음
                } else {
                    this.filePreview = null; // 이미지가 아니면 미리보기 없음
                }
            },      
            fnBoardType(boardTypeId){
               var self = this;
               var nparmap = { boardTypeId : boardTypeId
               };
               $.ajax({
                  url:"selectStuGroupInsertBoardType.dox",
                  dataType:"json",   
                  type : "POST", 
                  data : nparmap,
                  success : function(data) { 
                      
                     self.typeList = data.typeList;
                  }
               });
              },
            fnSidebar(a){
			   var self = this;
               self.pageView = a; 
			   self.file = "";
			   //if(a == '2'){
				//self.fnMessageSelect();
			   //}
            },
            fnDetail() {
                    const self = this;
                    const nparmap = { studyGroupId: self.studyGroupId };
                    $.ajax({
                        url: "selectStuGroupDetail.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function(data) {
                             
                            self.detailList = data.detailList;
                     self.fnBoardType(self.detailList.boardTypeId);
                     self.fnsGroupAdminSearch(self.detailList.studyAdminId, self.detailList.studyGroupId);
                        },
                    });
                },
            fnsGroupAdminSearch(userId,studyGroupId) {
                    const self = this;
                    const nparmap = { userId : userId, sessionId : self.sessionUserId, studyGroupId : studyGroupId   };
                    $.ajax({
                        url: "selectStuGroupUserSearch.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function(data) {
                             
                            self.adminlist = data.adminlist;
							self.searchUserlist = data.searchUserlist;
							self.searchjoinGroup = data.searchjoinGroup;
							self.searchnotjoinGroup = data.searchnotjoinGroup;
							self.searchnotLeaveGroup = data.searchnotLeaveGroup;
                        },
                    });
                },
            fnSession(){
               var self = this;
               var nparmap = {
               };
               $.ajax({
                  url:"sharedHeader.dox",
                  dataType:"json",   
                  type : "POST", 
                  data : nparmap,
                  success : function(data) {
                         
                     self.isLogin = data.isLogin 
                     if(data.isLogin){
                        self.sessionUserId = data.userId;
                        self.sessionUserNickName = data.userNickName;
                        self.isAdmin = data.isAdmin;
                        console.log('세션아이디:', self.sessionUserId);  // sessionUserId가 제대로 설정되었는지 확인
                     } else {
                        self.sessionUserId = '';
                        self.sessionUserNickName = '';
                     }
                  
                  }
               });
            },
           },
           mounted() {
            var self = this;
			// (추가) 로그인 상태가 변경되었을 때 세션 정보 다시 로드
			        window.addEventListener('loginStatusChanged', function () {
			            self.fnSession();  // (추가) 로그인 상태가 변경되었을 때 자동으로 세션 정보 업데이트
			        });
            self.fnSession();
            self.fnDetail();
			self.fnMessageSelect();
			self.fnUserList(1);
			
			
            window.addEventListener('loginStatusChanged', function(){
               if(window.sessionStorage.getItem("isLogin") === 'true'){
                  self.isLogin = true;   
               } else{
                  self.isLogin = false;
               };
               self.fnSession();
            });

           }
       });
       app.mount('#app');
   </script>