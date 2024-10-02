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
		/* Top Titles Section */
		.top-titles {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    margin-bottom: 20px;
		}
	
		.note-taking-title, .wrong-answer-title {
		    flex: 0 0 43%;
		    background: #58c672;
		    color: white;
		    text-align: center;
		    padding: 10px;
		    border-radius: 15px;
		    font-size: 24px;
		    margin: 0 10px;
		}
	
		.note-taking-title {
		    background: #58c672;
		}
	
		.wrong-answer-title {
		    background: #665bd0;
		}
	
		.month-selector {
		    flex: 0 0 10%;
		    padding: 8px;
		    font-size: 16px;
		    border-radius: 5px;
		    border: 1px solid #ddd;
		}
	
		/* Study Group Event Section */
		.study-group-event {
		    width: 100%;
		    text-align: center;
		}
	
		.awards-section {
		    display: flex;
		    justify-content: space-around;
		    gap: 40px;
		    margin: 0 auto;
		    max-width: 1200px;
		    width: 100%;
		}
	
		.award-item {
		    background: white;
		    border-radius: 15px;
		    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
		    width: 30%;
		    padding: 25px;
		    transition: transform 0.3s;
		}
	
		.award-item:hover {
		    transform: scale(1.05);
		}
	
		.award-medal {
		    font-size: 52px;
		    margin-bottom: 15px;
		    display: block;
		    text-align: center;
		}
	
		.award-medal.gold {
		    color: #ffd700;
		}
	
		.award-medal.silver {
		    color: #c0c0c0;
		}
	
		.award-medal.bronze {
		    color: #cd7f32;
		}
	
		.award-title {
		    font-size: 30px;
		    font-weight: bold;
		    margin-bottom: 20px;
		    text-align: center;
		}
	
		.award-image {
		    background: #e6e6e6;
		    border-radius: 15px;
		    width: 300px;
		    height: 250px;
		    margin: 0 auto 20px;
		    line-height: 250px;
		    font-size: 26px;
		    color: #999;
		}
	
		.award-description {
		    margin: 20px 0;
		    text-align: center;
		    font-size: 16px;
		    color: #555;
		    line-height: 1.5;
		}
	
		.award-description .award-highlight {
		    color: #4caf50;
		    font-weight: bold;
		    font-size: 20px;
		}
	
		.participant-photo {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    margin-top: 20px;
		    gap: 10px;
		    flex-direction: column; /* 이미지와 텍스트를 세로로 배치 */
		}
	
		.participant-photo img {
		    width: 100px;
		    height: 100px;
		    border-radius: 50%;
		    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		    transition: all 0.3s ease-in-out;
		}
	
	
		.participant-photo p {
		    margin-top: 10px; /* 텍스트와 이미지 사이의 간격 조정 */
		    font-weight: bold;
		    font-size: 16px;
		    color: #444;
		    text-align: center;
		}
	   </style>
	   <body>
	           <main class="main-container">
		       <div id="app" class="content">
	         
	                   <!-- Top Title Section -->
	                   <div class="top-titles">
	                       <div class="note-taking-title" @click="fnSee('1')">노트필기대회</div>
	                       <div class="wrong-answer-title" @click="fnSee('2')" >오답노트대회</div>
	                       <select id="month-select" class="month-selector" v-model="month" @change="fnevent3001(month)">
	                           <option value="01month">1월</option>
	                           <option value="02month">2월</option>
	                           <option value="03month">3월</option>
	                           <option value="04month">4월</option>
	                           <option value="05month">5월</option>
	                           <option value="06month">6월</option>
	                           <option value="07month">7월</option>
	                           <option value="08month">8월</option>
	                           <option value="09month">9월</option>
	                           <option value="10month">10월</option>
	                           <option value="11month">11월</option>
	                           <option value="12month">12월</option>
	                       </select>
	                   </div>
	
					   <div class="study-group-event">
		                 <!-- Award Section -->
		                 <div class="awards-section">
								<!-- 3001 노트필기 -->
							<template v-if="eventType =='1'">
			                     <!-- 1st Place -->
			                     <div class="award-item" v-if="event3001.length > 0" @click="fnView(event3001[0].targetId)">
			                         <span class="award-medal gold">1st</span>
			                         <div class="award-title">{{ event3001[0].userNickName }}</div>
			                             <img :src=event3001[0].filePath class="award-image">              
			                         <div class="award-description">
			                             <p class="award-highlight">대회 최고상 수상!</p>
										 <p class="award-highlight"> 좋아요 수 : {{ event3001[0].cntLike }}</p>
			                        
			                         </div>
									 <div class="participant-photo">
										<template v-if="event3001[0].userFile">
					                    	<img :src="event3001[0].userFile" class="award-image">
										</template>
										<template v-else>
					                    	<img  src="../src/profile.png" class="award-image" >
										</template>
									     <p>{{ event3001[0].userNickName }}</p>
									 </div>
									 <a>게시글 보러 가기</a>
			                     </div>
		
			                     <!-- 2nd Place -->
			                     <div class="award-item" v-if="event3001.length > 1"  @click="fnView(event3001[1].targetId)">
			                         <span class="award-medal silver">2nd</span>
			                         <div class="award-title">{{ event3001[1].userNickName }}</div>
			                         <img :src=event3001[1].filePath class="award-image">   
			                         <div class="award-description">
			                             <p class="award-highlight">우수상 수상!</p>
										 <p class="award-highlight"> 좋아요 수 : {{ event3001[1].cntLike }}</p>
			                           
			                         </div>
									 <div class="participant-photo">
										<template v-if="event3001[1].userFile">
					                    	<img :src="event3001[1].userFile" class="award-image">
										</template>
										<template v-else>
					                    	<img  src="../src/profile.png" class="award-image" >
										</template> 
									     <p>{{ event3001[1].userNickName }}</p>
									 </div>
									 <a>게시글 보러 가기</a>
			                     </div>
		
			                     <!-- 3rd Place -->
			                     <div class="award-item" v-if="event3001.length > 2"  @click="fnView(event3001[2].targetId)">
			                         <span class="award-medal bronze">3rd</span>
			                         <div class="award-title">{{ event3001[2].userNickName }}</div>
			                         <img :src=event3001[2].filePath class="award-image">   
			                         <div class="award-description">
			                             <p class="award-highlight">장려상 수상!</p>
										 <p class="award-highlight"> 좋아요 수 : {{ event3001[2].cntLike }}</p>
			                           
			                         </div>
									 <div class="participant-photo">
										<template v-if="event3001[2].userFile">
					                    	<img :src="event3001[2].userFile" class="award-image">
										</template>
										<template v-else>
					                    	<img  src="../src/profile.png" class="award-image" >
										</template>
									     <p>{{ event3001[2].userNickName }}</p>
									 </div>
									 <a>게시글 보러 가기</a>
			                     </div>
							 </template>
							 <!-- 노트필기!!-->
							 <template v-if="eventType =='2'">
	 		                     <!-- 1st Place -->
	 		                     <div class="award-item" v-if="event3002.length > 0"  @click="fnView(event3002[0].postId)">
	 		                         <span class="award-medal gold">1st</span>
	 		                         <div class="award-title">{{ event3002[0].userNickName }}</div>
	 		                             <img :src=event3002[0].filePath class="award-image">              
	 		                         <div class="award-description">
	 		                             <p class="award-highlight">대회 최고상 수상!</p>
	 									 <p class="award-highlight"> 좋아요 수 : {{ event3002[0].cntLike }}</p>
	 		                            
	 		                         </div>
	 								 <div class="participant-photo">
										<template v-if="event3002[0].userFile">
					                    	<img :src="event3002[0].userFile" class="award-image">
										</template>
										<template v-else>
					                    	<img  src="../src/profile.png" class="award-image" >
										</template> 
	 								     <p>{{ event3002[0].userNickName }}</p>
	 								 </div>
	 								 <a>댓글 보러 가기</a>
	 		                     </div>
	 	
	 		                     <!-- 2nd Place -->
	 		                     <div class="award-item" v-if="event3002.length > 1" @click="fnView(event3002[1].postId)" >
	 		                         <span class="award-medal silver">2nd</span>
	 		                         <div class="award-title">{{ event3002[1].userNickName }}</div>
	 		                         <img :src=event3002[1].filePath class="award-image">   
	 		                         <div class="award-description">
	 		                             <p class="award-highlight">우수상 수상!</p>
	 									 <p class="award-highlight"> 좋아요 수 : {{ event3002[1].cntLike }}</p>
	 		                            
	 		                         </div>
	 								 <div class="participant-photo">
										<template v-if="event3002[1].userFile">
					                    	<img :src="event3002[1].userFile" class="award-image">
										</template>
										<template v-else>
					                    	<img  src="../src/profile.png" class="award-image" >
										</template> 
	 								     <p>{{ event3002[1].userNickName }}</p>
	 								 </div>
	 								 <a>댓글 보러 가기</a>
	 		                     </div>
	 	
	 		                     <!-- 3rd Place -->
	 		                     <div class="award-item" v-if="event3002.length > 2" @click="fnView(event3002[2].postId)">
	 		                         <span class="award-medal bronze">3rd</span>
	 		                         <div class="award-title">{{ event3002[2].userNickName }}</div>
	 		                         <img :src=event3002[2].filePath class="award-image">   
	 		                         <div class="award-description">
	 		                             <p class="award-highlight">장려상 수상!</p>
	 									 <p class="award-highlight"> 좋아요 수 : {{ event3002[2].cntLike }}</p>
	 		                            
	 		                         </div>
	 								 <div class="participant-photo">
										<template v-if="event3002[2].userFile">
					                    	<img :src="event3002[2].userFile" class="award-image">
										</template>
										<template v-else>
					                    	<img  src="../src/profile.png" class="award-image" >
										</template>   
	 								     <p>{{ event3002[2].userNickName }}</p>
	 								 </div>
	 								 <a>댓글 보러 가기</a>
	 		                     </div>
	 						 </template>
	 						 <!-- 노트필기!!-->
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
						event3001 : [],
						event3002 : [],
						eventType : '1',
						month: '10month'  
						
		            };
		        },
		        methods: {
					fnView(boardId) {
						$.pageChange("/study-comm-detail", { boardId: boardId });
					},
					fnSee(a){
						this.eventType = a;
					},
					fnevent3001(month){
						var self = this;
						var nparmap = { month : month
						};
						$.ajax({
							url:"selectEvent3001.dox",
							dataType:"json",	
							type : "POST", 
							data : nparmap,
							success : function(data) {
								self.event3001 = data.event3001;
								self.event3002 = data.event3002;
								console.log(data);
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
					self.fnevent3001(self.month);
					self.created();
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