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
		.container {
			display:flex;
			flex-direction:column;
			align-items:center;
			margin-top:200px;
			gap:10px;
		}
		button {
			background-color:#FF8C00;
			border-radius:4px;
			border:none;
			height:30px;
			width:80px;
			color:white;
			
		}
		button:hover {
			background-color:#FFA726;
			color:black;
		}
		.input-color {
			background-color:black;
			border-radius:4px;
			text-align:center;
			border:black;
			height:30px;
			color:white; 
			width: 200px;
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
					<div class="container">
						<div class="text-section">정말로 현이의 가방끈을 떠나시나요? 비밀번호로 인증 후 "탈퇴하기"버튼을 눌러주세요.</div>
						<input type="password" class="input-color" v-model="password">
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
				password:""
			};
        },
        methods: {
			fnConfrimPw() {
				
				var self=this;
				if(!self.password) {
					alert("비밀번호를 입력해주세요.");
					return;
				}
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
							confirm("정말로 탈퇴하시겠습니까?");
							self.fnDeleteUp();
	                        alert(data.message);
						}else {
                            alert("비밀번호가 일치하지 않습니다.");
                        }
					 }
				});
			},
			fnDeleteUp() {
				var self=this;
				var nparam={
					userId:self.userId
				};
				$.ajax({
					url:"/deleteQuit1.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
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
			
        }
    });
    app.mount('#app');
</script>