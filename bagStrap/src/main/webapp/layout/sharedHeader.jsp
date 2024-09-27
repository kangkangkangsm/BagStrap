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
			<a href="/intro">			
				 <img src="../src/현이의가방끈.png" style="width:220px; height:100px; margin-left:20px; margin-top: 10px;">
				
			</a>
        </div>

        <nav class="header-menu">
            메뉴
        </nav>
        
        <div class="headerCustomerMenu">
            <div class="headerloginMainMenu headerCustomerSub">
                <div class="headerLogin ">
                	<a v-if="!isLogin" class="clickableText" href="javascript:;" @click="fnShowLogin()">Login</a>
					<a v-if="isLogin" class="clickableText" href="javascript:;" @click="">{{sessionUserNickName}}님 안녕하세요.</a>
                </div>    
                <div class="headerloginSubMenu clickableMenu">
					<a v-if="isLogin" href="javascript:;">MyInfo</a>
					<a v-if="!isLogin" href="javascript:;">Join</a>
				</div>
                <div class="headerloginSubMenu clickableMenu">
					<!--TODO : 넣어야함-->
					<a href="javascript:;" @click="fnPageChange('/mystudy')"> MyStudy </a>

				</div>
                <div class="headerloginSubMenu clickableMenu">
					<a href="javascript:;" @click="fnPageChange('/myshop/orders')"> MyShop </a>
					</div>
                <div v-if="isAdmin" class="headerloginSubMenu clickableMenu">
					<a href="javascript:;">Admin</a>
					</div>
                <div v-if="isLogin" class="headerloginSubMenu clickableMenu">
					<a href="javascript:;" @click="fnLogout()">Logout</a>
				</div>
            </div>
            <div class="headerCSCenter headerCustomerSub">
                <a class="clickableText" href="cscenter" >CSCenter</a>
            </div>
			<!--cart-->
            <div class="headerCart headerIcon headerCustomerSub">
				<a href="javascript:;" @click="fnPageChange('/myshop/cart')">
					<svg class="headerIcon clickableSvg" alt="icon_cart" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed"><path d="M280-80q-33 0-56.5-23.5T200-160q0-33 23.5-56.5T280-240q33 0 56.5 23.5T360-160q0 33-23.5 56.5T280-80Zm400 0q-33 0-56.5-23.5T600-160q0-33 23.5-56.5T680-240q33 0 56.5 23.5T760-160q0 33-23.5 56.5T680-80ZM246-720l96 200h280l110-200H246Zm-38-80h590q23 0 35 20.5t1 41.5L692-482q-11 20-29.5 31T622-440H324l-44 80h480v80H280q-45 0-68-39.5t-2-78.5l54-98-144-304H40v-80h130l38 80Zm134 280h280-280Z"/></svg>
				</a>
				

            </div>
			<!--notification-->
            <div class="headerNotification headerIcon headerCustomerSub">
				<!--TODO: 여기 수정해야한다.-->
				<a href="javascript:;" @click="fnPageChange('/myshop/notification')">
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
			        <div><input class="round" id="inputId" placeholder="id" v-model="userId" /></div>
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
					isAdmin : false, //세션 체크
					sessionUserId : '',
					sessionUserNickName: '',
					userId : 'admin',
					password : 'admin1234',
					user: '${sessionScope.user}'
	            };
	        },
	        methods: {
				fnPageChange(path){
					var self = this;
					if(self.isLogin){
						location.href=path;
					} else{
						alert('로그인 후 이용가능합니다.')
						document.getElementById('headerLoginModal').showModal();
						document.getElementById('inputId').focus();
					}
				},
				// header main load 함수
				getSharedHeader(){
					var self = this;
					var nparmap = {
					};
					$.ajax({
						url:"/sharedHeader.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) {
							console.log(data);
							self.isLogin = data.isLogin; 
							self.isAdmin = data.isAdmin;
							if(data.isLogin){
								self.sessionUserId = data.userId;
								self.sessionUserNickName = data.userNickName;
							} else {
								self.sessionUserId = '';
								self.sessionUserNickName = '';
							}
							window.sessionStorage.setItem("isLogin", self.isLogin);
							window.sessionStorage.setItem("isAdmin", self.isAdmin);
							window.dispatchEvent(new Event('loginStatusChanged'));
							window.dispatchEvent(new Event('adminStatusChanged'));
						}
					});
	            },
				fnShowLogin(){
					document.getElementById('headerLoginModal').showModal();
					document.getElementById('inputId').focus();
					
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
				fnLogout(){
					var self = this;
					var nparmap = {
					};
					$.ajax({
						url:"/logout.dox",
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
				// login dialog 키 입력 추가
				document.getElementById("loginBox").addEventListener("keydown", function(event){
					if(event.key === "Enter"){
						self.fnLogin();
					} else if (event.key === "Escape"){
						document.getElementById('headerLoginModal').close();
					}
				});
	        }
	    });
	   sharedHeaderApp.mount('#sharedHeader');
	</script>
</body>
</html>
