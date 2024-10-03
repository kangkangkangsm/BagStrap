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
		table {
			width:80%;
			border-collapse:collapse;
			margin:auto;
			margin-top:40px;
			
		}
		td {
			border:1px solid black;
			padding: 10px;
			
		}
		td:first-child {
			text-align:center;
			vertical-align:middle;
			background-color:#F0F0F0;
			color:black;
			width:100px;
		}
		.small-input {
			width:90px;
		}
		.small2-input {
			width:190px;
		}
		.phone-margin {
			margin-right:10px;
		}
		.zone-input {
			width:30px;
		}
		.addr-input {
			width:230px;
		}
		button {
			background-color:#FF8C00;
			color:white;
			border:none;
			border-radius:4px;
		}
		
		button:hover {
			background-color:#FFE0B2;
			color:black;
		}
		.save-margin {
			margin-right:5px;
		}
		.input-size {
			width:40px;
		}
		.input-size2 {
			width:300px;
		}
		.phone-width {
			margin-bottom:2px;
			color:gray;
			font-size:12px;
		}
		.phone-button {
			margin-right:5px;	
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
						<table>
						    <tr>
						        <td>아이디</td>
						        <td><input type="text" v-model="userList.userId" class="hidden-border" disabled></td>
						    </tr>
						    <tr>
						        <td>이름</td>
						        <td><input type="text" v-model="userList.userName" class="hidden-border" disabled></td>
						    </tr>
						    <tr>
						        <td>닉네임</td>
						        <td>
						            <template v-if="!NickView">
						                <input type="text" v-model="userList.userNickName" class="hidden-border small-input" disabled>
										<button @click="NickView=!NickView">변경하기</button>
						            </template>
						            <template v-else>
						                <input type="text" v-model="userList.userNickName" class="save-margin">
						                <button @click="fnNickUpdate" class="save-margin">저장</button>
						                <button @click="NickView=!NickView" class="save-margin">취소</button>
						            </template>
						        </td>
						    </tr>
						    <tr>
						        <td>이메일</td>
						        <td><input type="email" v-model="userList.email" class="hidden-border" disabled></td>
						    </tr>
						    <tr>
						        <td>주소</td>
						        <td>
						            <template v-if="!addressView">
						                <input type="text" v-model="userList.zonecode" class="hidden-border zone-input" disabled><br>
						                <input type="text" v-model="userList.address" class="hidden-border addr-input" disabled><br>
						                <input type="text" v-model="userList.addressDetail" class="hidden-border small2-input" disabled>
						            </template>
						            <template v-else>
						                <input type="text" v-model="userList.zonecode" class="save-margin input-size">
						                <button type="button" @click="fnAddr" class="save-margin">주소검색</button><br>
						                <input type="text" v-model="userList.address" class="input-size2"><br>
						                <input type="text" v-model="userList.addressDetail" class="save-margin input-size2">
						                <button @click="fnUpdate" class="save-margin">저장</button>
						                <button @click="addressView=!addressView" class="save-margin">취소</button>
						            </template>
						            <button v-if="!addressView" @click="addressView=!addressView">변경하기</button>
						        </td>
						    </tr>
						    <tr v-if="aaa == ''">
						        <td>핸드폰 번호</td>
						        <td>
									<div class="phone-width">휴대폰 번호가 바뀌셨습니까? 인증을 통해 바뀐 번호를 입력해주세요!</div>
									<template v-if="!phoneNumberView">
						            	<input class="phone-margin" placeholder="핸드폰 번호를 입력해주세요(01012341234형태)" v-model="userPhone" :disabled="isPhoneDisabled">
										<button @click="phoneNumberView=!phoneNumberView" class="phone-button">휴대폰인증</button>
									</template>
									<template v-else>										
										<input class="phone-margin" placeholder="" v-model="userPhone" :disabled="isPhoneDisabled">
						            	<button @click='makeConfirmNumbAndSendMessage' class="phone-button">휴대폰인증</button>
										<button @click="phoneNumberView=!phoneNumberView">취소</button>
									</template>
									
						        </td>
						    </tr>
						    <tr v-else>
						        <td>인증번호</td>
						        <td>
						            <div>인증만료시간: {{timer}}</div>
						            <input placeholder="인증번호를 입력해주세요" v-model="userInputNumb">
						            <button @click='confirmInputNumb'>인증하기</button>
						        </td>
						    </tr>
						</table>

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
				NickView:false,
				isPhoneDisabled:false,
				phoneNumberView:false,
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
					userId:self.userList.userId
				};
				$.ajax({
					url:"/myinfo.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log("AJAX 응답 데이터:")
						console.log(data);
						console.log(data.userList); 
						if (data.userList) {
				                self.userList = data.userList[0]; // userList가 유효한지 확인
				            } else {
				                console.error("userList가 존재하지 않습니다.");
				            }
				        },
				        error: function(xhr, status, error) {
				            console.error("AJAX 요청 실패:", status, error);
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
					
					
					if (!this.userInputNumb) {
			            alert("인증번호를 입력해주세요");
			            return;
			        }
		
					
		  			if(self.confirmNumb === self.userInputNumb){
		  				alert("인증되었습니다!");
						clearInterval(timeCheck);
						this.userPhone = null;
						this.aaa = '';
						this.userInputNumb = '';
						this.isPhoneDisabled = true;
		  			}else{
		  				alert("인증실패")
		  			}
		  			
		  		},
				fnNickUpdate() {
					var self = this;
					var nparam = {
						userId:self.userList.userId,
						userNickName:self.userList.userNickName
					};
					
					$.ajax({
						url:"/NickUpdate1.dox",
						dataType:"json",	
						type : "POST", 
						data : nparam,
						success : function(data) {
							console.log("AJAX 응답 데이터2:", data);
							console.log(data.userList); 
							console.log("닉네임 업데이트 데이터:", nparam);
							if(data.result == 'success'){
								self.NickView = false;
								} else {
								self.NickView = true;
								}
								alert(data.message);			   
						}
					});
				},
							
   	 },			
			
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>