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
					<table>
						<tr>
							<th>이름</th>
							<th>닉네임</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이메일</th>
							<th>핸드폰 번호</th>
							<th>자격</th>
							<th>자격부여</th>
							<th>차단</th>
							<th>Y/N</th>
						</tr>
						<tr v-for="item in list">
								<td>{{item.userName}}</td>
								<td>{{item.userNickName}}</td>
								<td>{{item.userId}}</td>
								<td>{{item.password}}</td>
								<td>{{item.email}}</td>
								<td>{{item.phone}}</td>
								<td>{{item.status}}</td>
								<td>
									<button v-if="item.status == 'USER'" @click></button>
									<button></button>
								</td>
								<td>{{item.ban}}</td>
								<td>
								<button v-if="item.ban === 'N'" @click="fnAdminUpdate(item.userId, 'Y')">차단</buttton>
								<button v-else @click="fnAdminUpdate(item.userId, 'N')">해제
								</td>
						</tr>
					</table>
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
				list:[],
				userId:'',
				ban:''
			};
        },
        methods: {
			fnGetList() {
				var self=this;
				var nparam={};
				$.ajax({
					url:"/adminUsers.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) {
						console.log("AJAX 응답 데이터:", data); 
							self.list=data.list;	
					 }
				});
			},
			fnAdminUpdate(userId,ban) {
				var self=this;
				var nparam={
					userId:userId,
					ban:ban
				};
				$.ajax({
					url:"/updateAdmin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) {
					console.log("AJAX 응답 데이터:", data); 
						self.fnGetList();
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