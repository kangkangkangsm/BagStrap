<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <title>Document</title>
</head>
  <style>
	.study-group-sidebard-h3 {
	    margin: 10px 0;
	    font-size: 16px; /* 글씨 크기 16px으로 조정 */
	    color: #333333; /* 어두운 텍스트 색상 */
	    background-color: #e0e0e0; /* 연한 회색 배경색 */
	    padding: 8px 12px;
	    text-align: left;
	    border-radius: 5px;
	}

	.study-group-sidebard-section {
	    margin-bottom: 10px;
	    padding: 10px;
	    background-color: #f9f9f9; /* 밝은 회색 배경으로 변경 */
	    border: 1px solid #ddd; /* 연한 경계선 */
	    border-radius: 5px;
	}

	.study-group-sidebard-button {
	    display: inline-block;
	    width: 23%;
	    margin: 5px 1%;
	    padding: 8px 0; /* 위아래 패딩 8px, 좌우 0으로 조정 */
	    font-size: 14px; /* 글자 크기 14px으로 조정 */
	    color: #333; /* 어두운 텍스트 색상 */
	    background-color: #ffffff; /* 흰색 버튼 배경 */
	    border: 2px solid #cccccc; /* 회색 테두리로 수정 */
	    border-radius: 8px; /* 테두리 반경 8px으로 조정 */
	    text-align: center;
	    transition: all 0.3s ease-in-out;
	    box-shadow: 0px 2px 4px rgba(0,0,0,0.1); /* 그림자 추가 */
	    cursor: pointer;
	}

	/* 호버 효과 */
	.study-group-sidebard-button:hover {
	    background-color: #f0f0f0; /* 배경색 연한 회색으로 변경 */
	    color: #333333; /* 텍스트 색상 어두운 회색으로 유지 */
	    border-color: #999999; /* 테두리 색상 연한 회색으로 변경 */
	    box-shadow: 0px 4px 8px rgba(0,0,0,0.2); /* 그림자 강화 */
	}

	/* 클릭(액티브) 효과 추가 */
	.study-group-sidebard-button:active {
	    transform: scale(0.95); /* 클릭 시 약간 축소 */
	    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2); /* 그림자 감소 */
	    background-color: #cccccc; /* 배경색 더 진한 회색으로 변경 */
	    color: #ffffff; /* 텍스트 흰색으로 변경 */
	    border-color: #666666; /* 테두리 색상 더 진한 회색으로 변경 */
	    text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.5); /* 텍스트에 약간의 그림자 추가 */
	}

	/* 포커스 효과 추가 */
	.study-group-sidebard-button:focus {
	    outline: none;
	    /* 차콜 색상으로 변경: rgba(54, 69, 79, 0.5) */
	    box-shadow: 0 0 0 3px rgba(54, 69, 79, 0.5); /* 차콜 외곽선 추가 */
	}

	/* 활성화된 버튼 스타일 - 각 섹션에 독립적으로 적용 */
	.age-section .study-group-sidebard-button.active,
	.onoff-section .study-group-sidebard-button.active,
	.subject-section .study-group-sidebard-button.active,
	.gender-section .study-group-sidebard-button.active {
	    background-color: #cccccc; /* 배경색 더 진한 회색 */
	    color: #ffffff; /* 텍스트 흰색 */
	    border-color: #666666; /* 테두리 더 진한 회색 */
	    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2); /* 그림자 감소 */
	    text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.5); /* 텍스트에 약간의 그림자 추가 */
	}

	/* 입력 필드 스타일 변경 */
	.study-group-sidebard-input {
	    width: 90%;
	    padding: 8px;
	    margin: 5% 0; /* 좌우 마진 제거 및 위아래 마진 5%로 조정 */
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    background-color: #ffffff; /* 흰색 배경 */
	    margin-left: 2px;
	}

	/* 시간 입력 필드 스타일 조정 */
	.study-group-sidebard-time {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	}

	.study-group-sidebard-time input {
	    width: 85%; /* 두 개의 입력 필드가 균등하게 배치되도록 조정 */
	    border: 1px solid #ccc;
	    background-color: #ffffff;
	    margin-left: 0; /* 왼쪽 마진 제거 */
	}

	/* 참여자 수 범위 텍스트 스타일 */
	.study-group-sidebard-range {
	    font-size: 14px; /* 글자 크기 14px으로 조정 */
	    color: #666;
	    text-align: center;
	    padding-top: 5px;
	}

	/* 프로필 섹션 스타일 */
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
		<div class="study-group-sidebard-section age-section">
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedAge === '' }"
		            @click="fnMoveAge('')">전체</button>
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedAge === '중딩' }"
		            @click="fnMoveAge('중딩')">중딩</button>
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedAge === '고딩' }"
		            @click="fnMoveAge('고딩')">고딩</button>
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedAge === '대딩' }"
		            @click="fnMoveAge('대딩')">대딩</button>
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedAge === '성인' }"
		            @click="fnMoveAge('성인')">성인</button>
		</div>
	    
		<h3 class="study-group-sidebard-h3">온라인/오프라인</h3>
		<div class="study-group-sidebard-section onoff-section"> <!-- 고유 클래스 추가 -->
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedOnOff === '' }"
		            @click="fnMoveOnOff('')">전체</button>
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedOnOff === '온라인' }"
		            @click="fnMoveOnOff('온라인')">온라인</button>
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedOnOff === '오프' }"
		            @click="fnMoveOnOff('오프')">오프</button>
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedOnOff === '혼합' }"
		            @click="fnMoveOnOff('혼합')">혼합</button>
		</div>

		<h3 class="study-group-sidebard-h3">과목</h3>
		<div class="study-group-sidebard-section subject-section"> <!-- 고유 클래스 추가 -->
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedSubject === '' }"
		            @click="fnMoveSubject('')">전체</button>
		    <template v-for="item in categoryList" :key="item.boardTypeId">
		        <template v-if="item.boardTypeId >= '2000' && item.boardTypeId <= '2999'">
		            <button class="study-group-sidebard-button" 
		                    :class="{ active: selectedSubject === item.boardTypeId }"
		                    @click="fnMoveSubject(item.boardTypeId)">{{item.name}}</button>
		        </template>
		    </template>
		</div>

		<h3 class="study-group-sidebard-h3">성별</h3>
		<div class="study-group-sidebard-section gender-section"> <!-- 고유 클래스 추가 -->
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedGender === '' }"
		            @click="fnMoveGender('')">전체</button>
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedGender === '남성' }"
		            @click="fnMoveGender('남성')">남자</button>
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedGender === '여성' }"
		            @click="fnMoveGender('여성')">여자</button>
		    <button class="study-group-sidebard-button" 
		            :class="{ active: selectedGender === '혼성' }"
		            @click="fnMoveGender('혼성')">혼성</button>
		</div>

	    <h3 class="study-group-sidebard-h3">스터디 시작 날짜</h3>
	    <div class="study-group-sidebard-section">
	        <input type="date" id="startDate" name="startDate" class="study-group-sidebard-input" v-model="startDate" @change="fnMoveStartDate">
	    </div>

	    <h3 class="study-group-sidebard-h3">스터디 시간</h3>
	    <div class="study-group-sidebard-section">
	        <div class="study-group-sidebard-time">
	            <div>
	                <input type="time" id="startTime" name="startTime" class="study-group-sidebard-input" v-model="startTime" @change="fnMoveStartime(startTime,endTime)">
	            </div>
	            <div>
	                <input type="time" id="endTime" name="endTime" class="study-group-sidebard-input" v-model="endTime" @change="fnMoveStartime(startTime,endTime)">
	            </div>
	        </div>
	    </div>

	    <h3 class="study-group-sidebard-h3">참여자 수 
	        <template v-if="participants">
	            : {{ participants }}명
	        </template>
	        <template v-else>
	        </template>
	    </h3>
	    <div class="study-group-sidebard-section">
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
					sidebarSession : {},
					selectedAge: '',  // 연령 선택 상태
			        selectedOnOff: '',  // 온라인/오프라인 선택 상태
			        selectedSubject: '',  // 과목 선택 상태
			        selectedGender: ''  // 성별 선택 상태
			
					
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
				fnMoveAge(Age) {
				      this.selectedAge = Age;
				      window.sessionStorage.setItem("age", Age);
				      window.dispatchEvent(new Event('sideBarEventAge'));
				  },
				  fnMoveOnOff(OnOff) {
				      this.selectedOnOff = OnOff;
				      window.sessionStorage.setItem("onOffMode", OnOff);
				      window.dispatchEvent(new Event('sideBarEventonOff'));
				  },
				  fnMoveSubject(boardTypeId) {
				      this.selectedSubject = boardTypeId;
				      window.sessionStorage.setItem("boardTypeId", boardTypeId);
				      window.dispatchEvent(new Event('sideBarEventboardTypeId'));
				  },
				  fnMoveGender(genderGroup) {
				      this.selectedGender = genderGroup;
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
								
							if(data.isLogin){
								self.isLogin = data.isLogin; 
								self.sessionUserId = data.userId;
								self.sessionUserNickName = data.userNickName;
								self.isAdmin = data.isAdmin;
								
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