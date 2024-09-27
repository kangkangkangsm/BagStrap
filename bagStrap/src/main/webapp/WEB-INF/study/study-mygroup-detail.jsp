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
			            <!-- 로그인 유저 이름 -->
			            <div class="session-user-name">{{sessionUserNickName}}님</div>

			            <!-- 상단 메뉴 -->
			            <div class="study-mygroup-detail2-sidebar-top"> 
			                <ul>
			                    <li @click="fnSidebar('1')">그룹 정보</li>
			                    <li @click="fnSidebar('2')">자유게시판</li>
			                </ul>
			                <ul>
			                    <li @click="fnSidebar('3')">회원 관리</li>
			                    <li @click="fnSidebar('4')">그룹 관리</li>
			                </ul>
			            </div>

			            <!-- 가입한 유저 목록 -->
			            <div class="study-mygroup-detail2-sidebar-bottom">
			                <div class="joined-users-title">가입한 유저 목록</div>
			                <ul>
			                    <!-- 관리자 -->
			                    <li>
									<template v-if="adminlist.filePath">
									<img :src="adminlist.filePath" alt="유저 사진" />
									</template>
									<template v-if="!adminlist.filePath">
									<img src="../src/profile.png" alt="유저 사진" />
									</template>
			                        <span>👑 {{adminlist.userNickName}}</span>
			                    </li>
			                    <!-- 일반 유저 목록 -->
			                    <li v-for="item in searchjoinGroup">
									<template v-if="item.filePath">
									<img :src="item.filePath" alt="유저 사진" />
									</template>
									<template v-if="!item.filePath">
									<img src="../src/profile.png" alt="유저 사진" />
									</template>
			                        <span>{{item.userNickName}}</span>
			                    </li>
			                </ul>
			            </div>
			        </div>
			        <!-- 사이드바 끝 -->

			        <!-- 콘텐츠 영역 -->
			        <div class="study-mygroup-detail2-content">
			            <div class="study-mygroup-detail2-top-bar"></div>
			            <div class="study-mygroup-detail2-email-list">
						   <div class="study-meta">
							
							<!-- ===========================================그룹정보=========================================== -->
							<template v-if = "pageView == '1'">
							<div class="stu-group-detail">
				               <img src="../src/스터디디테일.png" alt="책 표지" style="width: 100%; max-width: 400px; display: block; margin: 0 auto 20px auto;">

				               <h1>[ {{ detailList.name }} ] {{ detailList.studyName }}</h1>
				               <div class="intro">
				               </div>

								<span>🔍 그룹 진행 방식</span>
				               <div class="details">
								   <span>👑 {{adminlist.userNickName}} </span>
				                   <span>👥 {{ detailList.applyY }} / {{ detailList.maxparticipants }}</span>
				                   <span>스터디 방식: {{ detailList.onOffMode }}</span>
				                   <span>성별 : {{ detailList.genderGroup }}</span>
				                   <span>연령대: {{ detailList.age }}</span>
								<span> 스터디 시간:  {{ detailList.stgStudyTime }} </span>
				               </div>
			                   <span>💡 그룹 소개</span>
				               <div class="details">
								<span>{{ detailList.description }}</span>
				               </div>
							   <span>나의학습목표</span>
   							   <div class="details">
   								<span>{{ searchUserlist.studygoal }}</span>
   	   			               </div>
				               <h2>그룹 관련 도서 정보</h2>
				               <div class="book-info">
				                   <img :src="detailList.image" alt="책 표지">
				                   <div class="book-details">
				                       <h3>{{ detailList.title }}</h3>
				                       <p>저자: {{ detailList.author }}</p>
				                       <p>평점: ★★★★☆</p>
				                       <p>소개: {{ detailList.tbDescription }}</p>
				                   </div>
				               </div>
				           </div>
						   </template>
						   <!-- ===========================================그룹 정보=========================================== -->
						   <!-- ===========================================자유게시판=========================================== -->
						   <template v-if = "pageView == '2'">
							자유게시판
							</template>
						   <!-- ===========================================자유게시판=========================================== -->
						   <!-- ===========================================회원관리=========================================== -->
   						   <template v-if = "pageView == '3'">
   							회원관리
   							</template>
   						   <!-- ===========================================회원관리=========================================== -->
						   <!-- ===========================================그룹관리=========================================== -->
   						   <template v-if = "pageView == '4'">
							
									  
							      <div class="study-group-insert-form-group">
							          <label for="field">스터디 영역</label>
							         <input type="text" id="studyName" name="studyName" v-model="detailList.name" maxlength="24" disabled>
							      </div>
								  <div class="study-group-insert-form-group">
							          <label for="studyName">스터디 이름 (24자 이내)</label>
							          <input type="text" id="studyName" name="studyName" v-model="detailList.studyName" maxlength="24">
							      </div>
							      <div class="study-group-insert-form-group">
							          <label for="startDate">스터디 기간 (시작일)</label>
							          <input type="date" id="startDate" name="startDate" v-model="detailList.stgStartDate">
							      </div>
							      <div class="study-group-insert-form-group">
							          <label for="endDate">스터디 기간 (종료일)</label>
							          <input type="date" id="endDate" name="endDate" v-model="detailList.stgEndDate">
							      </div>
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
							      <div class="study-group-insert-form-group">
							          <label for="studyType">온라인/오프라인</label>
							          <select id="studyType" name="studyType" v-model="detailList.onOffMode">
							              <option value="온라인">온라인</option>
										  <option value="오프라인">오프라인</option>
										  <option value="">혼합</option>
							              <!-- 온라인/오프라인 추가 -->
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
							          <div class="study-group-insert-book-list">
							              <select id="book" name="book" v-model="﻿detailList.bookId">
							                  <option v-for="item in typeList" :value="item.bookId">{{item.title}}</option>
							                  <!-- 책 리스트 추가 -->
							              </select>
							          </div>
							      </div>
								  <div class="study-group-insert-form-group">
					  		          <label for="description">스터디 설명 (50자이내)</label>
					  		          <input type="text" id="description" name="description" v-model="detailList.description" maxlength="50" style="height:67px;">
					  		      </div>
								  <label for="file">변경할 스터디 그룹 이미지</label>
								        <input type="file" style="margin-top:-5px;" @change="fnFileChange"/>
								        <input type="file" id="file-upload" style="display: none;" @change="fnFileChange"/>
										<div><img v-if="filePreview" :src="filePreview" style="margin-top:10px; width: 100px; height: 100px;" /></div> <!-- 이미지 미리보기 -->
								  <button class="study-group-insert-submit-btn" @click="fnback()">취소</button>
							      <button class="study-group-insert-submit-btn" @click="fnGroupInsert()">스터디 생성</button>
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
	                filePreview: '' // 이미지 미리보기 URL 저장
										
	            };
	        },
	        methods: {
				fnGroupInsert(){
					var self = this;
					var nparmap = { boardTypeId : self.subjectTypeId, userId : self.sessionUserId,
									studyName : self.studyName, startdate : self.startdate,
									enddate : self.enddate,  studytime : self.studytime,
									age : self.age, onOffMode : self.onOffMode, 
									maxParticipants : self.maxParticipants, genderGroup : self.genderGroup,
									groupPublic : self.groupPublic, groupPassword : self.groupPassword,
									relatedBook : self.relatedBook, description : self.description
					};
					$.ajax({
						url:"insertStuGroup.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							var idx = data.idx;
							self.insertStuGroupKingApply(self.sessionUserId, idx)
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
										 alert("개설 신청이 완료 되었습니다. 관리자 확인후 개설됩니다.");
										  location.href = "/study-group-list";
										  self.filePreview = "";
										},
										error: function(jqXHR, textStatus, errorThrown) {
										  console.error('업로드 실패!', textStatus, errorThrown);
										}
								  });		
							  } else {
								location.href = "/study-group-list";
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
							console.log(data);
							self.typeList = data.typeList;
						}
					});
		        },
				fnSidebar(a){
					this.pageView = a; 
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
                            console.log(data);
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
                            console.log(data);
                            self.adminlist = data.adminlist;
							self.searchUserlist = data.searchUserlist;
							self.searchjoinGroup = data.searchjoinGroup;
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
								console.log(data);
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
				self.fnSession();
				self.fnDetail();
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