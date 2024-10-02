<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="http://localhost:8080/js/jquery.js"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <title>Document</title>
</head>
  <style>
	.study-group-sidebard-h3 {
	    margin: 10px 0;
	    font-size: 15px;
	    color: #ffffff;
	    background-color: #444;
	    padding: 8px 12px;
	    text-align: left;
	    border-radius: 5px;
	}

	.study-group-sidebard-section {
	    margin-bottom: 10px;
	    padding: 10px;
	    background-color: #333;
	    border: 1px solid #555;
	    border-radius: 5px;
	}

	.study-group-sidebard-button {
	    display: inline-block;
	    width: 23%;
	    margin: 5px 1%;
	    padding: 8px;
	    font-size: 12px;
	    color: #fff;
	    background-color: #5a5a5a;
	    border: 1px solid #444;
	    border-radius: 4px;
	    text-align: center;
	    transition: all 0.3s ease-in-out;
	}

	.study-group-sidebard-button:hover {
	    background-color: #007bff;
	    color: white;
	    border-color: #007bff;
	}

	.study-group-sidebard-input {
	    width: 90%;
	    padding: 6px;
	    margin: 5px 7%;
	    border: 1px solid #444;
	    border-radius: 5px;
	    background-color: #f7f7f7;
	}

	.study-group-sidebard-time {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	}

	.study-group-sidebard-time input {
	    width: 80%;
	    border: 1px solid #444;
	    background-color: #f0f0f0;
	}

	.study-group-sidebard-range {
	    font-size: 12px;
	    color: #ccc;
	    text-align: center;
	    padding-top: 5px;
	}
	.stu-comm-profile {
	    display: flex;
	    align-items: center;
	    margin-bottom: 20px;
	}

	.stu-comm-profile-img {
	    width: 50px;
	    height: 50px;
	    border-radius: 50%;
	    cursor: pointer;
	    transition: transform 0.3s;
	}

	.stu-comm-profile-img:hover {
	    transform: scale(1.1);
	}

	.stu-comm-profile-info {
	    margin-left: 15px;
	}

	.stu-comm-profile-info p {
	    font-size: 19px;
	    color: #333;
	    margin: 0;
	    cursor: pointer;
	}

	.stu-comm-profile-info p:hover {
	    text-decoration: underline;
	}

	/* 사용자 활동 섹션 스타일 */
	.stu-comm-user-activity {
	    margin-bottom: 30px;
	}

	.stu-comm-activity-item {
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    margin-bottom: 10px;
	}

	.stu-comm-activity-icon {
	    font-size: 20px;
	    margin-right: 10px;
	}

	.stu-comm-activity-item a {
	    font-size: 16px;
	    color: #555;
	    text-decoration: none;
	    margin-right: 5px;
	    cursor: pointer;
	}

	.stu-comm-activity-item a:hover {
	    color: #3a8ee6;
	    text-decoration: underline;
	}

	.stu-comm-activity-count {
	    font-weight: bold;
	    font-size: 14px;
	    color: #3a8ee6;
	}
	/* 사이드바 섹션 배경색 변경 */
	.study-group-sidebard-section {
	    margin-bottom: 10px;
	    padding: 10px;
	    background-color: #f9f9f9; /* 밝은 회색 배경으로 변경 */
	    border: 1px solid #ddd; /* 연한 경계선 */
	    border-radius: 5px;
	}

	/* 사이드바 헤더 스타일 변경 */
	.study-group-sidebard-h3 {
	    margin: 10px 0;
	    font-size: 16px;
	    color: #333333; /* 어두운 텍스트 색상 */
	    background-color: #e0e0e0; /* 연한 회색 배경색 */
	    padding: 8px 12px;
	    text-align: left;
	    border-radius: 5px;
	}

	/* 버튼 스타일 변경 */
	.study-group-sidebard-button {
	    display: inline-block;
	    width: 23%;
	    margin: 5px 1%;
	    padding: 5px;
	    font-size: 14px;
	    color: #333; /* 어두운 텍스트 색상 */
	    background-color: #ffffff; /* 흰색 버튼 배경 */
	    border: 2px solid #; /* 파란색 테두리 */
	    border-radius: 8px;
	    text-align: center;
	    transition: all 0.3s ease-in-out;
	    box-shadow: 0px 2px 4px rgba(0,0,0,0.1);
	    cursor: pointer;
	}

	.study-group-sidebard-button:hover {
	    background-color: #E0E0E0; /* 파란색 배경 */
	    color: #ffffff; /* 흰색 텍스트 */
	    border-color: #0056b3; /* 어두운 파란색 테두리 */
	    box-shadow: 0px 4px 8px rgba(0,0,0,0.2);
	}

	/* 입력 필드 스타일 변경 */
	.study-group-sidebard-input {
	    width: 90%;
	    padding: 8px;
	    margin: 5%;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    background-color: #ffffff; /* 흰색 배경 */
		margin-left:2px;
	}

	/* 시간 입력 필드 스타일 조정 */
	.study-group-sidebard-time {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
		
	}

	.study-group-sidebard-time input {
	    width: 90%; /* 두 개의 입력 필드가 여유 있게 배치되도록 조정 */
	    border: 1px solid #ccc;
	    background-color: #ffffff;
		margin-left:-4px;
	}

	/* 참여자 수 범위 텍스트 스타일 */
	.study-group-sidebard-range {
	    font-size: 14px;
	    color: #666;
	    text-align: center;
	    padding-top: 5px;
	}

	/* 프로필 섹션 스타일 유지 */
	.stu-comm-profile {
	    display: flex;
	    align-items: center;
	    margin-bottom: 20px;
	}

	.stu-comm-profile-img {
	    width: 50px;
	    height: 50px;
	    border-radius: 50%;
	    cursor: pointer;
	    transition: transform 0.3s;
	}

	.stu-comm-profile-img:hover {
	    transform: scale(1.1);
	}

	.stu-comm-profile-info {
	    margin-left: 15px;
	}

	.stu-comm-profile-info p {
	    font-size: 19px;
	    color: #333;
	    margin: 0;
	    cursor: pointer;
	}

	.stu-comm-profile-info p:hover {
	    text-decoration: underline;
	}

	/* 사용자 활동 섹션 스타일 유지 */
	.stu-comm-user-activity {
	    margin-bottom: 10px;
	}

	.stu-comm-activity-item {
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    margin-bottom: 10px;
	}

	.stu-comm-activity-icon {
	    font-size: 20px;
	    margin-right: 10px;
	}

	.stu-comm-activity-item a {
	    font-size: 16px;
	    color: #555;
	    text-decoration: none;
	    margin-right: 5px;
	    cursor: pointer;
	}

	.stu-comm-activity-item a:hover {
	    color: #3a8ee6;
	    text-decoration: underline;
	}

	.stu-comm-activity-count {
	    font-weight: bold;
	    font-size: 14px;
	    color: #3a8ee6;
	}

    </style>
