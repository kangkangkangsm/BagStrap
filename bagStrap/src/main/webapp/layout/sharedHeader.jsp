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
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <title>웹 페이지 레이아웃</title>
	<style>
		<style>
		/* 기본 스타일 초기화 */
		* {
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		}

		body {
		    font-family: 'Noto Sans KR', sans-serif; /* 한글과 영문에 적합한 세련된 폰트 */
		    line-height: 1.6;
		    color: #333;
		    background: url('images/background.jpg') no-repeat center center fixed;
		    background-size: cover;
		}

		/* 헤더 스타일 */
		.header {
		    display: flex;
		    width: 100%;
		    height: 150px; /* 헤더 높이 설정 */
		    background-color: white; /* 헤더 배경색 */
		    color: black;
		    align-items: center;
		    padding: 0 20px;
		    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		    position: sticky;
		    top: 0;
		    z-index: 1000;
		}

		/* 로고 스타일링 개선 */
		.header-logo a {
		    text-decoration: none;
		    color: #000;
		    font-size: 28px; /* 글씨 크기 확대 */
		    font-weight: 700; /* 글씨 두께 강화 */
		    letter-spacing: 1.2px;
		    display: flex;
		    flex-direction: column;
		    align-items: flex-start;
		}

		.header-logo a span {
		    font-size: 14px; /* 서브 텍스트 글씨 크기 확대 */
		    color: #555;
		    margin-top: 4px;
		}

		/* 헤더 메뉴 스타일 */
		.header-menu {
		    flex: 1;
		    display: flex;
		    justify-content: center;
		    background-color: white;
		}

		.header-menu-list {
		    list-style: none;
		    display: flex;
		    gap: 20px; /* 메뉴 간격 조정 */
		}

		.header-menu-item {
		    position: relative;
		}

		.header-menu-item > a {
		    display: block;
		    padding: 18px 25px; /* 패딩 증가 */
		    color: #000000;
		    font-size: 1.2em; /* 글씨 크기 확대 */
		    font-weight: 600; /* 글씨 두께 조정 */
		    text-transform: uppercase; /* 대문자 변환 */
		    transition: background-color 0.3s ease, color 0.3s ease;
		    font-family: 'Noto Sans KR', sans-serif;
		}

		.header-menu-item > a:hover {
		    background-color: #555;
		    color: #fff;
		    border-radius: 4px; /* 호버 시 모서리 둥글게 */
		}

		/* 드롭다운 메뉴 스타일링 개선 */
		.header-submenu {
		    display: none;
		    position: absolute;
		    top: 100%;
		    left: 0;
		    background-color: rgba(255, 255, 255, 1);
		    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
		    list-style: none;
		    padding: 15px 0;
		    margin: 0;
		    min-width: 180px;
		    border-radius: 6px;
		    z-index: 1000;
		    transition: opacity 0.3s ease, transform 0.3s ease, visibility 0.3s;
		    opacity: 0;
		    transform: translateY(10px);
		    visibility: hidden;
		}

		.header-menu-item:hover .header-submenu {
		    display: block;
		    opacity: 1;
		    transform: translateY(0);
		    visibility: visible;
		}

		.header-submenu-item a {
		    display: block;
		    padding: 12px 25px; /* 패딩 증가 */
		    color: #000;
		    font-size: 1.1em;
		    font-weight: 500;
		    text-decoration: none;
		    transition: background-color 0.3s ease, color 0.3s ease;
		    font-family: 'Noto Sans KR', sans-serif;
		}

		.header-submenu-item a:hover {
		    background-color: #f0f0f0;
		    color: #e74c3c;
		}

		/* 고객 메뉴 스타일 */
		.headerCustomerMenu {
		    display: flex;
		    align-items: center;
		    gap: 15px; /* 요소 간격 조정 */
		}

		.headerCustomerSub {
		    position: relative;
		}

		.clickableText {
		    color: #000;
		    text-decoration: none;
		    cursor: pointer;
		    transition: color 0.3s ease;
		    font-size: 1.1em; /* 글씨 크기 확대 */
		    font-weight: 500; /* 글씨 두께 조정 */
		    font-family: 'Noto Sans KR', sans-serif;
		}

		.clickableText:hover {
		    color: #e74c3c;
		}

		/* 고객 메뉴 서브 메뉴 스타일링 개선 */
		.headerloginSubMenu {
		    display: none;
		    position: absolute;
		    top: 100%;
		    left: 0;
		    background-color: rgba(255, 255, 255, 1);
		    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
		    list-style: none;
		    padding: 10px 0;
		    margin: 0;
		    min-width: 160px;
		    border-radius: 6px;
		    z-index: 1000;
		    transition: opacity 0.3s ease, transform 0.3s ease, visibility 0.3s;
		    opacity: 0;
		    transform: translateY(10px);
		    visibility: hidden;
		}

		.headerCustomerSub:hover .headerloginSubMenu {
		    display: block;
		    opacity: 1;
		    transform: translateY(0);
		    visibility: visible;
		}

		.headerloginSubMenu a {
		    display: block;
		    padding: 10px 20px;
		    color: #000;
		    text-decoration: none;
		    font-size: 1em;
		    font-weight: 500;
		    transition: background-color 0.3s ease, color 0.3s ease;
		    font-family: 'Noto Sans KR', sans-serif;
		}

		.headerloginSubMenu a:hover {
		    background-color: #f0f0f0;
		    color: #e74c3c;
		}

		/* 아이콘 스타일 */
		.headerIcon {
		    width: 30px;
		    margin: 0 15px;
		}

		.headerIcon svg {
		    fill: #000000; /* 기본 색상 */
		    transition: fill 0.3s ease;
		}

		.headerIcon a:hover svg {
		    fill: #e74c3c; /* 호버 시 색상 변경 */
		}

		/* 로그인 모달 스타일 (필요 시 추가) */
		.headerLoginModal.round {

			position: absolute;
			border-radius: 10px;
			padding: 20px;
			left: calc(50% - 200px);
			width: 400px;
			top: 20%;
		    border-radius: 10px;
		    padding: 20px;
		}

		.rightCloseBtn {
		    display: flex;
		    justify-content: flex-end;
		}

		.closeBtn {
		    cursor: pointer;
		}

		#loginBox {
		    display: flex;
		    flex-direction: column;
		    gap: 10px;
			align-items: center;
		}

		.round {
		    border-radius: 5px;
		    padding: 8px;
		    border: 1px solid #ccc;
		}

		button {
		    padding: 10px;
		    border: none;
		    border-radius: 5px;
		    background-color: #e74c3c;
		    color: white;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}

		button:hover {
		    background-color: #c0392b;
		}


		/* 기본적으로 notification-box는 숨김 */
		.notification-box {
		    display: none;
		    position: absolute; /* 드롭다운을 위해 절대 위치 지정 */
		    background-color: white; /* 배경색 설정 */
		    border: 1px solid #ccc; /* 테두리 설정 */
		    z-index: 1000; /* 다른 요소 위에 표시 */
		}

		/* headerNotification 클릭 시 notification-box를 보이게 하는 클래스 */
		.headerNotification.active + .notification-box {
		    display: block; /* 드롭다운 표시 */
		}
	</style>
