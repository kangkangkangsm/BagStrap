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
					<div>
					    <div>
					        아이디<input type="text" v-model="userId">
							<button @click=fnCheckuserId>중복검사</button>
					    </div>
					    <div>
					        이름<input type="text" v-model="userName">
					    </div>
					    
						<div>
					        닉네임<input type="text" v-model="userNickName" >
							<button @click="fnCheckNickName">중복검사</button>
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
					        주소<input type="text" v-model="address" :disabled=isAddrDisabled>
							<button @click="fnAddr">주소검색</button>
					    </div>
						<div>
							상세주소<input type="text" v-model="addressDetail">
						</div>
					    <div>
					        휴대전화<input type="text" v-model="phone">
					    </div>
					    <div>
					        생성일<input type="date" v-model="cDatetime">
					    </div>
					    <div>
					        주민등록번호<input type="text" placeholder="주민등록번호 앞자리 전체 " v-model="birth">-<input type="text" v-model="gender">*****
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
				
				list:[]
			};
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					
				};
				$.ajax({
					url:"/myinfo.dox",
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
        }
    });
    app.mount('#app');
</script>