</head>
<body>
	
	<aside id="studygroupsidebar">
	   
	    <!-- 내가 쓴 게시글, 댓글 -->
	    <div class="stu-comm-user-activity">
	        <div class="stu-comm-activity-item">
	            <span class="stu-comm-activity-icon">👥</span>
	            <a href="#" @click="fnMyboard">가입중인 그룹</a>
	            <a class="stu-comm-activity-count" href="#" @click="fnMyboard">{{countMyStudyCnt}}개</a>
	        </div>
	    </div>
	    
	    <h3 class="study-group-sidebard-h3">연령별</h3>
	    <div class="study-group-sidebard-section">
	        <button class="study-group-sidebard-button" @click="fnMoveAge('')">전체</button>
	        <button class="study-group-sidebard-button" @click="fnMoveAge('중딩')">중딩</button>
	        <button class="study-group-sidebard-button" @click="fnMoveAge('고딩')">고딩</button>
	        <button class="study-group-sidebard-button" @click="fnMoveAge('대딩')">대딩</button>
	        <button class="study-group-sidebard-button" @click="fnMoveAge('성인')">성인</button>
	    </div>
	    
	    <h3 class="study-group-sidebard-h3">온라인/오프라인</h3>
	    <div class="study-group-sidebard-section">
	        <button class="study-group-sidebard-button" @click="fnMoveOnOff('')">전체</button>
	        <button class="study-group-sidebard-button" @click="fnMoveOnOff('온라인')">온라인</button>
	        <button class="study-group-sidebard-button" @click="fnMoveOnOff('오프라인')">오프</button>
	        <button class="study-group-sidebard-button" @click="fnMoveOnOff('혼합')">혼합</button>
	    </div>

	    <h3 class="study-group-sidebard-h3">과목</h3>
	    <div class="study-group-sidebard-section">
	        <button class="study-group-sidebard-button" @click="fnMoveSubject('')">전체</button>
	        <template v-for="item in categoryList" :key="item.boardTypeId">
	            <template v-if="item.boardTypeId >= '2000' && item.boardTypeId <= '2999'">
	                <button class="study-group-sidebard-button" @click="fnMoveSubject(item.boardTypeId)">{{item.name}}</button>
	            </template>
	        </template>
	    </div>

	    <h3 class="study-group-sidebard-h3">성별</h3>
	    <div class="study-group-sidebard-section">
	        <button class="study-group-sidebard-button" @click="fnMoveGender('')">전체</button>
	        <button class="study-group-sidebard-button" @click="fnMoveGender('남성')">남자</button>
	        <button class="study-group-sidebard-button" @click="fnMoveGender('여성')">여자</button>
	        <button class="study-group-sidebard-button" @click="fnMoveGender('혼성')">혼성</button>
	    </div>

	    <div class="study-group-sidebard-section">
	        <h3 class="study-group-sidebard-h3">스터디 시작 날짜</h3>
	        <input type="date" id="startDate" name="startDate" class="study-group-sidebard-input" v-model="startDate" @change="fnMoveStartDate">
	    </div>

	    <div class="study-group-sidebard-section">
	        <h3 class="study-group-sidebard-h3">스터디 시간</h3>
	        <div class="study-group-sidebard-time">
	            <div><input type="time" id="startTime" name="startTime" class="study-group-sidebard-input" v-model="startTime" @change="fnMoveStartime(startTime,endTime)"></div>
	            <div><input type="time" id="endTime" name="endTime" class="study-group-sidebard-input" v-model="endTime" @change="fnMoveStartime(startTime,endTime)"></div>
	        </div>
	    </div>

	    <div class="study-group-sidebard-section">
	        <h3 class="study-group-sidebard-h3">참여자 수: {{ participants }}명</h3>
	        <input type="range" id="participantsRange" min="2" max="20" v-model="participants" class="study-group-sidebard-input" @input="fnmaxparticipants(participants)">
	        <p class="study-group-sidebard-range">{{ minParticipants }}명 ~ {{ maxParticipants }}명</p>
	    </div>
	</aside>

