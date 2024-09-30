<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<style>
		.content {
			
		}
		button {
			background-color:#FF8C00;
			border:none;
			color:white;
		}
		button:hover {
			background-color:#FFA726;
		}
	</style>
</head>
<body>
		<main class="main-container">
			
	        <aside class="sidebar">
				<jsp:include page="/layout/header_sidebar.jsp"></jsp:include>
	        </aside>

	        <div class="content">
				<div id="app">
					<div class=content>
						<div>정말로 떠나시는 건가요?</div>
						<div>본인 확인을 위해 비밀번호를 입력한 후, <strong>"탈퇴하기"</strong> 버튼을 눌러주세요.</div>
						<div><input type="password"></div>
						<button @click="fnConfrimPw">탈퇴하기</button>
					</div>
				</div>
			</div>
	    </main>

	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>
<script>
	//localStorage.setItem('data', JSON.stringify(data));
	// JSON.parse(localStorage.getItem('data')).result
    const app = Vue.createApp({
        data() {
            return {
				userId: '',
				password:''
			};
        },
        methods: {
			fnConfrimPw() {
				var self=this;
				var nparam={
					userId:self.userId,
					password:self.password
				};
				$.ajax({
					url:"/recheckPassword.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) {
						console.log("AJAX 응답 데이터4:", data); 
						if(data.result == 'success'){
							alert("정말로 탈퇴하시겠습니까?");
							self.fnDeleteUp();
							alert(data.message); 
						}
					}
				});
			},
		   fnDeleteUp(){
			var self = this;
			var nparmap = {
				userId:self.userId
			};
			$.ajax({
				url:"/deleteQuit1.dox",
				dataType:"json",	
				type : "POST", 
				data : nparmap,
				success : function(data) {
					console.log("AJAX 응답 데이터3:", data); 
					if(data.result == 'success'){
						alert(data.message); 
					}
				}
			});
		 }
   	 },			
			
        mounted() {
            var self = this;
			self.fnConfrimPw();
        }
    });
    app.mount('#app');
</script>