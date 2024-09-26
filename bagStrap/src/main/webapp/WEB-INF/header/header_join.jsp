<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/css/joinStyle.css">
	<script src="https://unpkg.com/vue@3"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<meta charset="UTF-8">
	<title>첫번째 페이지</title>
	<style>
	</style>
</head>
<body>
	<div id="app">
	<div class="wrapper member_login" id="mainDiv">
		<header class="header_wrapper">
			<div class="header_inner">
				<div class="logo_box">
					<a href="" class="logo_link">
						<img src="../src/현이의가방끈.png" alt="로고">
					</a>	
				</div>	
			</div>	
		</header>
		<main class="container_wrapper">
			<section class="contents_wrap">
				<div class="title_wrap title_size_md has_line">
					<p class="title_heading">
						회원가입 
					</p>
					<div class="right_area">
						<span class="step_round_desc">마지막 단계입니다!</span>
						<ol class="step_round_list">
							<li class="step_item">1</li>
							<li class="step_item active">2</li>
						</ol>		
					</div>	
				</div>
				<div class="title_wrap title_size_def">
					<div class="right_area">
						<span class="required">
							<span class="text">필수 입력</span>
						</span>	
					</div>	
				</div>	
				<div class="form_wrap">
					<form>
						<div id="joinforminsert">
							<div class="form_box">
								<div class="form_title">
									<label class="form_label">
										아이디
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									<label>												
								</div>
								<div class="form_cont">
									<div class="form_col_group">
										<div class="col_box">
											<div class="valid_check">
												<div class="input_btn_box">
													<input type="text" v-model="userId" class="form_ip" placeholder="아이디를 입력하세요">
													<button @click=fnCheckuserId>
														<span class="text">중복체크</span>														
													</button>
												</div>
												<span class="error-message" v-if="idError">{{ idError }}</span>
												<span class="valid-message" v-if="isUserIdChecked">사용 가능한 아이디입니다.</span>	
											</div>
										</div>	
									</div>					
								</div>		
							</div>
							<div class="form_box">
								<div class="form_title">
									<label class="form_label">
										이름
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									<label>												
								</div>
								<div class="form_cont">
									<div class="form_col_group">
										<div class="col_box">
											<div class="valid_check">
												<div class="input_btn_box">
													<input type="text" v-model="userName" class="form_ip" placeholder="아이디를 입력하세요">
												</div>
											</div>
										</div>
										<span class="error-message" v-if="nameError">{{ nameError }}</span>	
										<span class="valid-message" v-if="isUserNameChecked">사용 가능한 이름입니다.</span>
									</div>					
								</div>		
							</div>
							<div class="form_box">
								<div class="form_title">
									<label class="form_label">
										닉네임
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									<label>												
								</div>
								<div class="form_cont">
									<div class="form_col_group">
										<div class="col_box">
											<div class="valid_check">
												<div class="input_btn_box">
													<input type="text" v-model="userNickName" class="form_ip" placeholder="닉네임를 입력하세요">
													<button @click="fnCheckNickName">
														<span class="text">중복체크</span>														
													</button>
												</div>
												<span class="error-message" v-if="nickNameError">{{ nickNameError }}</span>
												<span class="valid-message" v-if="isUserNickNameChecked">사용 가능한 닉네임입니다.</span>		
											</div>
										</div>	
									</div>					
								</div>		
							</div>
							<div class="form_box">
								<div class="form_title">
									<label class="form_label">
										비밀번호
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									<label>												
								</div>
								<div class="form_cont">
									<div class="form_ip_pw">
										<input type="password" v-model="password" class="form_ip" placeholder="비밀번호를 입력하세요">
										<button type="button" class="btn_toggle_pw">
											<span class="hidden">비밀번호 숨김 상태</span>
										</button>		
									</div>
									<div class="pw_valid_wrap">
										<div class="valid_step_box">
											<ol class="valid_step_list">
												<li class="step_item">
													<span :class="{ active: passwordStrength >= 1}"></span>
												</li>
												<li class="step_item">
													<span :class="{ active: passwordStrength >= 2}"></span>
												</li>
												<li class="step_item">
													<span :class="{ active: passwordStrength >= 3}"></span>
												</li>
											</ol>
											<div class="bubble_speech_box">
												<span :class="{ active: passwordStrength >= 1}" class="valid_state">안전도: 낮음</span>
												<span :class="{ active: passwordStrength >= 2}" class="valid_state">안전도: 보통</span>
												<span :class="{ active: passwordStrength >= 3}" class="valid_state">안전도: 높음</span>
									
											</div>		
										</div>	
										<ul class="pw_valid_list">
											<li class="pw_valid_item">
												영문, 숫자, 특수문자 3가지 조합 8자리 이상 또는 
												<br>
												2가지 조합 10자리 이상													
											</li>
											<li class="pw_valid_item">
												공백 및 3자 이상의 연속 또는 중복 문자는 사용불가													
											</li>
											<li class="pw_valid_item">
												생일, 전화번호, 아이디 등 개인신상 정보 사용 불가													
											</li>									
										</ul>												
									</div>						
								</div>		
							</div>
							<div class="form_box">
								<div class="form_title">
									<label class="form_label">
										비밀번호 확인
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									<label>												
								</div>
								<div class="form_cont">
									<div class="form_col_group">
										<div class="col_box">
											<div class="valid_check">
												<div class="form_ip_pw">
													<div class="input_btn_box">
														<input type="password" v-model="confirmPassword" class="form_ip" placeholder="비밀번호를 다시 입력하세요">
														<button type="button" class="btn_toggle_pw">
															<span class="hidden">비밀번호 숨김 상태</span>
														</button>	
													</div>
												</div>	
											</div>
											<span class="error-message" v-if="passwordError">{{ passwordError }}</span>
										</div>	
									</div>					
								</div>		
							</div>
							<div class="form_box">
								<div class="form_title">
									<label class="form_label">
										이메일
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									<label>												
								</div>
								<div class="form_cont">
									<div class="form_col_group">
										<div class="col_box">
											<div class="valid_check">
												<div class="input_btn_box">
													<input type="email" v-model="email" class="form_ip" placeholder="이메일를 입력하세요">
												</div>
											</div>
											<span class="error-message" v-if="eMailError">{{ emailError }}</span>
											<span class="valid-message" v-if="isUsereMailChecked">사용 가능한 이메일입니다.</span>
										</div>	
									</div>					
								</div>		
							</div>
							<div class="form_box">
								<div class="form_title">
									<label class="form_label">
										휴대전화
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									<label>												
								</div>
								<div class="form_cont">
									<div class="form_col_group">
										<div class="col_box">
											<div class="valid_check">
												<div class="input_btn_box">
													<input type="text" v-model="phone" class="form_ip" placeholder="번호를 입력하세요">
													<button @click="fnCheckNickName">
														<span class="text">인증번호</span>														
													</button>
												</div>
											</div>
										</div>	
									</div>					
								</div>		
							</div>
							<div class="form_box">
								<div class="form_title">
									<label class="form_label">
										주소
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									<label>												
								</div>
								<div class="form_cont">
									<div class="form_col_group">
										<div class="col_box">
											<div class="valid_check">
												<div class="input_btn_box">
													<input type="text" v-model="address" :disabled=isAddrDisabled class="form_ip" placeholder="번호를 입력하세요">
													<button @click="fnCheckNickName">
														<span class="text">주소검색</span>														
													</button>	
												</div>
											</div>
										</div>	
									</div>					
								</div>		
							</div>
							<div class="form_box">
								<div class="form_title">
									<label class="form_label">
										상세주소
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									<label>												
								</div>
								<div class="form_cont">
									<div class="form_col_group">
										<div class="col_box">
											<div class="valid_check">
												<div class="input_btn_box">
													<input type="text" v-model="address" :disabled=isAddrDisabled class="form_ip" placeholder="번호를 입력하세요">
												</div>
											</div>
										</div>	
									</div>					
								</div>		
							</div>
							<div class="form_box">
								<div class="form_title">
									<label class="form_label">
										생년월일/성별
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									<label>												
								</div>
								<div class="form_cont">
									<div class="form_col_group">
										<div class="valid_check">
											<div class="input_btn_box">
												<input type="text" v-model="address" :disabled=isAddrDisabled class="form_ip" placeholder="번호를 입력하세요">
												<div class="form_filter_box">
													<span class="form_filter">
														<input type="radio" disabled>
														<label for="">
															<span class="text">
																남
															</span>
														</label>	
													</span>
													<span class="form_filter">
														<input type="radio" disabled>
														<label for="">
															<span class="text">
																여
															</span>
														</label>	
													</span>	
												</div>	
											</div>
										</div>
									</div>					
								</div>	
								<div class="btn_wrap justify page_bottom" id="joinComplete">
						            <button type="button" class="btn_lg btn_light_gray" disabled="disabled" @click="fnSave">
										<span class="text" @click="fnSave()">회원가입</span>
									</button>
						        </div>	
							</div>
								
							
						</div>	
											
					</form>	
				</div>	
					
			</section>	
		</main>	
			
	</div>	
	
