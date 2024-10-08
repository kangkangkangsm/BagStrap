<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>view 기본 세팅 파일</title>
</head>
<style>
	.main-container {
	     display: flex;
	     min-height: 100vh;
	     font-family: 'Arial', sans-serif;
	     background-color: #f4f6f9;
	 }
	 .content {
	      width:100%;
	      padding: 40px;
	      background-color: #ffffff;
	 }
	h1 {
	    text-align: center;
	    margin-bottom: 30px;
	    color: #2c3e50;
	    font-size: 2.5em;
	    font-weight: bold;
	}
	.menu {
		flex-direction: column;
		align-items: center; /* 가로 중앙 정렬 */
	    background-color: #ffffff;
	    border-radius: 8px;
	    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	    padding: 20px; 
	    margin: 0 auto;
	    width: 90%;
	    max-width: 400px;
	}
	.menu a {
	    display: block;
		width: 100%; /* 링크가 전체 너비를 차지하도록 설정 */
		text-align: center; /* 텍스트 가운데 정렬 */
	    padding: 15px;
	    color: #2980b9;
	    text-decoration: none;
	    border-radius: 5px 0;
	    margin-bottom: 15px;
	    transition: background-color 0.3s, color 0.3s;
	    font-size: 1.1em;
	}
	.menu a:hover {
	    background-color: #2980b9;
	    color: white;
	}
	.menu hr {
	    border: none;
	    border-top: 1px solid #e0e0e0;
	    margin: 10px 0;
		width: 100%;
	}
	p {
	    text-align: center;
	    color: #7f8c8d;
	    font-size: 1em;
	    margin-bottom: 20px;
	}
</style>
<body>
	<main class="main-container">
		<div id="app" class="content">
			<h1>고객센터</h1>
			<span v-if=!isLogin>
				<p>※고객 문의는 로그인을 해야 합니다.</p>
			</span>	
			<nav class=menu>
				<a href="noticelist">공지사항</a><hr>
				<a href="faqlist">자주 묻는 질문</a><hr>
				<span v-if=isLogin>	
					<a href="inquiry">문의하기</a><hr>
					<a href="myinquiry">내가 한 문의</a><hr>
				</span>
				<span v-if=isAdmin>
					<a href="history">문의 내역</a>
				</span>		
			</nav>	
		</div>
	</main>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				isLogin: false, // 로그인 상태
				isAdmin: false, //관리자 권한
            };
        },
        methods: {
			
        },
        mounted() {
			var self=this;
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					self.isLogin = false;
				};	
			})
			
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isAdmin") === 'true'){
					self.isAdmin = true;	
				} else{
					self.isAdmin = false;
				};	
			})
        }
    });
    app.mount('#app');
</script>