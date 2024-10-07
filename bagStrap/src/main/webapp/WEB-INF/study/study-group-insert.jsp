<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<title>첫번째 페이지</title>
</head>
<style>
	/* 스터디 그룹 생성 폼 전체 컨테이너 */
	       .study-group-insert-form-container {
	           width: 100%;
	           max-width: 800px; /* 최대 너비 설정 */
	           background: #ffffff;
	           border-radius: 10px;
	           padding: 20px; /* 패딩 조정 */
	           display: flex;
	           flex-wrap: wrap;
	           justify-content: space-between;
	       
	           margin: 0 auto; /* 중앙 정렬 */
	       }

	       /* 폼 그룹 스타일 */
	       .study-group-insert-form-group {
	           width: 48%; /* 좌우에 2개씩 배치 */
	           display: flex;
	           flex-direction: column;
	           margin-bottom: 20px; /* 여백 조정 */
	       }

	       @media (max-width: 768px) {
	           .study-group-insert-form-group {
	               width: 100%; /* 작은 화면에서는 한 줄에 하나씩 */
	           }
	       }

	       /* 라벨 스타일 */
	       .study-group-insert-form-group label {
	           margin-bottom: 8px;
	           font-weight: bold;
	           font-size: 14px;
	           color: #333333;
	       }

	       /* 입력 필드 스타일 */
	       .study-group-insert-form-group input[type="text"],
	       .study-group-insert-form-group input[type="date"],
	       .study-group-insert-form-group input[type="time"],
	       .study-group-insert-form-group select {
	           border: 1px solid #dddddd;
	           border-radius: 5px;
	           padding: 12px 15px;
	           font-size: 14px;
	           background: #ffffff; /* 인풋 박스 배경색 하얀색으로 설정 */
	           transition: border 0.3s ease-in-out;
	       }

	       .study-group-insert-form-group input[type="text"]:focus,
	       .study-group-insert-form-group input[type="date"]:focus,
	       .study-group-insert-form-group input[type="time"]:focus,
	       .study-group-insert-form-group select:focus {
	           border: 1px solid #3a8ee6;
	           background: #f8f8f8; /* 포커스 시 배경색 변경 */
	       }

	       /* 전체 선택 박스 너비 맞춤 */
	       .study-group-insert-form-group select {
	           width: 100%;
	       }

	       /* 파일 업로드 스타일 */
	       #file-upload {
	           display: none;
	       }

	       /* 파일 미리보기 스타일 */
	       .stu-comm-insert-image-preview {
	           margin-top: 20px;
	           border: 1px solid #dddddd;
	           border-radius: 10px;
	           max-width: 100%;
	           max-height: 300px;
	       }

	       /* 버튼 공통 스타일 */
	       .study-group-insert-submit-btn {
	           padding: 12px 20px;
	           border: none;
	           border-radius: 5px;
	           cursor: pointer;
	           margin: 0 10px; /* 좌우 간격 조정 */
	           transition: background-color 0.3s ease-in-out;
	           width: 120px; /* 버튼 크기 조정 */
	           font-size: 14px; /* 텍스트 크기 조정 */
	       }

	       /* 취소 버튼 스타일 */
	       .cancel-btn {
	           background-color: #cccccc; /* 회색 계열 */
	           color: #333333; /* 텍스트 색상 */
	       }

	       .cancel-btn:hover {
	           background-color: #b3b3b3; /* 약간 진한 회색 */
	       }

	       /* 스터디 생성 버튼 스타일 */
	       .create-btn {
	           background-color: #ff6600; /* 주황색 */
	           color: #ffffff; /* 텍스트 흰색 */
	       }

	       .create-btn:hover {
	           background-color: #e65500; /* 약간 진한 주황색 */
	       }

	       /* 파일 미리보기 공간 */
	       .file-preview-container {
	           width: 48%;
	           display: flex;
	           flex-direction: column;
	           align-items: center;
	           justify-content: center;
	           padding: 10px;
	           border: 2px dashed #aaaaaa;
	           border-radius: 10px;
	           margin-bottom: 20px;
	           background-color: #f5f5f5;
	       }

	       @media (max-width: 768px) {
	           .file-preview-container {
	               width: 100%; /* 작은 화면에서는 전체 폭 사용 */
	           }
	       }

	       /* 파일 이름 텍스트 */
	       .file-preview-container p {
	           font-size: 14px;
	           color: #777777;
	           margin-top: 10px;
	           text-align: center;
	       }

	       /* 버튼 컨테이너 */
	       .button-group {
	           display: flex;
	           justify-content: center;
	           align-items: center;
	           width: 100%;
	           margin-top: 20px;
	       }

	       /* 활성화된 버튼 스타일 - 각 섹션에 독립적으로 적용 */
	       .age-section .study-group-sidebard-button.active,
	       .onoff-section .study-group-sidebard-button.active,
	       .subject-section .study-group-sidebard-button.active,
	       .gender-section .study-group-sidebard-button.active {
	           background-color: #cccccc; /* 배경색 더 진한 회색 */
	           color: #ffffff; /* 텍스트 흰색 */
	           border-color: #666666; /* 테두리 더 진한 회색 */
	           box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2); /* 그림자 감소 */
	           text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.5); /* 텍스트에 약간의 그림자 추가 */
	       }

	       /* 포커스 효과 추가 */
	       .study-group-sidebard-button:focus {
	           outline: none;
	           /* 차콜 색상으로 변경: rgba(54, 69, 79, 0.5) */
	           box-shadow: 0 0 0 3px rgba(54, 69, 79, 0.5); /* 차콜 외곽선 추가 */
	       }

	       /* 반응형 디자인 추가 */
	       @media (max-width: 480px) {
	           .study-group-insert-submit-btn {
	               width: 100px; /* 작은 화면에서는 버튼 크기 축소 */
	               padding: 10px 15px; /* 패딩 조정 */
	           }

	           .study-group-insert-form-container {
	               padding: 15px; /* 패딩 추가 조정 */
	           }
	       }
