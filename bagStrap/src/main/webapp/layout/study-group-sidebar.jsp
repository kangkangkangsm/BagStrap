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
        .study-group-sidebar-container {
            width: 280px;
            padding: 10px;
            margin-left : -10px;
           
        }

        .study-group-sidebar-h3 {
			margin-top:10px;
            font-size: 16px;
            color: #333;
            margin-bottom: 10px;
            padding-bottom: 5px;
            border-bottom: 1px solid #ddd;
        }

        .study-group-sidebar-button {
            display: inline-block;
            margin-right: 5px;
            padding: 8px 12px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
		.study-group-sidebar-button:active {
		    background-color: #e0e0e0; 
		}
        .study-group-sidebar-button:hover {
            background-color: #e9e9e9;
        }

        .study-group-sidebar-input {
            width: 100%;
            padding: 8px;
            margin: 0;
            box-sizing: border-box;
        }

        .study-group-sidebar-label {
            display: block;
            margin-bottom: 5px;
            color: #666;
            font-size: 14px;
        }

        .study-group-sidebar-range {
            margin-top: 1px;
            padding: 10px 0;
        }

        .study-group-sidebar-range p {
            font-size: 12px;
            color: #555;
        }
    </style>
</head>
<body>
    <aside id="studygroupsidebar" class="study-group-sidebar-container">
        <h3 class="study-group-sidebar-h3">연령별</h3>
        <div>
            <button class="study-group-sidebar-button" @click="fnMoveAge('')">전체</button>
            <button class="study-group-sidebar-button" @click="fnMoveAge('중딩')">중딩</button>
            <button class="study-group-sidebar-button" @click="fnMoveAge('고딩')">고딩</button>
            <button class="study-group-sidebar-button" @click="fnMoveAge('대딩')">대딩</button>
            <button class="study-group-sidebar-button" @click="fnMoveAge('성인')">성인</button>
        </div>
        <h3 class="study-group-sidebar-h3">온라인/오프라인</h3>
        <div>
            <button class="study-group-sidebar-button" @click="fnMoveOnOff('')">전체</button>
            <button class="study-group-sidebar-button" @click="fnMoveOnOff('온라인')">온라인</button>
            <button class="study-group-sidebar-button" @click="fnMoveOnOff('오프라인')">오프라인</button>
            <button class="study-group-sidebar-button" @click="fnMoveOnOff('혼합')">혼합</button>
        </div>
        <h3 class="study-group-sidebar-h3">과목</h3>
			<button class="study-group-sidebar-button" @click="fnMoveSubject('')">전체</button>
        <template v-for="item in categoryList">
			<template v-if="item.boardTypeId >= '2000' && item.boardTypeId <= '2999'">
            <button class="study-group-sidebar-button" @click="fnMoveSubject(item.boardTypeId)">{{item.name}}</button>
    		</template>    
		</template>
        <h3 class="study-group-sidebar-h3">성별</h3>
        <div>
            <button class="study-group-sidebar-button" @click="fnMoveGender('')">전체</button>
            <button class="study-group-sidebar-button" @click="fnMoveGender('남성')">남자</button>
            <button class="study-group-sidebar-button" @click="fnMoveGender('여성')">여자</button>
            <button class="study-group-sidebar-button" @click="fnMoveGender('혼성')">혼성</button>
        </div>
		<div class="study-group-sidebar-range">
		    <h3 class="study-group-sidebar-h3">스터디 시작 날짜</h3>
		    <input type="date" id="startDate" name="startDate" class="study-group-sidebar-input"
		           v-model="startDate" @change="fnMoveStartDate">
		</div>
        <div class="study-group-sidebar-range">
             <h3 class="study-group-sidebar-h3">스터디 시간</h3>
            <input style="width:45%" type="time" id="time" name="time" class="study-group-sidebar-input" v-model="startTime"> ~ 
            <input style="width:45%" type="time" id="time" name="time" class="study-group-sidebar-input" v-model="endTime" @change="fnMoveStartime(startTime,endTime)">
        </div>
		<div class="study-group-sidebar-range">
		    <h3 class="study-group-sidebar-h3">참여자 수: <span>{{ participants }}</span>명 이하</h3>
		    <input type="range" id="participantsRange" min="2" max="20" v-model="participants" class="study-group-sidebar-input" @change="fnmaxparticipants(participants)">
		    <p>{{ minParticipants }}명~{{ maxParticipants }}명</p>
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
					if(!startTime){
						alert("시작시간을 먼저 입력해주세요");
						this.endTime ="";
						return;
					}
					if(startTime > endTime){
						alert("첫번째 시간이 두번째 시간보다 클 수는 없습니다.");
						this.endTime ="";
						this.startTime ="";
						return;
					}
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