</body>
</html>
<script>
	 const studygroupsidebarApp = Vue.createApp({
	        data() {
	            return {
					isLogin: false,
					sessionUserId: '',
					sessionUserNickName: '',
					categoryList : [],
					endTime : '',
					startTime : '',
					startDate : new Date().toISOString().substring(0, 10), // 기본값 오늘 날짜로 설정
					participants: '', // 초기값 설정
	                minParticipants: 2, // 최소값
	                maxParticipants: 20, // 최대값
					countMyCommCnt: null,
					countMycommentCnt: null,
					countMyStudyCnt: null,
					sidebarSession : {}
					
	            };
	        },
	        methods: {
				fnMyCnt(){
						var self = this;
						var sessionUserId = self.sessionUserId;
						
						var nparmap = { userId : sessionUserId
						};
						$.ajax({
							url:"sidebarCnt.dox",
							dataType:"json",	
							type : "POST", 
							data : nparmap,
							success : function(data) {
								console.log(data);
								self.countMyCommCnt=data.countMyCommCnt;
								self.countMycommentCnt=data.countMycommentCnt;
								self.countMyStudyCnt = data.countMyStudyCnt;
								self.sidebarSession = data.sidebarSession;
						}
					});
			       },
				   fnMyboard(){
	   				var self = this;
	   				if(!self.isLogin){
	   					alert("로그인 먼저 하세요.");
	   					document.getElementById('headerLoginModal').showModal();
	   					document.getElementById('inputId').focus();
	   					
	   				}else{
	   				 $.pageChange("/study-comm-myboard",{itemMode : "board", author : self.sessionUserId});
	   				}
	   		    },
				 fnMoveAge(Age){
					window.sessionStorage.setItem("age", Age);
					window.dispatchEvent(new Event('sideBarEventAge'));
   				 //$.pageChange("/study-group-list",{Age : Age});
   				 },
				 fnMoveOnOff(OnOff){
	  				window.sessionStorage.setItem("onOffMode", OnOff);
	  				window.dispatchEvent(new Event('sideBarEventonOff'));
	  			 },
				 fnMoveSubject(boardTypeId){
					window.sessionStorage.setItem("boardTypeId", boardTypeId);
	  				window.dispatchEvent(new Event('sideBarEventboardTypeId'));
				 },
				 fnMoveGender(genderGroup){
					window.sessionStorage.setItem("genderGroup", genderGroup);
	  				window.dispatchEvent(new Event('sideBarEventgenderGroup'));
				 },
				 fnMoveStartDate(startDate) {
				    window.sessionStorage.setItem("startDate", this.startDate);
				    window.dispatchEvent(new Event('sideBarEventStartDate'));
			     },
				 fnMoveStartime(startTime,endTime) {	
					if(endTime){
					if(startTime > endTime){
						alert("첫번째 시간이 두번째 시간보다 클 수는 없습니다.");
						this.endTime ="";
						return;
					}}
	 			    window.sessionStorage.setItem("startTime", this.startTime);
					window.sessionStorage.setItem("endTime", this.endTime);
	 			    window.dispatchEvent(new Event('sideBarEventStartime'));
	 		     },
				 fnmaxparticipants(participants) {
 				    window.sessionStorage.setItem("participants", this.participants);
 				    window.dispatchEvent(new Event('sideBarEventparticipants'));
 			     },
				fnGetList(){
					var self = this;
					var nparmap = {
					};
					$.ajax({
						url:"/selectMyCommCategory.dox",
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
							if(data.isLogin){
								self.isLogin = data.isLogin; 
								self.sessionUserId = data.userId;
								self.sessionUserNickName = data.userNickName;
								self.isAdmin = data.isAdmin;
								console.log('세션아이디:', self.sessionUserId);  // sessionUserId가 제대로 설정되었는지 확인
								self.fnMyCnt();
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
				self.fnGetList();
				self.fnMyCnt();
				// (추가) 로그인 상태가 변경되었을 때 세션 정보 다시 로드
		        window.addEventListener('loginStatusChanged', function () {
		            self.fnSession();  // (추가) 로그인 상태가 변경되었을 때 자동으로 세션 정보 업데이트
		        });

	        }
	    });
	    studygroupsidebarApp.mount('#studygroupsidebar');
</script>