</head>
<body>
	<header id="sharedHeader" class="header">

	        <div class="header-logo">
	            <a href="/intro">			
	                현이의 가방끈 
	            </a>
	        </div>

	        <nav class="header-menu">
	            <ul class="header-menu-list">
	                <li class="header-menu-item">
	                    <a href="/intro">HOME</a>
	                </li>
	                <li class="header-menu-item">
	                    <a href="javascript:;" @click="fnToShop('All')">SHOP</a>
	                    <ul class="header-submenu">
	                        <li class="header-submenu-item"><a href="javascript:;" @click="fnToShop('All')">All</a></li>
	                        <li class="header-submenu-item"><a href="javascript:;" @click="fnToShop('Best')">Best</a></li>
	                        <li class="header-submenu-item"><a href="javascript:;" @click="fnToShop('New')">New</a></li>
	                        <li class="header-submenu-item"><a href="javascript:;" @click="fnToShop('Sale')">Sale</a></li>
	                    </ul>
	                </li>
	                <li class="header-menu-item">
	                    <a href="/study-group-list">STUDY</a>
	                </li>
	                <li class="header-menu-item">
	                    <a href="/study-comm">COMMUNITY</a>
	                </li>
	                <li class="header-menu-item">
	                    <a href="/study-group-event">EVENT</a>
	                </li>
	                <li class="header-menu-item">
	                    <a href="javascript:;">FAQ</a>
	                </li>												
	            </ul>
	        </nav>
	        
	        <div class="headerCustomerMenu">
	            <div class="headerloginMainMenu headerCustomerSub">
	                <div class="headerLogin">
	                    <a v-if="!isLogin" class="clickableText" href="javascript:;" @click="fnShowLogin()">Login</a>
	                    <a v-if="isLogin" class="clickableText" href="javascript:;">{{sessionUserNickName}}님 안녕하세요.</a>
	                </div>
	                <ul class="headerloginSubMenu">
	                    <li v-if="isLogin"><a href="javascript:;">MyInfo</a></li>
	                    <li v-if="!isLogin"><a href="javascript:;">Join</a></li>
	                    <li><a href="javascript:;" @click="fnPageChange('/mystudy')">MyStudy</a></li>
	                    <li><a href="javascript:;" @click="fnPageChange('/myshop/orders')">MyShop</a></li>
	                    <li v-if="isAdmin"><a href="/admin/orders">Admin</a></li>
	                    <li v-if="isLogin"><a href="javascript:;" @click="fnLogout()">Logout</a></li>
	                </ul>
	            </div>

	            <div class="headerCSCenter headerCustomerSub">
	                <a class="clickableText" href="cscenter">CSCenter</a>
	            </div>
	            
	            <!-- Cart -->
	            <div class="headerCart headerIcon headerCustomerSub">
	                <a href="javascript:;" @click="fnPageChange('/myshop/cart')">
	                    <svg class="headerIcon clickableSvg" alt="icon_cart" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
	                        <path d="M280-80q-33 0-56.5-23.5T200-160q0-33 23.5-56.5T280-240q33 0 56.5 23.5T360-160q0 33-23.5 56.5T280-80Zm400 0q-33 0-56.5-23.5T600-160q0-33 23.5-56.5T680-240q33 0 56.5 23.5T760-160q0 33-23.5 56.5T680-80ZM246-720l96 200h280l110-200H246Zm-38-80h590q23 0 35 20.5t1 41.5L692-482q-11 20-29.5 31T622-440H324l-44 80h480v80H280q-45 0-68-39.5t-2-78.5l54-98-144-304H40v-80h130l38 80Zm134 280h280-280Z"/>
	                    </svg>
	                </a>
	            </div>
	            <!-- Notification -->
	            <div class="headerNotification headerIcon headerCustomerSub">
	                <a href="javascript:;" @click="">
	                    <svg class="headerIcon clickableSvg" alt="icon_notification" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
	                        <path d="M160-200v-80h80v-280q0-83 50-147.5T420-792v-28q0-25 17.5-42.5T480-880q25 0 42.5 17.5T540-820v28q80 20 130 84.5T720-560v280h80v80H160Zm320-300Zm0 420q-33 0-56.5-23.5T400-160h160q0 33-23.5 56.5T480-80ZM320-280h320v-280q0-66-47-113t-113-47q-66 0-113 47t-47 113v280Z"/>
	                    </svg>
	                </a>
	            </div>
				<div class="notification-box">
					<div @click="fnNotiLocation(item.category, item.boardNo)" v-for="item in notiList">
						<div>
							{{item.message}}
						</div>
						<div>
							{{item.createdDate}}
						</div>
					</div>
					<button v-if="currentPage > 1" @click="fnGetList(currentPage - 1)">이전</button>
				    <button v-if="currentPage < totalPages" @click="fnGetList(currentPage + 1)">다음</button>
				</div>
	            
	            
				<!--Login Popup-->
				<dialog id="headerLoginModal" class="headerLoginModal round">
	               <div class="rightCloseBtn" onclick="document.getElementById('headerLoginModal').close()">
	                   <a href="javascript:;" class="closeBtn">
	                       <svg class="closeBtn" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="gray">
	                           <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-224 56-224-224-224 224Z"/>
	                       </svg>
	                   </a>
	               </div>     
	               <div id="loginBox">
	                   <span id="loginImage">로그인 창 이미지/로고?</span>
	                   <div><input class="round" id="inputId" placeholder="id" v-model="userId" /></div>
	                   <div><input class="round" type="password" placeholder="password" v-model="password" /></div>
	                   <div><a>아이디 찾기</a> | <a>비밀번호 찾기</a></div>
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
					user: '${sessionScope.user}',
					notiList:[],
					currentPage: 1,
					totalPages: 10,
					pageSize: 5
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
				getSharedHeader(currentPage){
					var self = this;
					var nparmap = {
						currentPage: currentPage, 
						pageSize: self.pageSize
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
							self.currentPage = currentPage;
							self.totalPages = data.totalPages;
							if(data.isLogin){
								self.sessionUserId = data.userId;
								self.sessionUserNickName = data.userNickName;
							} else {
								self.sessionUserId = '';
								self.sessionUserNickName = '';
							}
							self.notiList = data.notiList;
							window.sessionStorage.setItem("isLogin", self.isLogin);
							window.sessionStorage.setItem("isAdmin", self.isAdmin);
							//( 선민 추가) 아래 3줄 
							window.sessionStorage.setItem("sessionUserId", self.sessionUserId);
		                    window.sessionStorage.setItem("sessionUserNickName", self.sessionUserNickName);
							window.dispatchEvent(new Event('loginStatusChanged'));
							
							window.dispatchEvent(new Event('adminStatusChanged'));
						}
					});
	            },
				fnShowLogin(){
					document.getElementById('headerLoginModal').showModal();
					document.getElementById('inputId').focus();
					
				},
				fnToShop(categoryStr){
					$.pageChange("/shop/list",{category : categoryStr});	
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
								self.getSharedHeader(1);
								self.userId = '',
								self.password = ''
								// (선민 추가) 로그인 후 페이지 새로고침
		                        window.location.reload();
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
							self.getSharedHeader(1);
							// (선민 추가) 로그인 후 페이지 새로고침
	                        window.location.reload();
						}
					});
	            },
				fnNotiLocation(category, boardNo){
					alert(category+boardNo)
					//TODO 로케이션 이동 넣고 delete 구현해야함
				}
				

	        },
	        mounted() {
				document.querySelector('.headerNotification').addEventListener('click', function() {
				    this.classList.toggle('active'); // active 클래스 토글
				});
	            var self = this;
				self.getSharedHeader(1);
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