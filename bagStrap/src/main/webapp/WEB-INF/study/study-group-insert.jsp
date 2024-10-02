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
    height: 0%;
    margin: 0;
    font-family: Arial, sans-serif;
}
.main-container {
    display: flex;
    width: 100%;
    padding: 20px;
}

/* 사이드바 스타일 */
.sidebar {
    width: 250px;
    padding-right: 20px;
}

/* 컨텐츠 스타일 */
.content {
    flex: 1;
    width: calc(100% - 250px); /* 사이드바 너비를 뺀 나머지 */
    background: #f9f9f9;
    padding: 30px;
    box-sizing: border-box;
}

/* 스터디 그룹 생성 폼 전체 컨테이너 */
.study-group-insert-form-container {
    width: 100%;
    background: #ffffff;
    border-radius: 10px;
    padding: 30px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
}

/* 폼 그룹 스타일 */
.study-group-insert-form-group {
    width: 48%; /* 좌우에 2개씩 배치 */
    display: flex;
    flex-direction: column;
    margin-bottom: 20px;
}

/* 라벨 스타일 */
.study-group-insert-form-group label {
    margin-bottom: 8px;
    font-weight: bold;
    font-size: 14px;
    color: #333333;
}

/* 입력 필드 스타일 */
.study-group-insert-form-group input[type="text"],
.study-group-insert-form-group input[type="date"],
.study-group-insert-form-group input[type="time"],
.study-group-insert-form-group select {
    border: 1px solid #dddddd;
    border-radius: 5px;
    padding: 12px 15px;
    font-size: 14px;
    background: #ffffff; /* 인풋 박스 배경색 하얀색으로 설정 */
    transition: border 0.3s ease-in-out;
}

.study-group-insert-form-group input[type="text"]:focus,
.study-group-insert-form-group input[type="date"]:focus,
.study-group-insert-form-group input[type="time"]:focus,
.study-group-insert-form-group select:focus {
    border: 1px solid #3a8ee6;
    background: #f8f8f8; /* 포커스 시 배경색 변경 */
}

/* 전체 선택 박스 너비 맞춤 */
.study-group-insert-form-group select {
    width: 100%;
}

/* 파일 업로드 스타일 */
#file-upload {
    display: none;
}

/* 파일 미리보기 스타일 */
.stu-comm-insert-image-preview {
    margin-top: 20px;
    border: 1px solid #dddddd;
    border-radius: 10px;
    max-width: 100%;
    max-height: 300px;
}

/* 버튼 스타일 */
.study-group-insert-submit-btn {
    background-color: #ff6600;
    color: #ffffff;
    padding: 12px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin: 10px;
    transition: background-color 0.3s ease-in-out;
    width: 80px; /* 버튼 크기 조정 */
}

.study-group-insert-submit-btn:hover {
    background-color: #e65500;
}

/* 파일 미리보기 공간 */
.file-preview-container {
    width: 48%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 10px;
    border: 2px dashed #aaaaaa;
    border-radius: 10px;
    margin-bottom: 20px;
    background-color: #f5f5f5;
}

/* 파일 이름 텍스트 */
.file-preview-container p {
    font-size: 14px;
    color: #777777;
    margin-top: 10px;
    text-align: center;
}

