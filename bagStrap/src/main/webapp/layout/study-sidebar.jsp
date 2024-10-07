<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--	<script src="http://localhost:8080/js/jquery.js"></script>
-->	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css"/>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Document</title>
</head>
<body>
	<aside id="studycommsidebar">
		<div class="stu-comm-profile">
            <img src="../src/profile.png" alt="프로필 사진" class="stu-comm-profile-img" @click="fnMyboard">
            <div class="stu-comm-profile-info">
                <p @click="fnMyboard"><strong>{{sessionUserNickName}} 님</strong></p>
            </div>
        </div>
        <!-- 내가 쓴 게시글, 댓글 -->
        <div class="stu-comm-user-activity">
            <div class="stu-comm-activity-item">
                <span class="stu-comm-activity-icon">💬</span>
                <a href="#" @click="fnMyboard">내가 쓴 게시글</a>
                <a class="stu-comm-activity-count" href="#" @click="fnMyboard">{{countMyCommCnt}}개</a>
            </div>
            <div class="stu-comm-activity-item">
                <span class="stu-comm-activity-icon">💬</span>
                <a href="#" @click="fnMycomment" >내가 쓴 댓글</a>
                <a class="stu-comm-activity-count" href="#" @click="fnMycomment">{{countMycommentCnt}}개</a>
            </div>
			<div class="stu-comm-activity-item">
               <span class="stu-comm-activity-icon">👥</span>
               <a href="#" @click="fnMyboard">가입중인 그룹</a>
               <a class="stu-comm-activity-count" href="#" @click="fnMyboard">2개</a>
           </div>
        </div>
        <nav class="stu-comm-menu">
            <button @click="fnMoveComm">커뮤니티</button>
			<button @click="fnMoveGroup">스터디그룹</button>
			<hr>	
			<ul v-for="item in boardTypelist">
            </ul>
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
            };
        },
        methods: {
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
				 $.pageChange("/study-comm-myboard",{itemMode : "board"});
		    },
			fnMycomment(){
				 $.pageChange("/study-comm-myboard",{itemMode : "comment"});
		    },
			fnMoveComm(){
				location.href="/study-comm"
			},
			fnMoveGroup(){
				location.href="/study-group-list"
			},
        },
        mounted() {
            var self = this;
			self.fnboardtypeList();
			self.fnSession();
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					self.isLogin = false;
				};
				self.fnSession();	
			})
        }
    });
    studycommsidebarApp.mount('#studycommsidebar');
</script>