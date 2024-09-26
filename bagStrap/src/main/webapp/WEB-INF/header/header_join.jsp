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
				list:[],
				userId:"",
				userName:"",
				userNickName:"",
				password:"",
				confirmPassword:"",
				email:"",
				address:"",
				addressDetail:"",
				zonecode:"",
				phone:"",
				birth:"",
				gender:"",				
				isUserIdChecked: false,
				isUserNickNameChecked: false,
				isAddrDisabled:false
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
				var idRegex =/^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{5,}$/;
				if(!idRegex.test(self.userId)) {
					alert("아이디는 5자 이상이며 영문자와 숫자를 조합해야 합니다.");
					return;
				}
				var nameRegex=/^[^0-9]*$/;
				if(!nameRegex.test(self.userName)) {
					alert("이름에 숫자 입력은 불가합니다.");
					return;
				}	
				var pwdRegex=/^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+{}:";'<>?,.`~\-])[A-Za-z0-9!@#$%^&*()_+{}:";'<>?,.`~\-]{8,}$/;
				if(!pwdRegex.test(self.password)){
					alert("비밀번호는 8자 이상이며 영문자와 숫자 그리고 특수문자를 조합해야 합니다.");
					return;
				}
				var emailRegex=/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,63}$/;
				if(!emailRegex.test(self.email)){
					alert("이메일 형식을 지켜야 합니다.");
					return;
				}
				var phoneRegex=/^01[016789]\d{8}$/;
				if(!phoneRegex.test(self.phone)){
					alert("전화번호는 '-'없이 오직 숫자만 11자를 입력해야 합니다.");
					return;
				}
				var birthRegex=/^\d{6}$/;
				if(!birthRegex.test(self.birth)){
					alert("주민등록번호 앞자리는 6자리 숫자만 입력해야 합니다.");
					return;
				}
				var genderRegex=/^\d{1}$/;
				if(!genderRegex.test(self.gender)){
					alert("주민등록번호 뒷자리의 맨 앞자리는 숫자 한자리만 입력해야 합니다.");
					return;	
				}
				if (!self.isUserIdChecked) {
			        alert("아이디 중복검사를 하지 않았습니다.");
			        return;
			    }
				    
				if (!self.isUserNickNameChecked) {
			        alert("닉네임 중복검사를 하지 않았습니다.");
			        return;
			    }
					
				if (!self.userId) {
				           alert("아이디를 입력해주세요.");
				           return;
				       }
				       if (!self.userName) {
				           alert("이름을 입력해주세요.");
				           return;
				       }
				       if (!self.userNickName) {
				           alert("닉네임을 입력해주세요.");
				           return;
				       }
				       if (!self.password) {
				           alert("비밀번호를 입력해주세요.");
				           return;
				       }
				       if (!self.confirmPassword) {
				           alert("비밀번호 재확인을 입력해주세요.");
				           return;
				       }
				       if (self.password !== self.confirmPassword) {
				           alert("비밀번호가 일치하지 않습니다.");
				           return;
				       }
				       if (!self.email) {
				           alert("이메일을 입력해주세요.");
				           return;
				       }
					   if(!self.gender) {
							alert("주민등록번호 뒷자리의 맨 앞자리만 입력해 주세요.");
							return;
					   }
				       if (!self.address) {
				           alert("주소를 입력해주세요.");
				           return;
				       }
				       if (!self.addressDetail) {
				           alert("상세주소를 입력해주세요.");
				           return;
				       }
				       if (!self.phone) {
				           alert("휴대전화번호를 입력해주세요.");
				           return;
				       }
				       if (!self.birth) {
				           alert("주민등록번호 앞자리를 입력해주세요.");
				           return;
				       }
					   if(!self.gender) {
							alert("주민등록번호 뒷자리의 맨 앞자리만 입력해 주세요.");
							return;
					   }
					   
					   
					   
				var nparmap = {
						userId:self.userId,
						userName:self.userName,
						userNickName:self.userNickName,
						password:self.password,
						email:self.email,
						address:self.address,
						zonecode: self.zonecode,
						addressDetail:self.addressDetail,
						phone:self.phone,
						birth:self.birth,
						gender:self.gender
				};
				$.ajax({
					url:"/joinadd1.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert('가입하시겠습니까?');
						if(data.result == "success") {
							console.log(data);
							self.fnGetList();
							alert("환영합니다.");	
						}
						else{
							console.error("응답 데이터가 null");
						};
					}
				});
		   },
		   fnCheckuserId(){
			var self = this;
			
			if (!self.userId) {
	            alert("아이디를 입력해주세요.");
	            return;
			}	
			var nparam = {
				userId : self.userId
			};
			$.ajax({
				url:"/joinMultiCheck1.dox",
				dataType:"json",	
				type : "POST", 
				data : nparam,
				success : function(data) { 
					if(data.result == "success") {
						console.log(data);
						alert(data.message);
						self.isUserIdChecked = true;
						self.fnGetList();	
					   }else{
		 						alert(data.message);
		 					};
				}
			});
		 },
		 fnCheckNickName(){
		 			var self = this;
					
					if (!self.userNickName) {
			            alert("닉네임을 입력해주세요.");
			            return;
					}
		 			var nparam = {
		 				userNickName : self.userNickName
		 			};
		 			$.ajax({
		 				url:"/nickNameMultiCheck1.dox",
		 				dataType:"json",	
		 				type : "POST", 
		 				data : nparam,
		 				success : function(data) { 
		 					if(data.result == "success") {
		 						console.log(data);
		 						alert(data.message);
								self.isUserNickNameChecked = true;
		 						self.fnGetList();
							}else{
		 						alert(data.message);
		 					};
		 				}
		 			});
		 		 },
				 fnAddr() {
					var self = this;
					new daum.Postcode({
				        oncomplete: function(data) {
							console.log(data);
							self.address=data.address;
							self.zonecode=data.zonecode,
							self.isAddrDisabled=true;
							var nparam = {
								addressNo : self.addressNo,
								userId : self.userId,
								userName : self.userName,
								phone : self.phone,
								address:self.address,
								addressDetail : self.addressDetail,
								zonecode : self.zonecode
							};
				            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
							$.ajax({
				 				url:"/addAddress1.dox",
				 				dataType:"json",	
				 				type : "POST", 
				 				data : nparam,
				 				success : function(data) { 
				 					if(data.result == "success") {
				 						console.log(data);
				 						alert(data.message);
				 						self.fnGetList();
									}else{
				 						alert(data.message);
				 					};
				 				}
				 			});
							
				        }
				 	 }).open();
					
			 },
   	 },			
			
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>