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
							아이디<input type="text" v-model="userList.userId" readonly>
					    </div>
					    <div>
					        이름<input type="text" v-model="userList.userName" readonly>
					    </div>
						<div>
					        닉네임<input type="text" v-model="userList.userNickName" readonly>
					    </div>
						<div>
							이메일<input type="email" v-model="userList.email" readonly>
						</div>
					    <div>
					        주소<input type="text" v-model="addressList.address" readonly>
					    </div>
						<div>
							상세주소<input type="text" v-model="addressList.addressDetail">
						</div>
					    <div>
					        휴대전화<input type="text" v-model="userList.phone">
					    </div>
					    <div>
					        주민등록번호<input type="text" placeholder="주민등록번호 앞자리 전체 " v-model="userList.birth" readonly>-<input type="text" v-model="userList.gender" readonly>*****
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
				userId:'',
		        userName: '',
		        userNickName: '',
		        email: '',
		        address: '',
		        addressDetail: '',
		        phone: '',
		        birth: '',
		        gender: '',
		        list: [],
				userList : {},
				addressList : {}
			};
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					
				};
				$.ajax({
					url:"/myinfo2.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log("AJAX 응답 데이터:", data); 
						   self.userList = data.userList;
						   
					}
				});
           },
		   fnGetList2(){
   				var self = this;
   				var nparmap = {
   					
   				};
   				$.ajax({
   					url:"/myinfo2.dox",
   					dataType:"json",	
   					type : "POST", 
   					data : nparmap,
   					success : function(data) {
   						console.log("AJAX 응답 데이터2:", data); 
   						   self.addressList=data.addressList;
   						   
   					}
   				});
		   }
		   
   	 },			
			
        mounted() {
            var self = this;
			self.fnGetList();
			self.fnGetList2();
        }
    });
    app.mount('#app');
</script>