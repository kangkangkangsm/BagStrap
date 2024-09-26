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
					<div>
						<div>
							아이디<input type="text" v-model="userList.userId" disabled>
					    </div>
					    <div>
					        이름<input type="text" v-model="userList.userName" disabled>
					    </div>
						<div>
					        닉네임<input type="text" v-model="userList.userNickName" disabled>
					    </div>
						<div>
							이메일<input type="email" v-model="userList.email" disabled>
						</div>
					    <div>
					        주소
							<template v-if="!addressView">
								<input type="text" v-model="userList.zonecode" class="hidden-border" disabled><br>
								<input type="text" v-model="userList.address" class="hidden-border"disabled><br>
								<input type="text" v-model="userList.addressDetail" class="hidden-border" disabled>
							</template>
							<template v-else>
								<input type="text" v-model="userList.zonecode"><button type="button" @click="fnAddr">주소검색</button><br>
								<input type="text" v-model="userList.address"><br>
								<input type="text" v-model="userList.addressDetail">
								<button @click="fnUpdate">저장</button> <button @click="addressView=!addressView">취소</button>	
							</template>
						</div>
						<button @click="addressView=!addressView">변경하기</button>
					    <div>
					        휴대전화<input type="text" v-model="userList.phone" disabled>
					    </div>
						<div>
							<button @click="fnupload">변경하기</button>
						</div>
					    <div>
					        주민등록번호<input type="text" placeholder="주민등록번호 앞자리 전체 " v-model="userList.birth" disabled>
					    </div>
					    <div>
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
				zonecode:'',
		        address: '',
		        addressDetail: '',
		        phone: '',
		        birth: '',
		        gender: '',
		        list: [],
				userList : {},
				addressView:false
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
						console.log("AJAX 응답 데이터:", data); 
						   self.userList = data.userList;
						   
					}
				});
           },
		   fnUpdate(){
			var self = this;
			var nparmap = {
				userId: self.userList.userId,
	           zonecode: self.userList.zonecode,
	           address: self.userList.address,
	           addressDetail: self.userList.addressDetail
			};
			$.ajax({
				url:"/addressUpdate.dox",
				dataType:"json",	
				type : "POST", 
				data : nparmap,
				success : function(data) {
					console.log("AJAX 응답 데이터:", data); 
					if(data.result == 'success'){
						self.addressView = false;
						self.fnGetList();
						} else {
						self.addressView = true;
						}
						alert(data.message);
								   
				}
			});
		 },
		  fnAddr() {
			var self = this;
			new daum.Postcode({
			        oncomplete: function(data) {
						self.userList.zonecode = data.zonecode;
				        self.userList.address = data.address; 
						
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			        }
			    }).open();
		  }  
   	 },			
			
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>