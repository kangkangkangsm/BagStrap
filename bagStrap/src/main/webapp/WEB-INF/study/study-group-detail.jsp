<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
    <title>첫번째 페이지</title>
    <!-- 외부 CSS 라이브러리 (예: Google Fonts) 추가 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        /* 기본 스타일 */
		.header {
		    display: flex;
		    width: 100%;
		    height: 0%; /* 헤더 높이 설정 */
		    background-color: white; /* 헤더 배경색 */
		    color: black;
		    align-items: center;
		    padding: 0 20px;
		    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		    position: sticky;
		    top: 0;
		    z-index: 1000;
		}

		.stu-group-detail {
		    background-color: white;
		    width: 100%;
		    max-width: 800px;
		    padding: 30px;
		    margin: 0 auto 40px auto; /* 변경된 부분 */
		}

        .stu-group-detail h1 {
            font-size: 2em;
            color: #2c3e50;
            margin-bottom: 15px;
            text-align: center;
        }

        .intro {
            font-size: 1.2em;
            color: #555;
            margin-bottom: 25px;
            text-align: center;
        }

        .details, .book-info {
            background-color: #f0f4f8;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 25px;
        }

        .details span {
            display: block;
            font-size: 1.1em;
            color: #333;
            margin-bottom: 10px;
        }

        .book-info {
            display: flex;
            flex-wrap: wrap;
            align-items: flex-start;
        }

        .book-info img {
            width: 120px;
            height: auto;
            border-radius: 8px;
            margin-right: 20px;
            margin-bottom: 20px;
        }

        .book-details {
            flex: 1;
            font-size: 1.1em;
        }

        .book-details h3 {
            margin: 0 0 10px 0;
            color: #2c3e50;
        }

        .book-details p {
            margin: 5px 0;
            color: #666;
        }

        .buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            margin-bottom: 20px;
        }

        .buttons button {
            flex: 1 1 45%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            font-size: 1em;
            cursor: pointer;
            color: white;
            transition: background-color 0.3s ease;
        }

        .join-btn {
            background-color: #ff7f50;
        }

        .join-btn:hover {
            background-color: #ff5722;
        }

        .share-btn {
            background-color: #1e90ff;
        }

        .share-btn:hover {
            background-color: #1c86ee;
        }

        .back-btn {
            background-color: #dcdcdc;
            color: #333;
            text-align: center;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #b0b0b0;
        }

        /* 추가된 상세 설명 섹션 스타일 */
        .detailed-description {
            background-color: white;
            width: 100%;
            max-width: 800px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 40px;
        }

        .detailed-description h2 {
            font-size: 1.8em;
            color: #2c3e50;
            margin-bottom: 15px;
            text-align: center;
        }

        .detailed-description p {
            font-size: 1.1em;
            color: #555;
            line-height: 1.6;
            margin-bottom: 15px;
        }
		.application-form {
		    background-color: white;
		    width: 100%;
		    max-width: 800px;
		  
		    margin-bottom: 40px;
		}

		.application-form h2 {
		    font-size: 1.8em;
		    color: #2c3e50;
		    margin-bottom: 15px;
		    text-align: center;
		}

		.form-group {
		    margin-bottom: 20px;
		}

		.form-group label {
		    font-size: 1.1em;
		    color: #333;
		    margin-bottom: 10px;
		    display: block;
		}

		.form-control {
		    width: 100%;
		    padding: 12px;
		    border-radius: 8px;
		    border: 1px solid #ccc;
		    font-size: 1em;
		    box-sizing: border-box;
		}

		textarea.form-control {
		    height: 100px;
		    resize: none;
		}
    </style>