/* 버튼 컨테이너 */
.button-group {
    display: flex;
    justify-content: center;
    width: 100%;
}
</style>
<body>
		<main class="main-container">
			<aside class="sidebar">
	           <jsp:include page="/layout/study-sidebar.jsp"></jsp:include>
	       </aside>
			
	<div id="app">
		<div class="content">
		    <div class="study-group-insert-form-container" >
		        <div class="study-group-insert-form-group">
		            <label for="field">스터디 영역</label>
		            <select id="field" v-model="subjectTypeId" @change="fnBoardType(subjectTypeId)">
		                <option v-for="item in categoryList" v-show="item.boardTypeId >= 2000 && item.boardTypeId <= 2999" :value="item.boardTypeId">{{item.name}}</option>
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
		                <option value="성인">성인</option>
		            </select>
		        </div>
		        <div class="study-group-insert-form-group">
		            <label for="studyType">온라인/오프라인</label>
		            <select id="studyType" name="studyType" v-model="onOffMode">
		                <option value="온라인">온라인</option>
		                <option value="오프라인">오프라인</option>
		                <option value="">혼합</option>
		            </select>
		        </div>
		        <div class="study-group-insert-form-group">
		            <label for="members">모집 인원</label>
		            <select id="members" name="members" v-model="maxParticipants">
		                <option value="2">1:1(과외)</option>
		                <option v-for="n in 18" :value="n + 2">{{n + 2}}명</option>
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
		                </select>
		            </div>
		        </div>
		        <div class="study-group-insert-form-group">
		            <label for="description">스터디 설명 (50자 이내)</label>
		            <input type="text" id="description" name="description" v-model="description" maxlength="50">
		        </div>
		        <!-- 파일 업로드 및 미리보기 -->
		        <div class="study-group-insert-form-group">
		            <label for="file">스터디 그룹 이미지</label>
		            <input type="file" @change="fnFileChange">
		        </div>
		        <div class="file-preview-container" v-if="filePreview">
		            <img :src="filePreview" class="stu-comm-insert-image-preview"/>
		            <p>미리보기: {{fileName}}</p>
		        </div>
		    </div>
		    <div class="button-group">
		        <button class="study-group-insert-submit-btn" @click="fnback()">취소</button>
		        <button class="study-group-insert-submit-btn" @click="fnGroupInsert()">스터디 생성</button>
		    </div>
		</div>
	</div>
</main>

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
					var today = new Date();
					   today.setHours(0, 0, 0, 0); // 오늘 날짜의 시간을 00:00:00으로 설정
					// 필수 입력 항목 체크
					    if (!self.subjectTypeId) {
					        alert("스터디 영역을 선택해주세요.");
					        return;
					    }

					    // 스터디 이름 24자 이내 확인
					    if (!self.studyName || self.studyName.length > 24) {
					        alert("스터디 이름을 24자 이내로 입력해주세요.");
					        return;
					    }

					    // 시작 기간 확인: 오늘 이전 날짜 선택 불가
					    if (!self.startdate) {
					        alert("스터디 시작일을 선택해주세요.");
					        return;
					    }

					    var startDateObj = new Date(self.startdate);
					    startDateObj.setHours(0, 0, 0, 0);
					    if (startDateObj < today) {
					        alert("스터디 시작일은 금일 날짜 이후로 선택해주세요.");
					        return;
					    }

					    if (!self.enddate) {
					        alert("스터디 종료일을 선택해주세요.");
					        return;
					    }

					    if (!self.studytime) {
					        alert("스터디 시간을 선택해주세요.");
					        return;
					    }

					    if (!self.age) {
					        alert("연령별 그룹을 선택해주세요.");
					        return;
					    }

					    if (!self.onOffMode) {
					        alert("온라인/오프라인을 선택해주세요.");
					        return;
					    }

					    if (!self.maxParticipants) {
					        alert("모집 인원을 선택해주세요.");
					        return;
					    }

					    if (!self.genderGroup) {
					        alert("성별을 선택해주세요.");
					        return;
					    }

					    if (!self.relatedBook) {
					        alert("참고할 교재를 선택해주세요.");
					        return;
					    }

					    // 스터디 설명 50자 이내 확인
					    if (!self.description || self.description.length > 50) {
					        alert("스터디 설명을 50자 이내로 입력해주세요.");
					        return;
					    }
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
				// (추가) 로그인 상태가 변경되었을 때 세션 정보 다시 로드
				        window.addEventListener('loginStatusChanged', function () {
				            self.fnSession();  // (추가) 로그인 상태가 변경되었을 때 자동으로 세션 정보 업데이트
				        });
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