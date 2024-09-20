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
	nav>a, nav>a:hover{
		color:black;
	}
</style>
<body>
	<div id="app">
		<h1>고객센터</h1><br>
		<nav>
			<a href="noticelist">공지사항</a><br><hr>
			<a href="faqlist">자주 묻는 질문</a><br><hr>
			<a href="contact_us_add.jsp">문의하기</a><br><hr>
			<a href="contact_us_mine.jsp">내 문의 내역</a><br><hr>
		</nav>	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				
            };
        },
        methods: {
			
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>