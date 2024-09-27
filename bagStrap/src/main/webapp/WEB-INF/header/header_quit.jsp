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
		.hidden-border {
			border:none;
			outline:none;
			background-color:white;
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
					<button @click="">회원탈퇴</button>
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
            fnGetList(){
				var self = this;
				var nparmap = {
					
				};
				$.ajax({
					url:"/quit.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log("AJAX 응답 데이터:")
						console.log(data); 
						   self.userList = data.userList;
						   
					}
				});
           },
		   fnDelete() {
				var self = this;
				var nparmap = {
				
				};
				$.ajax({
					url:"/quit.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log("AJAX 응답 데이터:")
						console.log(data); 
						   self.userList = data.userList;
						   
					}
				});
		   }

   	 },			
			
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>