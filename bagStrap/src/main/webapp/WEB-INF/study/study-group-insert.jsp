<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
   
    .study-group-insert-form-container {
        width: 800px; /* 폼 컨테이너 너비 조정 */
        background-color: #fff; /* 배경색 */
        padding: 30px;
        border-radius: 10px; /* 테두리 둥글게 */
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        display: flex;
        flex-wrap: wrap; /* 내용이 넘치면 다음 줄로 */
        justify-content: space-between; /* 항목 간 간격 설정 */
    }
    .study-group-insert-form-group {
        width: 48%; /* 한 줄에 두 개 항목 배치를 위해 너비 설정 */
        margin-bottom: 15px;
    }
    .study-group-insert-form-group label {
        display: block;
        margin-bottom: 5px;
        color: #555; /* 라벨 색상 */
    }
    .study-group-insert-form-group input[type="text"],
    .study-group-insert-form-group input[type="password"],
    .study-group-insert-form-group input[type="date"],
    .study-group-insert-form-group input[type="time"]
	{
        width: 94.5%; /* 입력 필드 너비 */
        padding: 10px;
        border: 1px solid #ddd; /* 테두리 설정 */
        border-radius: 5px; /* 입력 필드 둥글게 */
        font-size: 14px; /* 폰트 크기 */
    }
	.study-group-insert-form-group select {
		width: 100%; /* 입력 필드 너비 */
        padding: 10px;
        border: 1px solid #ddd; /* 테두리 설정 */
        border-radius: 5px; /* 입력 필드 둥글게 */
        font-size: 14px; /* 폰트 크기 */
	}
    .study-group-insert-form-group input[type="radio"] {
        margin-right: 10px;
    }
    .study-group-insert-form-group .study-group-insert-inline-radio,
    .study-group-insert-form-group .study-group-insert-book-list {
        display: flex;
        align-items: center; /* 가로로 정렬 */
    }
    .study-group-insert-form-group .study-group-insert-book-list select,
    .study-group-insert-form-group .study-group-insert-book-list input[type="text"] {
        margin-right: 10px;
        flex-grow: 1; /* 남은 공간 채우기 */
    }
    .study-group-insert-add-book-btn {
        background-color: #007bff; /* 버튼 배경색 */
        color: #fff; /* 글자색 */
        border: none; /* 테두리 없음 */
        padding: 8px 12px;
        border-radius: 5px; /* 버튼 둥글게 */
        cursor: pointer; /* 클릭 가능한 포인터 모양 */
    }
    .study-group-insert-add-book-btn:hover {
        background-color: #0056b3; /* 호버 시 색상 변경 */
    }
    .study-group-insert-submit-btn {
        width: 100%;
        padding: 12px;
        background-color: #ff6700; /* 제출 버튼 색상 */
        color: #fff; /* 제출 버튼 글자색 */
        border: none;
        border-radius: 5px; /* 제출 버튼 둥글게 */
        cursor: pointer;
        font-size: 16px; /* 폰트 크기 */
        margin-top: 20px;
    }
    .study-group-insert-submit-btn:hover {
        background-color: #e55c00; /* 호버 시 색상 변경 */
    }
    .study-group-insert-note {
        color: #888; /* 주석 색상 */
        font-size: 12px; /* 주석 폰트 크기 */
        margin-left: 10px;
    }
</style>
<body>
	<div id="app">
		<main class="main-container">
			
	        <aside class="sidebar">
	           {{sessionUserId}}
	        </aside>
			
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
			          <div class="study-group-insert-inline-radio">
			          <label>그룹 공개 여부    </label>
			              <input type="radio" id="public" name="visibility" v-model="groupPublic" value="Y">
			              <label for="public">공개</label>
			              <input type="radio" id="private" name="visibility" v-model="groupPublic" value="N">
			              <label for="private">비공개</label>
			          </div>
			          <input type="password" id="groupPassword" placeholder="비밀번호 4자리 (비공개 시 입력)" style="width: 100%;" v-model="groupPassword">
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
					typeList:[]
					
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
							alert(data.message);
							
						}
					});
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