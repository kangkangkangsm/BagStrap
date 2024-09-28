<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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
				환불 리스트
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
				isLogin : true
				
				}
				
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					orderId : self.orderId
				};
				$.ajax({
					url:"/refundList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
					}
				});
            }
        },
        mounted() {
            var self = this;
			self.fnGetList();
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					alert('로그인하쇼');
					self.isLogin = false;
				};
				self.fnGetList();
			});
        }
    });
    app.mount('#app');
</script>