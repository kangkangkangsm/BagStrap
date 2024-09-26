<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
       body {
           font-family: Arial, sans-serif;
           margin: 0;
           padding: 0;
           background-color: #f5f5f5;
       }

       .container {
           max-width: 1200px;
           margin: 50px auto;
           padding: 20px;
           background-color: white;
           border-radius: 8px;
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
       }

       h1 {
           font-size: 32px;
           color: #333;
           margin-bottom: 20px;
       }

       .study-info {
           display: flex;
           justify-content: space-between;
           margin-bottom: 20px;
       }

       .study-details {
           width: 65%;
       }

       .study-details h2 {
           font-size: 24px;
           color: #007BFF;
       }

       .study-details p {
           font-size: 16px;
           color: #666;
           line-height: 1.6;
       }

       .study-meta {
           width: 30%;
           padding: 20px;
           border-left: 1px solid #ddd;
       }

       .study-meta h3 {
           font-size: 20px;
           margin-bottom: 10px;
           color: #333;
       }

       .study-meta p {
           font-size: 16px;
           margin-bottom: 10px;
           color: #333;
       }

       .study-meta p span {
           color: #666;
       }

       .cta-buttons {
           margin-top: 30px;
           display: flex;
           justify-content: space-between;
       }

       .cta-buttons a {
           text-decoration: none;
           color: white;
           padding: 10px 20px;
           border-radius: 5px;
           background-color: #007BFF;
           transition: background-color 0.3s;
       }

       .cta-buttons a:hover {
           background-color: #0056b3;
       }

       .cta-buttons a.secondary {
           background-color: #6c757d;
       }

       .cta-buttons a.secondary:hover {
           background-color: #5a6268;
       }

       /* Responsive */
       @media(max-width: 768px) {
           .study-info {
               flex-direction: column;
           }

           .study-details, .study-meta {
               width: 100%;
               border: none;
               padding: 0;
           }

           .cta-buttons {
               flex-direction: column;
           }

           .cta-buttons a {
               margin-bottom: 10px;
           }
       }
   </style>
<body>
	<div id="app">
		<main class="main-container">
			
	        <aside class="sidebar">
	           {{sessionUserId}}
	        </aside>
			
	        <div class="content">
				<div class="container">
				       <h1>정보처리기사 자격증 같이 준비하실 분</h1>
				       
				       <div class="study-info">
				           <!-- Study Details -->
				           <div class="study-details">
				               <h2>스터디 그룹 설명</h2>
				               <p>이 스터디 그룹은 정보처리기사 자격증을 준비하는 분들을 위한 모임입니다. 각자 학습 목표를 세우고 서로를 격려하며 공부를 이어가는 것이 목표입니다. 스터디에서는 각자의 공부 진도를 공유하고, 어려운 부분에 대한 질의응답을 진행합니다. 그리고 시험 전 모의고사와 함께 문제풀이 시간을 가질 예정입니다.</p>
				               <h2>스터디 일정</h2>
				               <p>매주 화요일과 목요일 오후 8시에 온라인에서 진행됩니다. 주 2회 모임을 기본으로 하며, 추가적으로 필요시 스터디원 간 협의 후 추가 모임을 가질 수 있습니다.</p>
				           </div>

				           <!-- Study Meta Information -->
				           <div class="study-meta">
				               <h3>그룹 정보</h3>
				               <p>👥 <span>참여 인원:</span> 1/10</p>
				               <p>📅 <span>생성일:</span> 2024-09-20</p>
				               <p>📍 <span>모임 위치:</span> 온라인 (Zoom)</p>
				               <p>💬 <span>문의 사항:</span> 스터디장에게 문의 가능</p>
				           </div>
				       </div>

				       <!-- Call to Action Buttons -->
				       <div class="cta-buttons">
				           <a href="#">참여 신청하기</a>
				           <a href="#" class="secondary">스터디 그룹 목록으로 돌아가기</a>
				       </div>
				   </div>
	        </div>
			
	    </main>
	</div>
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
					
	            };
	        },
	        methods: {
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