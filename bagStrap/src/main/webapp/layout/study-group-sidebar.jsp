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
	    padding: 5px 10px;
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

    </style>
</head>
<body>
	<aside id="studygroupsidebar">
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
	        <template v-for="item in categoryList">
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
	        <input type="date" id="startDate" name="startDate" style="margin-left:3px;" class="study-group-sidebard-input" v-model="startDate" @change="fnMoveStartDate">
	    </div>

	    <div class="study-group-sidebard-section">
	        <h3 class="study-group-sidebard-h3">스터디 시간</h3>
	        <div class="study-group-sidebard-time">
	            <div><input type="time" id="startTime" name="startTime" style="margin-left:1px;"class="study-group-sidebard-input" v-model="startTime" @change="fnMoveStartime(startTime,endTime)"></div>
	           <div><input type="time" id="endTime" name="endTime" class="study-group-sidebard-input" v-model="endTime" @change="fnMoveStartime(startTime,endTime)"></div>
	        </div>
	    </div>

	    <div class="study-group-sidebard-section">
	        <h3 class="study-group-sidebard-h3">참여자 수: {{ participants }}명</h3>
	        <input type="range" id="participantsRange" min="2" max="20" v-model="participants" class="study-group-sidebard-input" style="margin-left : 3px;" @input="fnmaxparticipants(participants)">
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
	                maxParticipants: 20 // 최대값
					
	            };
	        },
	        methods: {
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
				self.fnGetList();
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
	    studygroupsidebarApp.mount('#studygroupsidebar');
</script>