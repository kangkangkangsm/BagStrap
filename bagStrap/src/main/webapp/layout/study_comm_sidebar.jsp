<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="http://localhost:8080/js/jquery.js"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css"/>
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/css/style.css">
    <title>Document</title>
</head>
<style>

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

	/* 메뉴 스타일 */
	.stu-comm-menu {
	   
	}

	.stu-comm-menu button {
	    width: 100%;
	    padding: 10px;
	    margin-bottom: 20px;
	    background-color: #343A40;
	    border: none;
	    color: #ffffff;
	    border-radius: 5px;
	    font-weight: bold;
	    cursor: pointer;
	    transition: background-color 0.3s;
		margin-top: -20px;
	}

	.stu-comm-menu button:hover {
	    background-color: #337ab7;
	}

	/* 메뉴 항목 스타일 */
	.stu-comm-menu ul {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}

	.stu-comm-menu li {
	    margin-bottom: 10px;
	}

	.stu-comm-menu li a {
	    display: block;
	    font-size: 15px;
	    color: #333;
	    text-decoration: none;
	    padding: 8px 10px;
	    border-radius: 5px;
	    transition: background 0.3s, color 0.3s;
	}

	.stu-comm-menu li a:hover {
	    background-color: #E0E0E0; /* 호버 시 배경색 변경 */
		width:280px;
	}

	/* 메뉴 구분선 */
	.stu-comm-menu hr {
	    border: none;
	    height: 1px;
	    background-color: #e0e0e0;
	    margin: 15px 0;
	}	
	.study-comm-sidebard-h3 {
		    margin: 10px 0;
		    font-size: 15px;
		    color: #333333;
		    background-color: #E0E0E0;
		    padding: 8px 12px;
		    text-align: left;
		    border-radius: 5px;
	}
	.study-comm-sidebard-section {
		    margin-bottom: 10px;
		    padding: 10px;
		    background-color: #F9F9F9;
		   
		    border-radius: 5px;
	}
	.study-group-sidebard :hover {
		    background-color: #007bff;
		    color: white;
		    border-color: #007bff;
		}
	</style>
<body>
	<aside id="studycommsidebar">
        <!-- 내가 쓴 게시글, 댓글 -->
        <div class="stu-comm-user-activity">
            <div class="stu-comm-activity-item">
                <span class="stu-comm-activity-icon">💬</span>
                <a href="#" @click="fnMyboard">내가 쓴 게시글</a>
                <a class="stu-comm-activity-count" href="#" @click="fnMyboard">{{countMyCommCnt}}개</a>
            </div>
            <div class="stu-comm-activity-item">
                <span class="stu-comm-activity-icon">💬</span>
                <a href="#" @click="fnMyboard" >내가 쓴 댓글</a>
				<a class="stu-comm-activity-count" href="#" @click="fnMyboard">{{countMycommentCnt}}개</a>
            </div>
        </div>
        <nav class="stu-comm-menu">
			<h3 class="study-comm-sidebard-h3">게시판</h3>
			<div class="study-comm-sidebard-section">
            <ul v-for="item in boardTypelist">
				<template v-if="item.boardTypeId >= 1000 && item.boardTypeId <= 1999 ">
                <li><a href="#" @click="fnboardview(item.boardTypeId, item.name)">{{item.name}}</a></li>
				</template>	
			</ul>
			</div>
			
			<h3 class="study-comm-sidebard-h3">스터디</h3>
			<div class="study-comm-sidebard-section">
			<ul v-for="item in boardTypelist">
				<template v-if="item.boardTypeId >= 2000 && item.boardTypeId <= 2999 ">
                <li><a href="#" @click="fnboardview(item.boardTypeId,item.name)">{{item.name}}</a></li>
				</template>
			</ul>
			</div>
			<h3 class="study-comm-sidebard-h3">이벤트</h3>	
			<div class="study-comm-sidebard-section">
			<ul v-for="item in boardTypelist">
				<template v-if="item.boardTypeId >= 3000 && item.boardTypeId <= 3999 ">
                <li><a href="#" @click="fnboardview(item.boardTypeId,item.name)">{{item.name}}</a></li>
				</template>
            </ul>
			</div>
        </nav>    
	</aside>
</body>
</html>
<script>
    const studycommsidebarApp  = Vue.createApp({
        data() {
            return {
                item:{},
				boardTypelist : [],
				boardList : [],
				user: '${sessionScope.user}',
				isLogin : false,
				sessionUserId : '',
				countMyCommCnt: null,
				countMycommentCnt: null,
				countMyStudyCnt: null,
				sidebarSession : {}
            };
        },
        methods: {
			fnStudy(){
				location.href="/study-group-list";
			},
			fnboardview(boardTypeId,name){
				var self = this;
				self.name2 = "";
				self.boardTypeId = boardTypeId;
				self.name = name;
				self.search = '';
				self.fnboardList(1);
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
            fnboardtypeList(){
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url:"selectStuCommType.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						self.boardTypelist = data.boardTypelist; 
						self.boardList = data.boardList;
						console.log(data);

					}
				});
            },
			fnboardview(boardTypeId,name){
				$.pageChange("/study-comm",{boardTypeId : boardTypeId, name : name});
			},
			fnView(boardId){
				 $.pageChange("/study-comm-detail",{boardId : boardId});
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
			fnMycomment(){
				var self = this;
				if(!self.isLogin){
					alert("로그인 먼저 하세요.");
					document.getElementById('headerLoginModal').showModal();
					document.getElementById('inputId').focus();
					
				}else{
				 $.pageChange("/study-comm-myboard",{itemMode : "comment"});				
				}
		    },
			fnLogin(){
				var self = this;
				var nparmap = {
					userId : self.userId,
					password : self.password

				};
				$.ajax({
					url:"/login.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data); 
						alert(data.message);
						if(data.result){
							document.getElementById('headerLoginModal').close();
							self.getSharedHeader();
							self.userId = '',
							self.password = ''
						}
					}
				});
            },	
        },
        mounted() {
            var self = this;
			self.fnMyCnt();
			self.fnboardtypeList();
			self.fnSession();  // **초기 세션 정보 로드**
	        // (추가) 로그인 상태가 변경되었을 때 세션 정보 다시 로드
	        window.addEventListener('loginStatusChanged', function () {
	            self.fnSession();  // (추가) 로그인 상태가 변경되었을 때 자동으로 세션 정보 업데이트
	        });
	    }
	});
    studycommsidebarApp.mount('#studycommsidebar');
</script>