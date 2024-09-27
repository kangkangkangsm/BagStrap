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
	</style>
</head>
<body>
		<main class="main-container">
			
	        <aside class="sidebar">
				<jsp:include page="/layout/header_sidebar.jsp"></jsp:include>
	        </aside>

	        <div class="content">
				<div id="app">
					<button @click="fnDeleteUp">탈퇴하기</button>
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
				
			};
        },
        methods: {
		   fnDeleteUp(){
			var self = this;
			var nparmap = {
				
			};
			$.ajax({
				url:"/deleteQuit.dox",
				dataType:"json",	
				type : "POST", 
				data : nparmap,
				success : function(data) {
					console.log("AJAX 응답 데이터1:", data); 
					if(data.result == 'success'){
						alert("정말로 탈퇴하시겠습니까?");
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