</style>
<body>
	<main class="main-container">
			<aside class="sidebar">
				<jsp:include page="/layout/header_sidebar.jsp"></jsp:include>
	        </aside>
			
		   <div id="app">
              <div class="content">
                  <div class="study-group-insert-form-container">
                      <div class="study-group-insert-form-group">
                          <label for="field">스터디 영역</label>
                          <select id="field" v-model="subjectTypeId" @change="fnBoardType(subjectTypeId)">
                              <option v-for="item in categoryList" v-show="item.boardTypeId >= 2000 && item.boardTypeId <= 2999" :value="item.boardTypeId">{{item.name}}</option>
                          </select>
                      </div>
                      <div class="study-group-insert-form-group">
                          <label for="studyName">스터디 이름 (24자 이내)</label>
                          <input type="text" id="studyName" name="studyName" v-model="studyName">
                      </div>
                      <div class="study-group-insert-form-group">
                          <label for="startDate">스터디 기간 (시작일)</label>
                          <input type="date" id="startDate" name="startDate" v-model="startdate">
                      </div>
                      <div class="study-group-insert-form-group">
                          <label for="endDate">스터디 기간 (종료일)</label>
                          <input type="date" id="endDate" name="endDate" v-model="enddate">
                      </div>
                      <div class="study-group-insert-form-group">
                          <label for="time">스터디 시간 설정</label>
                          <input type="time" id="time" name="time" v-model="studytime">
                      </div>
                      <div class="study-group-insert-form-group">
                          <label for="ageGroup">연령별</label>
                          <select id="ageGroup" name="ageGroup" v-model="age">
                              <option value="중딩">중딩</option>
                              <option value="고딩">고딩</option>
                              <option value="대딩">대딩</option>
                              <option value="성인">성인</option>
                          </select>
                      </div>
                      <div class="study-group-insert-form-group">
                          <label for="studyType">온라인/오프라인</label>
                          <select id="studyType" name="studyType" v-model="onOffMode">
                              <option value="온라인">온라인</option>
                              <option value="오프">오프</option>
                              <option value="혼합">혼합</option>
                          </select>
                      </div>
                      <div class="study-group-insert-form-group">
                          <label for="members">모집 인원</label>
                          <select id="members" name="members" v-model="maxParticipants">
                              <option value="2">1:1(과외)</option>
                              <option v-for="n in 18" :value="n + 2">{{n + 2}}명</option>
                          </select>
                      </div>
                      <div class="study-group-insert-form-group">
                          <label for="gender">성별</label>
                          <select id="gender" name="gender" v-model="genderGroup">
                              <option value="남성">남성</option>
                              <option value="여성">여성</option>
                              <option value="혼성">혼성</option>
                          </select>
                      </div>
                      <div class="study-group-insert-form-group">
                          <label for="book">참고 할 교재</label>
                          <div class="study-group-insert-book-list">
                              <select id="book" name="book" v-model="relatedBook">
								  <option value="">선택안함</option>
                                  <option v-for="item in typeList" :value="item.bookId">{{item.title}}</option>
                              </select>
                          </div>
                      </div>
                      <div class="study-group-insert-form-group">
                          <label for="description">스터디 설명 (50자 이내)</label>
                          <input type="text" id="description" name="description" v-model="description" maxlength="50">
                      </div>
                      <!-- 파일 업로드 및 미리보기 -->
                      <div class="study-group-insert-form-group">
                          <label for="file">스터디 그룹 이미지</label>
                          <input type="file" @change="fnFileChange">
                      </div>
                      <div class="file-preview-container" v-if="filePreview">
                          <img :src="filePreview" class="stu-comm-insert-image-preview"/>
                          <p>미리보기: {{fileName}}</p>
                      </div>
                  </div>
                  <div class="button-group">
                      <button class="study-group-insert-submit-btn cancel-btn" @click="fnback()">취소</button>
                      <button class="study-group-insert-submit-btn create-btn" @click="fnGroupInsert()">스터디 생성</button>
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
					isLogin: false,
					sessionUserId: '',
					sessionUserNickName: '',
					categoryList:[],
					typeList:[],
					filePreview: ''
					
	            };
	        },
	        methods: {
				insertStuGroupKingApply(userId,idx){
					var self = this;
					var nparmap = { userId : userId , idx : idx
					};
					$.ajax({
						url:"insertStuGroupKingApply.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
						}
					});
		        },
				fnback(){
					history.back();
				},
				fnGroupInsert(){
					var self = this;
					var today = new Date();
					   today.setHours(0, 0, 0, 0); // 오늘 날짜의 시간을 00:00:00으로 설정
					// 필수 입력 항목 체크
					    if (!self.subjectTypeId) {
					        alert("스터디 영역을 선택해주세요.");
					        return;
					    }

					    // 스터디 이름 24자 이내 확인
					    if (!self.studyName || self.studyName.length > 24) {
					        alert("스터디 이름을 24자 이내로 입력해주세요.");
					        return;
					    }

					    // 시작 기간 확인: 오늘 이전 날짜 선택 불가
					    if (!self.startdate) {
					        alert("스터디 시작일을 선택해주세요.");
					        return;
					    }

					    var startDateObj = new Date(self.startdate);
					    startDateObj.setHours(0, 0, 0, 0);
					    if (startDateObj < today) {
					        alert("스터디 시작일은 금일 날짜 이후로 선택해주세요.");
					        return;
					    }

					    if (!self.enddate) {
					        alert("스터디 종료일을 선택해주세요.");
					        return;
					    }

					    if (!self.studytime) {
					        alert("스터디 시간을 선택해주세요.");
					        return;
					    }

					    if (!self.age) {
					        alert("연령별 그룹을 선택해주세요.");
					        return;
					    }

					    if (!self.onOffMode) {
					        alert("온라인/오프라인을 선택해주세요.");
					        return;
					    }

					    if (!self.maxParticipants) {
					        alert("모집 인원을 선택해주세요.");
					        return;
					    }

					   

					    // 스터디 설명 50자 이내 확인
					    if (!self.description || self.description.length > 50) {
					        alert("스터디 설명을 50자 이내로 입력해주세요.");
					        return;
					    }
					var nparmap = { boardTypeId : self.subjectTypeId, userId : self.sessionUserId,
									studyName : self.studyName, startdate : self.startdate,
									enddate : self.enddate,  studytime : self.studytime,
									age : self.age, onOffMode : self.onOffMode, 
									maxParticipants : self.maxParticipants, genderGroup : self.genderGroup,
									groupPublic : self.groupPublic, groupPassword : self.groupPassword,
									relatedBook : self.relatedBook, description : self.description
					};
					$.ajax({
						url:"insertStuGroup.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							var idx = data.idx;
							self.insertStuGroupKingApply(self.sessionUserId, idx);
							console.log(idx);
							if (self.file) {
								  const formData = new FormData();
								  formData.append('file1', self.file);
								  formData.append('idx', idx);
								  $.ajax({
										url: '/fileUpload.dox',
										type: 'POST',
										data: formData,
										processData: false,  
										contentType: false,  
										success: function() {
										 alert("개설 신청이 완료 되었습니다. 관리자 확인후 개설됩니다.");
										  location.href = "/study-group-list";
										  self.filePreview = "";
										},
										error: function(jqXHR, textStatus, errorThrown) {
										  console.error('업로드 실패!', textStatus, errorThrown);
										}
								  });		
							  } else {
								alert("개설 신청이 완료 되었습니다. 관리자 확인후 개설됩니다.");
								  location.href = "/study-group-list";
								  self.filePreview = "";
							  }		
						}
					});
		        },			
				fnFileChange(event) {
				    const file = event.target.files[0];
				    this.file = file;

				    // 파일명이 있으면 표시
				    this.fileName = file.name;

				    // 이미지 파일인 경우 미리보기 표시
				    if (file && file.type.startsWith('image/')) {
				        const reader = new FileReader();
				        reader.onload = (e) => {
				            this.filePreview = e.target.result;
				        };
				        reader.readAsDataURL(file); // 이미지 파일을 읽음
				    } else {
				        this.filePreview = null; // 이미지가 아니면 미리보기 없음
				    }
				},		
				fnBoardType(boardTypeId){
				var self = this;
					var nparmap = { boardTypeId : boardTypeId
					};
					$.ajax({
						url:"selectStuGroupInsertBoardType.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							self.typeList = data.typeList;
						}
					});
		        },
				fnselectMyCommCategory(){
					var self = this;
					var nparmap = {
					};
					$.ajax({
						url:"selectMyCommCategory.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							self.categoryList = data.categoryList;
						}
					});
		        },
				fnSession(){
					var self = this;
					var nparmap = {
					};
					$.ajax({
						url:"sharedHeader.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) {
								console.log(data);
							self.isLogin = data.isLogin 
							if(data.isLogin){
								self.sessionUserId = data.userId;
								self.sessionUserNickName = data.userNickName;
								self.isAdmin = data.isAdmin;
								console.log('세션아이디:', self.sessionUserId);  // sessionUserId가 제대로 설정되었는지 확인
							} else {
								self.sessionUserId = '';
								self.sessionUserNickName = '';
							}
						
						}
					});
				},
	        },
	        mounted() {
	            var self = this;
				self.fnSession();
				self.fnselectMyCommCategory();
				// (추가) 로그인 상태가 변경되었을 때 세션 정보 다시 로드
				        window.addEventListener('loginStatusChanged', function () {
				            self.fnSession();  // (추가) 로그인 상태가 변경되었을 때 자동으로 세션 정보 업데이트
				        });
				window.addEventListener('loginStatusChanged', function(){
					if(window.sessionStorage.getItem("isLogin") === 'true'){
						self.isLogin = true;	
					} else{
						self.isLogin = false;
					};
					self.fnSession();
				});

	        }
	    });
	    app.mount('#app');
	</script>