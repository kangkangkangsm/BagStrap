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
</style>
<body>
		<main class="main-container">
			<aside class="sidebar">
	           <jsp:include page="/layout/study-sidebar.jsp"></jsp:include>
	       </aside>
			
	<div id="app">
	        <div class="content">
				<div class="study-group-insert-form-container">			  
			      <div class="study-group-insert-form-group">
			          <label for="field">스터디 영역</label>
			          <select id="field" v-model="subjectTypeId" @change="fnBoardType(subjectTypeId)" >
			              <option v-for="item in categoryList" v-show="item.boardTypeId >= 2000 && item.boardTypeId <= 2999 " :value="item.boardTypeId">{{item.name}}</option>
			          </select>
			      </div>
				  <div class="study-group-insert-form-group">
			          <label for="studyName">스터디 이름 (24자 이내)</label>
			          <input type="text" id="studyName" name="studyName" v-model="studyName" maxlength="24">
			      </div>
			      <div class="study-group-insert-form-group">
			          <label for="startDate">스터디 기간 (시작일)</label>
			          <input type="date" id="startDate" name="startDate" v-model="startdate">
			      </div>
			      <div class="study-group-insert-form-group">
			          <label for="endDate">스터디 기간 (종료일)</label>
			          <input type="date" id="endDate" name="endDate" v-model="enddate">
			      </div>
			      <div class="study-group-insert-form-group">
			          <label for="time">스터디 시간 설정</label>
			          <input type="time" id="time" name="time" v-model="studytime">
			      </div>
			      <div class="study-group-insert-form-group">
			          <label for="ageGroup">연령별</label>
			          <select id="ageGroup" name="ageGroup" v-model="age">
			              <option value="중딩">중딩</option>
						  <option value="고딩">고딩</option>
						  <option value="대딩">대딩</option>
						  <option value="성딩">성인</option>
			          </select>
			      </div>
			      <div class="study-group-insert-form-group">
			          <label for="studyType">온라인/오프라인</label>
			          <select id="studyType" name="studyType" v-model="onOffMode">
			              <option value="온라인">온라인</option>
						  <option value="오프라인">오프라인</option>
						  <option value="">혼합</option>
			              <!-- 온라인/오프라인 추가 -->
			          </select>
			      </div>
			      <div class="study-group-insert-form-group">
			          <label for="members">모집 인원</label>
			          <select id="members" name="members" v-model="maxParticipants">
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
					   <select id="gender" name="gender" v-model="genderGroup">
					 	   <option value="남성">남성</option>
		            	   <option value="여성">여성</option>
		            	   <option value="">성별무관</option>
		          </select>
  			      </div>

			      <div class="study-group-insert-form-group">
			          <label for="book">참고 할 교재</label>
			          <div class="study-group-insert-book-list">
			              <select id="book" name="book" v-model="﻿relatedBook">
			                  <option v-for="item in typeList" :value="item.bookId">{{item.title}}</option>
			                  <!-- 책 리스트 추가 -->
			              </select>
			          </div>
			          <input type="text" id="customBook" placeholder="직접 입력 (없으면 안 써도 됨)" style="width: 91.5%; margin-top: 10px;" v-model="relatedBookDirect">
			      </div>
				  <div class="study-group-insert-form-group">
	  		          <label for="description">스터디 설명 (50자이내)</label>
	  		          <input type="text" id="description" name="description" v-model="description" maxlength="50" style="height:67px;">
	  		      </div>
				  <label for="file">스터디 그룹 이미지</label>
				        <input type="file" @change="fnFileChange"/>
				        <input type="file" id="file-upload" style="display: none;" @change="fnFileChange"/>
			
				        <!-- 이미지 미리보기 -->
				        <div v-if="filePreview">
				            <img :src="filePreview" class="stu-comm-insert-image-preview" />
				        </div>
				  <button class="study-group-insert-submit-btn" @click="fnback()">취소</button>
			      <button class="study-group-insert-submit-btn" @click="fnGroupInsert()">스터디 생성</button>
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
					categoryList:[],
					typeList:[],
					filePreview: ''
					
	            };
	        },
	        methods: {
				insertStuGroupKingApply(userId,idx){
					var self = this;
					var nparmap = { userId : userId , idx : idx
					};
					$.ajax({
						url:"insertStuGroupKingApply.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
						}
					});
		        },
				fnback(){
					history.back();
				},
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
							self.insertStuGroupKingApply(self.sessionUserId, idx);
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
				fnselectMyCommCategory(){
					var self = this;
					var nparmap = {
					};
					$.ajax({
						url:"selectMyCommCategory.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							self.categoryList = data.categoryList;
						}
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
				self.fnselectMyCommCategory();
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