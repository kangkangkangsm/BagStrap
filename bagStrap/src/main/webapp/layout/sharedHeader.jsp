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
    <title>웹 페이지 레이아웃</title>
</head>
<body>
    <header id="sharedHeader" class="header">

        <div class="header-logo">
            로고
        </div>

        <nav class="header-menu">
            메뉴
        </nav>
        
        <div class="headerCustomerMenu">
            <div class="headerloginMainMenu headerCustomerSub">
                <div class="headerLogin ">
                	<a v-if="!isLogin" class="clickableText" href="javascript:;" onclick="document.getElementById('headerLoginModal').showModal()">Login</a>
					<a v-if="isLogin" class="clickableText" href="javascript:;" onclick="">{{sessionUserNickName}}님 안녕하세요.</a>
                </div>    
                <div class="headerloginSubMenu clickableMenu">
					<a v-if="isLogin" href="javascript:;">MyInfo</a>
					<a v-if="!isLogin" href="javascript:;">Join</a>
				</div>
                <div class="headerloginSubMenu clickableMenu">
					<a href="javascript:;">MyStudy</a>
				</div>
                <div class="headerloginSubMenu clickableMenu">
					<a href="javascript:;">MyShop</a>
					</div>
                <div class="headerloginSubMenu clickableMenu">
					<a href="javascript:;">Admin</a>
					</div>
                <div v-if="isLogin" class="headerloginSubMenu clickableMenu">
					<a href="javascript:;" @click="fnLogout()">Logout</a>
				</div>
            </div>
            <div class="headerCSCenter headerCustomerSub">
                <a class="clickableText" href="javascript:;" >CSCenter</a>
            </div>
            <div class="headerCart headerIcon headerCustomerSub">
				<a href="javascript:;" >
					<svg class="headerIcon clickableSvg" alt="icon_cart" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed"><path d="M280-80q-33 0-56.5-23.5T200-160q0-33 23.5-56.5T280-240q33 0 56.5 23.5T360-160q0 33-23.5 56.5T280-80Zm400 0q-33 0-56.5-23.5T600-160q0-33 23.5-56.5T680-240q33 0 56.5 23.5T760-160q0 33-23.5 56.5T680-80ZM246-720l96 200h280l110-200H246Zm-38-80h590q23 0 35 20.5t1 41.5L692-482q-11 20-29.5 31T622-440H324l-44 80h480v80H280q-45 0-68-39.5t-2-78.5l54-98-144-304H40v-80h130l38 80Zm134 280h280-280Z"/></svg>
				</a>
            </div>
            <div class="headerNotification headerIcon headerCustomerSub">
				<a href="javascript:;" >
					<svg class="headerIcon clickableSvg" alt="icon_notification" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed"><path d="M160-200v-80h80v-280q0-83 50-147.5T420-792v-28q0-25 17.5-42.5T480-880q25 0 42.5 17.5T540-820v28q80 20 130 84.5T720-560v280h80v80H160Zm320-300Zm0 420q-33 0-56.5-23.5T400-160h160q0 33-23.5 56.5T480-80ZM320-280h320v-280q0-66-47-113t-113-47q-66 0-113 47t-47 113v280Z"/></svg>
				</a>
            </div>
			
			<!--Login Popup-->

			<dialog id="headerLoginModal" class="headerLoginModal round">
			    <div class="rightCloseBtn" onclick="document.getElementById('headerLoginModal').close()">
					<a href="javascript:;"  class="closeBtn">
			        	<svg class="closeBtn" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="gray"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg>
					</a>
			    </div>     
			    <div id="loginBox">
			     <span id="loginImage">로그인 창 이미지/로고?</span>
			        <div><input class="round" placeholder="id" v-model="userId" /></div>
			        <div><input class="round" type="password" placeholder="password" v-model="password" /></div>
			        <div><a>아이디 찾기</a>|<a>비밀번호 찾기</a></div>
			        <button @click="fnLogin()">로그인</button>
			        계정이 없으신가요? <a>회원가입</a>
			    </div>
			</dialog>
            
        </div>

    </header>

	<script>
		
	    const sharedHeaderApp = Vue.createApp({
	        data() {
	            return {
	                isLogin : false, //세션 체크
					sessionUserId : '',
					sessionUserNickName: '',
					userId : '',
					password : '',
					user: '${sessionScope.user}'
	            };
	        },
	        methods: {
				getSharedHeader(){
					var self = this;
					var nparmap = {
					};
					$.ajax({
						url:"sharedHeader.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) {
							self.isLogin = data.isLogin 
							if(data.isLogin){
								self.sessionUserId = data.userId;
								self.sessionUserNickName = data.userNickName;
							} else {
								self.sessionUserId = '';
								self.sessionUserNickName = '';
							}
						}
					});
	            },
	            fnLogin(){
					var self = this;
					var nparmap = {
						userId : self.userId,
						password : self.password

					};
					$.ajax({
						url:"login.dox",
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
				fnLogout(){
					var self = this;
					var nparmap = {
					};
					$.ajax({
						url:"logout.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) {
							console.log(data); 
							alert(data.message);
							self.getSharedHeader();
						}
					});
	            }
				

	        },
	        mounted() {
	            var self = this;
				self.getSharedHeader();
				
				document.getElementById("loginBox").addEventListener("keydown", function(event){
					if(event.key === "Enter"){
						self.fnLogin();
					} else if (event.key === "Escape"){
						document.getElementById('headerLoginModal').close();
					}
				})
	        }
	    });
	   sharedHeaderApp.mount('#sharedHeader');
	</script>
</body>
</html>