</head>
<body>
	<main class="main-container">
		<aside class="sidebar">
			<jsp:include page="/layout/header_sidebar.jsp"></jsp:include>
        </aside>
						
		<!-- 메인 컨텐츠 -->
		<div id="app" class="content">
            <div class="stu-group-detail">              
                <img src="../src/스터디디테일.png" alt="책 표지" style="width: 100%; max-width: 400px; display: block; margin: 0 auto 20px auto;">

                <h1>[ {{ detailList.name }} ] {{ detailList.studyName }}</h1>
                <div class="intro">
                </div>

					<span>🔍 그룹 진행 방식</span>
                <div class="details">
					<span>🗓️ {{ detailList.stgStartDate }} ~ {{ detailList.stgEndDate }} </span>
					<span>⏰ {{ detailList.stgStudyTime }} </span>
                    <span>🧒 {{ detailList.age }}</span>
                    <span>🗂️ {{ detailList.onOffMode }}</span>
                    <span>👫 {{ detailList.genderGroup }} </span> 
					<template v-if="detailList.applyY == detailList.maxparticipants">
                    <span style="color:red;">👥 {{ detailList.applyY }} / {{ detailList.maxparticipants }} <a style="color:red;"> (참여 인원 마감)</a></span>
					</template>
					<template v-if="detailList.applyY != detailList.maxparticipants">
					<span>👥 {{ detailList.applyY }} / {{ detailList.maxparticipants }}</span>
					</template>
                </div>
		<template v-if="applyMode ==='N'">
                    <span>💡 그룹 소개</span>
                <div class="details">
					<span>{{ detailList.description }}</span>
                </div>
				<template v-if="detailList.image">
                <h2>그룹 관련 도서 정보</h2>
                <div class="book-info">
                    <img :src="detailList.image" alt="책 표지">
                    <div class="book-details">
                        <h3>{{ detailList.title }}</h3>
                        <p>저자: {{ detailList.author }}</p>
                        <p>평점: ★★★★☆</p>
                        <p>소개: {{ detailList.tbDescription }}</p>
                    </div>
                </div>
				</template>
				<span>📌 가입 방법</span>
	             <div class="details">
					<ol>
	                    <li><strong>모임 참가하기:</strong> 하단에 "모임 참가하기" 버튼을 클릭하세요.</li>
	                    <li><strong>자기 소개:</strong> 간단한 자기소개 및 학습 목표를 작성해주세요.</li>
	                    <li><strong>언제부터?</strong> 방장 승인 후 참여가 가능합니다.</li>
	                </ol>    
	             </div>
                <div class="buttons">
					<template v-if="detailList.applyY != detailList.maxparticipants">
			         <button class="join-btn" @click="joinGroup">모임 참가하기</button>
					</template>
					<template v-if="detailList.applyY == detailList.maxparticipants">
			         <button class="join-btn" style="background:gray;">인원 마감</button>
					</template>
                    <button class="back-btn" @click="fnBack()">돌아가기</button>
                </div>
		</template>
		<template v-if="applyMode ==='Y'">
			<div class="application-form">
			    <h2>모임 참가 신청</h2>
			        <div class="form-group">
			            <label for="selfIntro">자기소개:</label>
			            <textarea id="selfIntro" name="selfIntro" v-model="selfIntro" placeholder="간단한 자기소개를 작성해주세요." class="form-control"></textarea>
			        </div>
			        <div class="form-group">
			            <label for="studyGoal">학습 목표:</label>
			            <textarea id="studyGoal" name="studyGoal" v-model="studyGoal" placeholder="학습 목표를 작성해주세요." class="form-control"></textarea>
			        </div>

			        <div class="form-group">
			            <label for="additionalQuestions">추가 질문 (선택 사항):</label>
			            <textarea id="additionalQuestions" name="additionalQuestions" v-model="additionalQuestions" placeholder="궁금한 사항이 있다면 작성해주세요." class="form-control"></textarea>
			        </div>
					<div class="buttons">
					<button class="join-btn" @click="fnJoinSubscription(detailList.studyGroupId,selfIntro,studyGoal,additionalQuestions)">참가 신청하기</button>
					<button class="back-btn" @click="fncancle()">취소하기</button>
					</div>
			</div>
		</template>
		</div>
        </div>
    </main>

    <jsp:include page="/layout/footer.jsp"></jsp:include>
    <script>
        const app = Vue.createApp({
            data() {
                return {
                    isLogin: false,
                    sessionUserId: '',
                    sessionUserNickName: '',
                    boardNo: '${boardNo}',
                    detailList: {},
					applyMode : 'N',
					typeList:[],
					Subscription : {}
                };
            },
            methods: {
				fncancle(){
					var self = this;
					self.applyMode = 'N';
				},
			     fnJoinSubscription(studyGroupId,selfIntro,studyGoal,additionalQuestions){
					  var self = this;
					  if (!self.selfIntro) {
					      alert("자기소개 입력하세요.");
					      return;
					  }
					  if (!self.studyGoal) {
	  				      alert("학습목표는 중요합니다.");
	  				      return;
	  				  }
		              var nparmap = {userId : self.sessionUserId, studyGroupId : studyGroupId,
									selfIntro : selfIntro,  studyGoal : studyGoal, 	
									additionalQuestions : additionalQuestions				
					   };
		              $.ajax({
		                  url:"/selectStuGroupSubscription.dox",
		                  dataType:"json",    
		                  type : "POST", 
		                  data : nparmap,
		                  success : function(data) {
							console.log(data);
							if(data.Subscription === null || data.Subscription === undefined ){
								self.fnJoin(studyGroupId,selfIntro,studyGoal,additionalQuestions);
							}else if(data.Subscription.fetchapplstatus == 'N'){
								alert("이미 신청한 그룹 입니다. 방장의 승인을 기다려주세요.")
							}else if(data.Subscription.fetchapplstatus == 'L'){
								alert("입장이 차단되어진 그룹입니다. 사유 : " + data.Subscription.rejectionMessage);
							}else if(data.Subscription.fetchapplstatus == 'Y'){
								alert("이미 가입된 그룹 입니다.");
							} 
						  
		                  },
		              });
		        },
				fnJoin(studyGroupId,selfIntro,studyGoal,additionalQuestions){
					var self = this;
		              var nparmap = {userId : self.sessionUserId, studyGroupId : studyGroupId,
									selfIntro : selfIntro,  studyGoal : studyGoal, 	
									additionalQuestions : additionalQuestions				
					   };
		              $.ajax({
		                  url:"/insertStuGroupApply.dox",
		                  dataType:"json",    
		                  type : "POST", 
		                  data : nparmap,
		                  success : function(data) { 
		                      alert(data.message);
		                 	  self.applyMode = 'N'; 
							  self.selfIntro ='';
							  self.studyGoal ='';
							  self.additionalQuestions ='';
		                  },
		              });
		        },
                fnBack(){
                    history.back();
                },
				joinGroup(){
					var self = this;
					if(!self.isLogin){
						alert("로그인 먼저 하세요.");
						document.getElementById('headerLoginModal').showModal();
						document.getElementById('inputId').focus();
						return;
					}else{
					self.applyMode = 'Y';						
					}
				},
                fnDetail() {
                    const self = this;
                    const nparmap = { studyGroupId: self.boardNo };
                    $.ajax({
                        url: "selectStuGroupDetail.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function(data) {
                            console.log(data);
                            self.detailList = data.detailList;
                        },
                    });
                },
                fnSession() {
                    const self = this;
                    $.ajax({
                        url: "sharedHeader.dox",
                        dataType: "json",
                        type: "POST",
                        success: function(data) {
                            console.log(data);
                            self.isLogin = data.isLogin;
                            if (data.isLogin) {
                                self.sessionUserId = data.userId;
                                self.sessionUserNickName = data.userNickName;
                                self.isAdmin = data.isAdmin;
                                console.log('세션아이디:', self.sessionUserId);
                            } else {
                                self.sessionUserId = '';
                                self.sessionUserNickName = '';
                            }
                        },
                    });
                },
                shareGroup() {
                    // 공유 기능 구현 (예: 소셜 미디어 공유)
                    // 예시로 클립보드에 URL 복사
                    const shareURL = window.location.href;
                    navigator.clipboard.writeText(shareURL).then(() => {
                        alert('스터디 그룹 URL이 클립보드에 복사되었습니다.');
                    }).catch(() => {
                        alert('URL을 복사하는 데 실패했습니다.');
                    });
                }
            },
            mounted() {
                this.fnSession();
                this.fnDetail();
				// (추가) 로그인 상태가 변경되었을 때 세션 정보 다시 로드
				        window.addEventListener('loginStatusChanged', function () {
				            self.fnSession();  // (추가) 로그인 상태가 변경되었을 때 자동으로 세션 정보 업데이트
				        });
                window.addEventListener('loginStatusChanged', () => {
                    this.isLogin = window.sessionStorage.getItem("isLogin") === 'true';
                    this.fnSession();
                });
            }
        });
        app.mount('#app');
    </script>
</body>
</html>