</div>

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
			    var idRegex = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{5,}$/;
			    if(!idRegex.test(self.userId)) {
			        alert("아이디는 5자 이상이며 영문자와 숫자를 조합해야 합니다.");
			        return;
			    }
			    var nameRegex = /^[^0-9]*$/;
			    if(!nameRegex.test(self.userName)) {
			        alert("이름에 숫자 입력은 불가합니다.");
			        return;
			    }   
			    var pwdRegex = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+{}:";'<>?,.`~\-])[A-Za-z0-9!@#$%^&*()_+{}:";'<>?,.`~\-]{8,}$/;
			    if(!pwdRegex.test(self.password)){
			        alert("비밀번호는 8자 이상이며 영문자와 숫자 그리고 특수문자를 조합해야 합니다.");
			        return;
			    }
			    var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,63}$/;
			    if(!emailRegex.test(self.email)){
			        alert("이메일 형식을 지켜야 합니다.");
			        return;
			    }
			    var phoneRegex = /^01[016789]\d{8}$/;
			    if(!phoneRegex.test(self.phone)){
			        alert("전화번호는 '-'없이 오직 숫자만 11자를 입력해야 합니다.");
			        return;
			    }
			    var birthRegex = /^\d{6}$/;
			    if(!birthRegex.test(self.birth)){
			        alert("주민등록번호 앞자리는 6자리 숫자만 입력해야 합니다.");
			        return;
			    }
			    var genderRegex = /^\d{1}$/;
			    if(!genderRegex.test(self.gender)){
			        alert("주민등록번호 뒷자리의 맨 앞자리는 숫자 한자리만 입력해야 합니다.");
			        return; 
			    }
			    if (self.password !== self.confirmPassword) {
			        self.passwordError = "비밀번호가 일치하지 않습니다."; // passwordError 설정
			        return;
			    } else {
			        self.passwordError = ""; // 일치하면 오류 메시지 제거
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