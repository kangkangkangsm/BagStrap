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
					<div>
						<div>
							아이디<input type="text" v-model="userList.userId" class="hidden-border" disabled>
					    </div>
					    <div>
					        이름<input type="text" v-model="userList.userName" class="hidden-border" disabled>
					    </div>
						<div>
					        닉네임<input type="text" v-model="userList.userNickName" class="hidden-border" disabled>
					    </div>
						<div>
							이메일<input type="email" v-model="userList.email" class="hidden-border" disabled>
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
							<button v-if="!addressView" @click="addressView=!addressView">변경하기</button>
						</div>
						<div v-if="aaa == ''">
							<input placeholder="핸드폰 번호를 입력해주세요(01012341234형태)" v-model="userPhone">
							<button @click='makeConfirmNumbAndSendMessage'>휴대폰인증</button>
						</div>
						<div v-else>
							<div>인증만료시간: {{timer}}</div>
							<input placeholder="인증번호를 입력해주세요" v-model="userInputNumb">
							<button @click='confirmInputNumb'>인증하기</button>
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
				addressView:false,
				phoneView:false,
				userPhone : null,
				confirmNumb : null,
				userInputNumb : null,
				timer:180,
				aaa: ''
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
						console.log("AJAX 응답 데이터:")
						console.log(data); 
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
					console.log("AJAX 응답 데이터1:", data); 
					if(data.result == 'success'){
						self.addressView = false;
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
						self.userList.addressDetail = ''; 
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			        }
			    }).open();
		  },
		  makeConfirmNumbAndSendMessage(){
		  			var self = this;		  			
		  			var nparmap = {userPhone : self.userPhone}
		  			$.ajax({
		  				url:"confirm.dox",
		  				dataType:"json",	
		  				type : "POST", 
		  				data : nparmap,
		  				success : function(data) { 
		  					console.log(data);
		  					alert("인증번호가 발신되었습니다. 핸드폰을 확인해주세요")
		  					self.aaa = data.confirmNumb;
							console.log(self);
							

		  					
		  					timeCheck = setInterval(() => {
		  						if(self.timer === 0){
		  							alert("시간이 만료되었습니다")
		  							clearInterval(timeCheck);
		  							location.href="myinfo.do"
		  						}else {
		  							self.timer -= 1;	
		  						}
		  					}, 1000);
		  					
		  				}
		  			});
		  		},
		  		confirmInputNumb(){
		  			if(self.confirmNumb === self.userInputNumb){
		  				alert("인증되었습니다!");
		  			}else{
		  				alert("인증실패")
		  			}
		  			
		  		}

   	 },			
			
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>