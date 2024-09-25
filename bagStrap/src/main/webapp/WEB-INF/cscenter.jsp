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
	nav>a, span>a, nav>a:hover{
		color:black;
	}
</style>
<body>
	<div id="app">
		<h1>고객센터</h1>
		<span v-if=!isLogin>
			<p>※고객 문의는 로그인을 해야 합니다.</p>
		</span>	
		<nav>
			<a href="noticelist">공지사항</a><br><hr>
			<a href="faqlist">자주 묻는 질문</a><br><hr>
			<span v-if=isLogin>	
				<a href="inquiry">문의하기</a><br><hr>
				<a href="myinquiry">내가 한 문의</a><br><hr>
			</span>	
		</nav>	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				isLogin: false, // 로그인 상태
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
        }
    });
    app.mount('#app');
</script>