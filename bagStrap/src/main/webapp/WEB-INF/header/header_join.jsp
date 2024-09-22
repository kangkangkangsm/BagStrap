<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
					<div>
					    <div>
					        아이디<input type="text" v-model="userId">
					    </div>
					    <div>
					        이름<input type="text" v-model="userName">
					    </div>
					    <div>
					        닉네임<input type="text" v-model="userNickName">
					    </div>
					    <div>
					        비밀번호<input type="password" v-model="password">	
					    </div>
						<div>
							비밀번호 재확인<input type="password" v-model="confirmPassword">
						</div>
						<div>
							이메일<input type="email" v-model="email">
						</div>
					    <div>
					        주소<input type="text" v-model="addr">
					    </div>
					    <div>
					        BAN<input type="text" v-model="ban">
					    </div>
					    <div>
					        지위<input type="text" v-model="status">
					    </div>
					    <div>
					        휴대전화<input type="text" v-model="phoneNum">
					    </div>
					    <div>
					        날짜1<input type="date" v-model="cDatetime">
					    </div>
					    <div>
					        날짜2<input type="date" v-model="uDatetime">
					    </div>
					    <div>
					        <button @click="fnSave">제출하기</button>
					    </div>
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
				list:[],
				userId:"",
				userName:"",
				userNickName:"",
				password:"",
				confirmPassword:"",
				email:"",
				addr:"",
				ban:"",
				status:"",
				phoneNum:"",
				cDatetime:"",
				uDatetime:""
            };
        },
		
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url:"/join.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
					}
				});
            },
			
			fnSave(){
				var self = this;
				var nparmap = {
						userId:self.userId,
						userName:self.userName,
						userNickName:self.userNickName,
						password:self.password,
						email:self.email,
						addr:self.addr,
						ban:self.ban,
						status:self.status,
						phoneNum:self.phoneNum,
						cDatetime:self.cDatetime,
						uDatetime:self.uDatetime
				};
				$.ajax({
					url:"/joinadd1.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert('가입되었습니다.');
						if(data.result == "success") {
							console.log(data);
							self.fnGetList();	
						}else{
							console.error("응답 데이터가 null");
						};
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