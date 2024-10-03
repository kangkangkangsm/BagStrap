<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
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
							<span class="text" style=gray>필수 입력</span>
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
													<input type="text" v-model="userId" class="form_ip" placeholder="아이디를 입력하세요" maxlength="15">
													<button type="button" @click=fnCheckuserId>
														<span class="text">중복체크</span>														
													</button>
												</div>
												<span class="errorMessage" v-if="idError" :style="{color : 'red', fontSize: '13px' }">{{ idError }}</span>
												<span class="validMessage" v-if-else="isUserIdChecked" :style="{color : 'green', fontSize: '13px' }">{{ validMessage }}</span>	
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
													<input type="text" v-model="userName" @input="fnCheckUserName" class="form_ip" placeholder="아이디를 입력하세요" maxlength="15">
												</div>
											</div>
										</div>
										<span class="error-message" v-if="nameError" :style="{color : 'red', fontSize: '13px' }">{{ nameError }}</span>	
										<span class="valid-message" v-if="isUserNameChecked" :style="{color : 'green', fontSize: '13px' }">사용 가능한 이름입니다.</span>
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
													<input type="text" v-model="userNickName" class="form_ip" placeholder="닉네임를 입력하세요" maxlength="15">
													<button type="button" @click="fnCheckNickName">
														<span class="text">중복체크</span>														
													</button>
												</div>
												<span class="error-message" v-if="nickNameError" :style="{color : 'red', fontSize: '13px' }">{{ nickNameError }}</span>
												<span class="valid-message" v-if-else ="isUserNickNameChecked" :style="{color : 'green', fontSize: '13px' }">{{ validNickNameMessage }}</span>		
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
									    <input :type="isPasswordVisible ? 'text' : 'password'" v-model="password" @input="checkPasswordStrength" class="form_ip" placeholder="비밀번호를 입력하세요" maxlength="15">
									    <button type="button" class="btn_toggle_pw" @click="togglePasswordVisibility">
									        <span class="hidden">{{ isPasswordVisible ? '비밀번호 숨김 상태' : '비밀번호 보임 상태' }}</span>
									        {{ isPasswordVisible ? '' : '' }}
									    </button>        
									</div>
							        <div class="pw_valid_wrap">
							            <div class="valid_step_box">
											<ol class="valid_step_list">
											    <!-- 첫 번째 칸: passwordStrength >= 1이면 색상이 바뀝니다. -->
											    <li class="step_item" :style="{ backgroundColor: passwordStrength >= 1 ? (passwordStrength === 3 ? 'green' : (passwordStrength === 2 ? 'orange' : 'red')) : '#ccc' }">
											        <span v-if="passwordStrength >= 1" :class="{ active: passwordStrength >= 1}"></span>
											    </li>

											    <!-- 두 번째 칸: passwordStrength >= 2이면 색상이 바뀝니다. -->
											    <li class="step_item" :style="{ backgroundColor: passwordStrength >= 2 ? (passwordStrength === 3 ? 'green' : 'orange') : '#ccc' }">
											        <span v-if="passwordStrength >= 2" :class="{ active: passwordStrength >= 2}"></span>
											    </li>

											    <!-- 세 번째 칸: passwordStrength === 3일 때 색상이 바뀝니다. -->
											    <li class="step_item" :style="{ backgroundColor: passwordStrength === 3 ? 'green' : '#ccc' }">
											        <span v-if="passwordStrength === 3" :class="{ active: passwordStrength === 3}"></span>
											    </li>
											</ol>
											<div class="bubble_speech_box">
											    <span v-if="passwordStrength === 0" class="valid_state">안전도:</span>
											    <span v-else-if="passwordStrength === 1" class="valid_state">안전도: <span :style="{ color: 'red' }">낮음</span></span>
											    <span v-else-if="passwordStrength === 2" class="valid_state">안전도: <span :style="{ color: 'orange' }">보통</span></span>
											    <span v-else class="valid_state">안전도: <span :style="{ color: 'green' }">높음</span></span>
											</div>     
							            </div>    
										<ul class="pw_valid_list">
										    <!-- 첫 번째 조건: 비밀번호가 8자리 이상이고 영문, 숫자, 특수문자를 포함해야 함 -->
										    <li v-if="!isPasswordValidForLength" class="pw_valid_item" 
										        :style="{ 
										            backgroundImage: isPasswordValidForLength ? 'url(../src/green-check.png)' : 'url(../src/check.png)', 
										            color: isPasswordValidForLength ? 'green' : '#767676' 
										        }">
										        영문, 숫자, 특수문자 3가지 조합 8자리 이상
										    </li>

										    <!-- 두 번째 조건: 비밀번호에 공백이 없고 3자 이상의 연속된 문자가 없어야 함 -->
										    <li v-if="!isPasswordValidForNoSpaces" class="pw_valid_item" 
										        :style="{ 
										            backgroundImage: isPasswordValidForNoSpaces ? 'url(../src/green-check.png)' : 'url(../src/check.png)', 
										            color: isPasswordValidForNoSpaces ? 'green' : '#767676' 
										        }">
										        공백 및 3자 이상의 연속 또는 중복 문자는 사용불가
										    </li>

										    <!-- 모든 조건이 충족될 때 표시되는 메시지 -->
										    <li v-if="isPasswordValid" class="pw_valid_item" 
										        :style="{ 
										            backgroundImage: 'url(../src/green-check.png)', 
										            color: 'green' 
										        }">
										        사용 가능한 비밀번호입니다.
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
							        <div class="form_ip_pw">
							            <input :type="isConfirmPasswordVisible ? 'text' : 'password'" v-model="confirmPassword" @input="comparePasswords" class="form_ip" placeholder="비밀번호를 다시 입력하세요" maxlength="15">
							            <button type="button" class="btn_toggle_pw" @click="toggleConfirmPasswordVisibility">
							                <span class="hidden">{{ isConfirmPasswordVisible ? '비밀번호 숨김 상태' : '비밀번호 보임 상태' }}</span>
							            </button>
							        </div>
							        <!-- 상태 메시지: 비밀번호가 다를 때만 표시 -->
							        <span v-if="passwordsDoNotMatch" :style="{ color: 'red', fontSize: '13px' }">
							            비밀번호가 일치하지 않습니다.
							        </span>    
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
							                        <input type="email" v-model="email" @input="validateEmail" class="form_ip" placeholder="이메일을 입력하세요">
							                    </div>
							                </div>
							                <!-- 오류 메시지: 이메일이 유효하지 않을 때 표시 -->
							                <span v-if="emailError" class="error-message" :style="{ color: 'red', fontSize: '13px' }">{{ emailError }}</span>
							                <!-- 유효한 이메일인 경우 메시지 표시 -->
							                <span v-if="isEmailValid" class="valid-message" :style="{ color: 'green' }"></span>
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
							                        <input type="text" v-model="phone" @input="validatePhone" class="form_ip" placeholder="번호를 입력하세요">
							                        <button type="button" @click="fnCheckPhoneNumber">
							                            <span class="text">인증번호</span>
							                        </button>
							                    </div>
							                </div>
							                <!-- 오류 메시지: 전화번호가 유효하지 않을 때 표시 -->
							                <span v-if="phoneError" class="error-message" :style="{ color: 'red', fontSize: '13px' }">{{ phoneError }}</span>
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
													<button type="button" @click="fnAddr">
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
													<input type="text" v-model="addressDetail"  class="form_ip" placeholder="상세주소를 입력하세요">
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
							                    <input type="text" v-model="birth" @input="validateBirthAndGender" class="form_ip" placeholder="주민등록번호 앞 6자리 입력해주세요." maxlength="6">
							                   
												<div class="form_filter_box">
												    <span class="form_filter">
												        <input type="radio" id="male" v-model="gender" value="M">
												        <label for="male" :class="{ active: gender === 'M' }">
												            <span class="text">남</span>
												        </label>
												    </span>
												    <span class="form_filter">
												        <input type="radio" id="female" v-model="gender" value="F">
												        <label for="female" :class="{ active: gender === 'F' }">
												            <span class="text">여</span>
												        </label>
												    </span>
												</div>
							                
											</div>
							                <span v-if="birthError" class="error-message" :style="{ color: 'red', fontSize: '13px' }">{{ birthError }}</span>
							            </div>
							        </div>
							    </div>
							</div>
								
							
							
							<!--이미지 파일 넣기-->
							<div v-if="filePreview">
					            <img :src="filePreview" class="stu-comm-insert-image-preview" />
					        </div>

					        <div class="stu-comm-insert-buttons">
					            <button type="button" @click="fnBack()" class="cancel">취소</button>
					            <button type="button" @click="fnSave2()" class="submit" style="background-color: #343A40;">등록</button>
					        </div>
							
							
							
								<div class="btn_wrap justify page_bottom" id="joinComplete">
						            <button type="button" class="btn_lg btn_light_gray" @click="fnSave">
										<span class="text">회원가입</span>
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
				isUserNameChecked: false,
				isUserNickNameChecked: false,
				isPasswordVisible: false,
				isConfirmPasswordVisible: false,
				passwordsDoNotMatch: false,
				isAddrDisabled:false,
				isEmailValid: false,
				idError: "",
				nameError: "",
				nickNameError: "",
				eMailError: "",
				birthError: "",
				validMessage: "",
				validNickNameMessage: "",
				passwordStrength: 0
				
				
				
            };
        },
		computed: {
		    // 1. 조건 1: 비밀번호가 8자리 이상이고 영문, 숫자, 특수문자를 포함하는지 확인
		    isPasswordValidForLength() {
		        const length = this.password.length;
		        const hasLetters = /[A-Za-z]/.test(this.password);
		        const hasNumbers = /\d/.test(this.password);
		        const hasSpecialChars = /[!@#$%^&*(),.?":{}|<>]/.test(this.password);

		        return length >= 8 && hasLetters && hasNumbers && hasSpecialChars;
		    },
		    // 2. 조건 2: 비밀번호에 공백이 없고, 3자 이상의 연속된 문자가 없는지 확인
		    isPasswordValidForNoSpaces() {
		        return this.password.length > 0 && !/\s/.test(this.password) && !/(.)\1{2,}/.test(this.password);
		    },
		    // 3. 모든 조건이 충족되었는지 확인
		    isPasswordValid() {
		        return this.isPasswordValidForLength && this.isPasswordValidForNoSpaces;
		    }
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
			var idRegex = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{5,}$/;
			
			if (!self.userId) {
	            self.idError= "아이디를 입력해주세요.";
				self.isUserIdChecked = false;
				self.validMessage = "";
	            return;
			};
		    if(!idRegex.test(self.userId)) {
		        self.idError="아이디는 5자 이상이며 영문자와 숫자를 조합해야 합니다.";
				self.isUserIdChecked = false;
				self.validMessage = "";
		        return;
		    };
			
				
			var nparam = {
				userId : self.userId
			};
			$.ajax({
				url:"/joinMultiCheck1.dox",
				dataType:"json",	
				type : "POST", 
				data : nparam,
				success : function(data) {
					console.log(data);
 
					if(data.result === "success") {
						self.idError= "";
						self.isUserIdChecked = true;
						self.validMessage = "사용 가능한 아이디입니다.";
					   }else{
						self.validMessage = "";
						self.idError = "이미 사용중인 아이디입니다.";
						self.isUserIdChecked = false;
 					};
				}
			});
		 },
		fnCheckUserName() {
	         // 이름에 특수문자나 숫자가 포함되지 않도록 정규식 정의
	         var nameRegex = /^[가-힣a-zA-Z]+$/; // 한글과 영문자만 허용
			 var consonantOnlyRegex = /^[ㄱ-ㅎ]+$/; // 자음만
			 var vowelOnlyRegex = /^[ㅏ-ㅣ]+$/;     // 모음만

	         // 입력값이 비어있는지 확인
	         if (!this.userName.trim()) {
	             this.nameError = "이름을 입력해주세요.";
	             this.isUserNameChecked = false;
	             return;
	         }
			 // 자음만 입력된 경우
			 if (this.userName.length == 1 && consonantOnlyRegex.test(this.userName) && vowelOnlyRegex.test(this.userName)) {
			     this.nameError = "사용할 수 없는 이름입니다.";
			     this.isUserNameChecked = false;
			     return;
			 }

	         // 특수문자나 숫자가 포함된 경우
	         if (!nameRegex.test(this.userName)) {
	             this.nameError = "특수문자와 숫자는 사용할 수 없습니다.";
	             this.isUserNameChecked = false;
	         } else {
	             // 유효한 이름일 경우
	             this.nameError = "";
	             this.isUserNameChecked = true;
	         }
	     },
		  
		fnCheckNickName() {
		     var self = this;
		     var nickNameRegex =  /^[a-zA-Z0-9가-힣]+$/; // 공백 및 특수문자 사용 불가 정규식
			 var consonantOnlyRegex = /^[ㄱ-ㅎ]+$/; // 자음만
			 var vowelOnlyRegex = /^[ㅏ-ㅣ]+$/;     // 모음만
			 

		     // 닉네임이 공백 또는 빈 문자열인지 확인
		     if (!self.userNickName.trim()) {
		         self.nickNameError = "닉네임을 입력해주세요.";
		         self.isUserNickNameChecked = false;
		         self.validNickNameMessage = "";  // 성공 메시지 초기화
		         return;
		     }

		     // 닉네임 정규식 검사 (공백 포함 특수문자 사용 불가)
		     if (!nickNameRegex.test(self.userNickName)) {
		         self.nickNameError = "공백 또는 특수문자는 사용할 수 없습니다.";
		         self.isUserNickNameChecked = false;
		         self.validNickNameMessage = "";  // 성공 메시지 초기화
		         return;
		     }
			 if (self.userNickName.length < 2) {
			       self.nickNameError = "닉네임은 2글자 이상이어야 합니다.";
			       self.isUserNickNameChecked = false;
			       self.validNickNameMessage = "";  // 성공 메시지 초기화
			       return;
			   }
			   if (consonantOnlyRegex.test(self.userNickName) || vowelOnlyRegex.test(self.userNickName)) {
			       self.nickNameError = "사용할 수 없는 닉네임입니다.";
			       self.isUserNickNameChecked = false;
			       self.validNickNameMessage = "";  // 성공 메시지 초기화
			       return;
			   }
			   

		     // 서버에 닉네임 중복 체크 요청
		     var nparam = {
		         userNickName: self.userNickName
		     };

		     $.ajax({
		         url: "/nickNameMultiCheck1.dox",
		         dataType: "json",
		         type: "POST",
		         data: nparam,
		         success: function(data) {
		             if (data.result === "success") {
		                 // 닉네임 사용 가능
		                 console.log(data);
		                 self.nickNameError = "";  // 에러 메시지 제거
		                 self.isUserNickNameChecked = true;
		                 self.validNickNameMessage = "사용 가능한 닉네임입니다.";  // 성공 메시지 설정
		             } else {
		                 // 닉네임 중복
		                 self.nickNameError = "이미 사용중인 닉네임입니다.";
		                 self.isUserNickNameChecked = false;
		                 self.validNickNameMessage = "";  // 성공 메시지 초기화
		             }
		         },
		         error: function() {
		             // 서버 요청 실패 처리
		             self.nickNameError = "서버와의 통신 중 오류가 발생했습니다.";
		             self.isUserNickNameChecked = false;
		             self.validNickNameMessage = "";  // 성공 메시지 초기화
		         }
		     });
		},	
		checkPasswordStrength() {
	           const length = this.password.length;
	           const specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;  // 특수문자 정규식

	           // 비밀번호 길이에 따른 안전도 검사
			   if(length === 0) {
					this.passwordStrength = 0;
	           }else if (length >= 1 && length <= 4) {
	               this.passwordStrength = 1;  // 안전도: 낮음
	           } else if (length >= 5 && length <= 12) {
	               // 5~12글자이고 특수문자가 포함되면 안전도: 높음, 아니면 보통
	               if (specialCharRegex.test(this.password)) {
	                   this.passwordStrength = 3;  // 안전도: 높음
	               } else {
	                   this.passwordStrength = 2;  // 안전도: 보통
	               }
	           } else {
	               this.passwordStrength = 3;  // 비밀번호가 없을 때 초기 상태
	           }
	    },
		togglePasswordVisibility() {
		       this.isPasswordVisible = !this.isPasswordVisible; // 보임/숨김 상태 토글
		},
		toggleConfirmPasswordVisibility() {
		       this.isConfirmPasswordVisible = !this.isConfirmPasswordVisible; // 비밀번호 확인 입력란 보임/숨김 상태 토글
		},
		comparePasswords() {
               this.passwordsDoNotMatch = this.confirmPassword !== '' && this.password !== this.confirmPassword;
        },
		   // 이메일 부분 유효성 검사 
		validateEmail() {
		       const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,63}$/;

		       if (this.email === '') {
		           this.emailError = '이메일을 입력하세요.';
		           this.isEmailValid = false;
		       } else if (!emailRegex.test(this.email)) {
		           this.emailError = '올바른 이메일 형식이 아닙니다.';
		           this.isEmailValid = false;
		       } else {
		           this.emailError = '';
		           this.isEmailValid = true;
		       }
		},	
		validatePhone() {
	            const phoneRegex = /^01[016789]\d{7,8}$/;

	            if (this.phone === '') {
	                this.phoneError = '전화번호를 입력하세요.';
	                this.isPhoneValid = false;
	            } else if (!phoneRegex.test(this.phone)) {
	                this.phoneError = '올바른 전화번호 형식이 아닙니다.';
	                this.isPhoneValid = false;
	            } else {
	                this.phoneError = '';
	                this.isPhoneValid = true;
	            }
	    },
		validateBirthAndGender() {
		    // 정규식: 6자리 숫자 (생년월일)
		    const birthRegex = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;

		    if (!birthRegex.test(this.birth)) {
		        this.birthError = '올바른 형식이 아닙니다.';
		    } else {
		        this.birthError = '';
		        
		    }
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
			//self.fnGetList();
        }
    });
    app.mount('#app');
</script>