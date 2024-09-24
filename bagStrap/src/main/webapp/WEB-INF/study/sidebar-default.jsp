<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<main class="main-container">
			
	        <aside class="sidebar">
	           {{sessionUserId}}
	        </aside>
			
	        <div class="content">
			
	        </div>
			
	    </main>
	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>
<script>
	//localStorage.setItem('data', JSON.stringify(data));
	// JSON.parse(localStorage.getItem('data')).result
	 const app = Vue.createApp({
	        data() {
	            return {
					isLogin: false,
					sessionUserId: '',
					sessionUserNickName: '',
					
	            };
	        },
	        methods: {
				fnSession(){
					var self = this;
					var nparmap = {
					};
					$.ajax({
						url:"sharedHeader.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) {
								console.log(data);
							self.isLogin = data.isLogin 
							if(data.isLogin){
								self.sessionUserId = data.userId;
								self.sessionUserNickName = data.userNickName;
								self.isAdmin = data.isAdmin;
								console.log('세션아이디:', self.sessionUserId);  // sessionUserId가 제대로 설정되었는지 확인
							} else {
								self.sessionUserId = '';
								self.sessionUserNickName = '';
							}
						
						}
					});
				},
	        },
	        mounted() {
	            var self = this;
				self.fnSession();
				window.addEventListener('loginStatusChanged', function(){
					if(window.sessionStorage.getItem("isLogin") === 'true'){
						self.isLogin = true;	
					} else{
						self.isLogin = false;
					};
					self.fnSession();
				});

	        }
	    });
	    app.mount('#app');
	</script>