<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css"/>
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/style.css">
    <title>첫번째 페이지</title>
	<style>
   /* 전체 레이아웃 스타일 */
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



   /* 마이보드 컨테이너 */
   .stu-comm-myboard-container {
       background-color: #fff;
       padding: 20px;
       border-radius: 10px;
       margin-bottom: 30px;
       box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
   }

   /* 헤더 스타일 */
   .stu-comm-myboard-h3 {
       font-size: 24px;
       color: #333;
       padding-bottom: 10px;
       margin-bottom: 20px;
       border-bottom: 2px solid #e0e0e0;
   }

   /* 버튼 스타일 */
   .stu-comm-myboard-btn {
       display: block;
       background-color: #007BFF;
       color: white;
       padding: 10px 20px;
       border: none;
       border-radius: 5px;
       text-align: center;
       cursor: pointer;
       margin: 0 auto 20px;
       max-width: 200px;
       transition: background-color 0.3s ease;
   }

   .stu-comm-myboard-btn:hover {
       background-color: #0056b3;
   }

   /* 포럼 컨테이너 */
   .stu-comm-myboard-forum-container {
       display: flex;
       align-items: center;
       padding: 15px;
       border: 1px solid #e0e0e0;
       border-radius: 8px;
       margin-bottom: 10px;
       background-color: #fafafa;
   }

   .stu-comm-myboard-forum-icon {
       width: 50px;
       height: 50px;
       border-radius: 50%;
       object-fit: cover;
       margin-right: 15px;
       cursor: pointer;
       transition: transform 0.3s;
   }

   .stu-comm-myboard-forum-icon:hover {
       transform: scale(1.05);
   }

   .stu-comm-myboard-forum-text {
       display: flex;
       flex-direction: column;
       flex: 1;
   }

   .stu-comm-myboard-forum-title {
       font-size: 18px;
       font-weight: bold;
       color: #007BFF;
       cursor: pointer;
       margin-bottom: 5px;
   }

   .stu-comm-myboard-forum-title:hover {
       text-decoration: underline;
   }

   .stu-comm-myboard-forum-subtitle {
       font-size: 14px;
       color: gray;
   }

   /* 숨기기 링크 */
   .hide-link {
       margin-left: auto;
       color: black;
       font-size: 14px;
       text-decoration: none;
       cursor: pointer;
       font-weight: bold;
   }

   .hide-link:hover {
       text-decoration: underline;
       color: #007BFF;
   }

   /* 테이블 스타일 */
   .stu-comm-myboard-table {
       width: 100%;
       border-collapse: collapse;
       margin-top: 20px;
   }

   .stu-comm-myboard-th, .stu-comm-myboard-td {
       padding: 15px;
       text-align: center;
       border-bottom: 1px solid #e0e0e0;
   }

   .stu-comm-myboard-th {
       background-color: #f0f0f0;
       color: #333;
   }

   .stu-comm-myboard-td {
       color: #333;
   }

   .stu-comm-myboard-a {
       color: #007BFF;
       text-decoration: none;
       font-weight: bold;
       transition: color 0.3s ease;
   }

   .stu-comm-myboard-a:hover {
       text-decoration: underline;
       color: #0056b3;
   }

   .stu-comm-myboard-span {
       display: block;
       color: #999;
       font-size: 14px;
       margin-top: 5px;
   }

   /* 리스트 스타일 */
   .stu-comm-myboard-ul {
       list-style-type: none;
       padding: 0;
       margin: 0;
   }

   .stu-comm-myboard-li {
       padding: 10px 0;
       border-bottom: 1px solid #e0e0e0;
   }

   .stu-comm-myboard-li:last-child {
       border-bottom: none;
   }

   /* 페이징 스타일 */
   .stu-comm-myboard-pagination {
       display: flex;
       justify-content: center;
       align-items: center;
       margin-top: 20px;
       flex-wrap: wrap;
   }

   .stu-comm-myboard-pagination button {
       padding: 10px 15px;
       border: none;
       margin: 5px;
       background-color: #007BFF;
       color: white;
       border-radius: 5px;
       cursor: pointer;
       transition: background-color 0.3s ease;
   }

   .stu-comm-myboard-pagination button:hover:not(:disabled) {
       background-color: #0056b3;
   }

   .stu-comm-myboard-pagination button:disabled {
       background-color: #ccc;
       cursor: not-allowed;
   }

   .stu-comm-myboard-pagination button.active {
       background-color: #0056b3;
   }


    </style>
</head>
<body>
    <main class="main-container">
		<aside class="sidebar">
			<jsp:include page="/layout/header_sidebar.jsp"></jsp:include>
        </aside>
        <div id="app" class="content">
            <div class="stu-comm-myboard-container">
                <!-- 활동중인 스터디 (마이페이지)-->
                <template v-if="sessionUserId === author">
                    <div class="stu-comm-myboard-post-section">
                        <h3 class="stu-comm-myboard-h3">활동중인 스터디</h3>
                        <!-- fetchapplstatus가 'Y'인 데이터만 출력 -->
                        <div class="stu-comm-myboard-forum-container" v-for="item in activeStudies" :key="item.studyGroupId">
                            <img :src="item.filePath || '../src/profile.png'" alt="Forum Icon" class="stu-comm-myboard-forum-icon" @click="fnStudyHome(item.studyGroupId)">
                            <div class="stu-comm-myboard-forum-text">
                                <span class="stu-comm-myboard-forum-title" @click="fnStudyHome(item.studyGroupId)">{{item.studyName}}</span>
                                <span class="stu-comm-myboard-forum-subtitle" @click="fnStudyHome(item.studyGroupId)">
                                    <template v-if="item.stustatus === 'admin'">
                                        👑 | 👥 {{item.applyY}} / {{item.maxparticipants}} | 신청내역 : {{item.applyN}}
                                    </template>
                                    <template v-else>
                                        👥 {{item.applyY}} / {{item.maxparticipants}}
                                    </template>
                                </span>
                            </div>
                            <a href="#" class="hide-link" @click="fnStudyHide(item.studyGroupId, item.fetchappuserid)">
                                {{ item.sgHide === 'Y' ? '비공개 (현재 공개중)' : '공개하기 (현재 비공개중)' }}
                            </a>
                        </div>
                    </div>
                </template>
                
                <!-- 활동중인 스터디 (상대방)-->
                <template v-if="sessionUserId !== author">
                    <div class="stu-comm-myboard-post-section">
                        <h3 class="stu-comm-myboard-h3">활동중인 스터디</h3>
                        <!-- fetchapplstatus가 'Y'인 데이터만 출력 -->
                        <div class="stu-comm-myboard-forum-container" v-for="item in activeStudies" :key="item.studyGroupId">
                            <template v-if="item.sgHide === 'Y'">	
                                <img :src="item.filePath || '../src/profile.png'" alt="Forum Icon" class="stu-comm-myboard-forum-icon">
                                <div class="stu-comm-myboard-forum-text">
                                    <span class="stu-comm-myboard-forum-title">{{item.studyName}}</span>
                                    <template v-if="item.stustatus === 'admin'">
                                        <span class="stu-comm-myboard-forum-subtitle">👑 | 👥 {{item.applyY}} / {{item.maxparticipants}} | 신청내역 : {{item.applyN}}</span>
                                    </template>
                                    <template v-else>
                                        <span class="stu-comm-myboard-forum-subtitle">👥 {{item.applyY}} / {{item.maxparticipants}}</span>
                                    </template>
                                </div>
                            </template>
                            <template v-else>
                                <span class="stu-comm-myboard-forum-title" style="font-size:15px;">사용자가 비공개한 스터디그룹 입니다.</span>
                            </template>
                        </div>
                    </div>
                </template>
                
                <!-- 신청 대기중인 스터디 -->
                <template v-if="sessionUserId === author">
                    <div class="stu-comm-myboard-post-section">
                        <h3 class="stu-comm-myboard-h3">신청 대기중인 스터디</h3>
                        <!-- fetchapplstatus가 'N'인 데이터만 출력 -->
                        <div class="stu-comm-myboard-forum-container" v-for="item in pendingStudies" :key="item.studyGroupId">
                            <img :src="item.filePath || '../src/profile.png'" alt="Forum Icon" class="stu-comm-myboard-forum-icon">
                            <div class="stu-comm-myboard-forum-text">
                                <span class="stu-comm-myboard-forum-title">{{item.studyName}}</span>
                                <span class="stu-comm-myboard-forum-subtitle">신청 대기중</span>
                            </div>
                        </div>
                    </div>
                </template>
                
                <!-- 나의 게시글 -->
                <h3 class="stu-comm-myboard-h3">나의 게시글</h3>
                <div class="stu-comm-myboard-info">
                    <table class="stu-comm-myboard-table">
                        <tr>
                            <th class="stu-comm-myboard-th"><a class="stu-comm-myboard-a" href="#" @click="fnBoardMode">게시글</a></th>
                            <th class="stu-comm-myboard-th"><a class="stu-comm-myboard-a" href="#" @click="fnCommentMode">댓글</a></th>
                        </tr>
                        <tr>
                            <td class="stu-comm-myboard-td"><a class="stu-comm-myboard-a" href="#" @click="fnBoardMode">{{countMyCommCnt}}</a></td>
                            <td class="stu-comm-myboard-td"><a class="stu-comm-myboard-a" href="#" @click="fnCommentMode">{{countMycommentCnt}}</a></td>
                        </tr>
                    </table>
                </div>
                
                <!-- 게시글 리스트 -->
                <template v-if="itemMode === 'board'">	
                    <div class="stu-comm-myboard-post-section">      
                        <ul class="stu-comm-myboard-ul">
                            <li class="stu-comm-myboard-li" v-for="item in selectMyCommList" :key="item.boardId">
                                <a class="stu-comm-myboard-a" href="#" @click="fnBoardDetail(item.boardId)">{{item.title}}</a>
                                <span class="stu-comm-myboard-span" @click="fnBoardDetail(item.boardId)">{{item.createdDate}}</span>
                            </li>
                        </ul>
                    </div>
                </template>
                
                <!-- 댓글 리스트 -->
                <template v-if="itemMode === 'comment'">
                    <div class="stu-comm-myboard-study-section"> 
                        <ul class="stu-comm-myboard-ul">
                            <li class="stu-comm-myboard-li" v-for="item in selectMyCommentList" :key="item.postId">
                                <a class="stu-comm-myboard-a" href="#" @click="fnBoardDetail(item.postId)">{{item.content}}</a>
                                <span class="stu-comm-myboard-span" @click="fnBoardDetail(item.postId)">{{item.createdDate}}</span>
                            </li>
                        </ul>
                    </div>
                </template>    
                
                <!-- 페이징 및 뒤로가기 버튼 -->
                <div class="stu-comm-myboard-pagination">
                    <template v-if="totalPages >= 2">
                        <button @click="fnMyCnt(currentPage - 1)" :disabled="currentPage <= 1">이전</button>
                        <button 
                            v-for="page in totalPages" 
                            :key="page" 
                            :class="{active: page === currentPage}" 
                            @click="fnMyCnt(page)"
                        >
                            {{ page }}
                        </button>
                        <button @click="fnMyCnt(currentPage + 1)" :disabled="currentPage >= totalPages">다음</button>
                    </template>
                    <button class="stu-comm-myboard-btn" @click="fnBack" style="background-color:black;">뒤로가기</button>
                </div>                        
            </div>
        </div>
    </main>
    <jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>
<script>
    var app = Vue.createApp({
        data() {
            return {
                user: '${sessionScope.user}',
                isLogin: false,
                sessionUserId: '',
                sessionUserNickName: '',
                countMyCommCnt: 0,
                countMycommentCnt: 0,
                selectMyCommList: [],
                selectMyCommentList: [],
                itemMode: '${itemMode}',
                totalPages: 0,
                currentPage: 1,      // 현재 페이지 
                pageSize: 10,         // 한 페이지에 보여줄 개수 
                hide: "N",
                author: '${author}',
                userNickName: '${userNickName}',
				selectStuGroupList : []
            };
        },
		// 여기에 computed 추가
       computed: {
           activeStudies() {
               // '활동중인 스터디'만 필터링
               return this.selectStuGroupList.filter(item => item.fetchapplstatus === 'Y');
           },
           pendingStudies() {
               // '신청 대기중인 스터디'만 필터링
               return this.selectStuGroupList.filter(item => item.fetchapplstatus === 'N');
           }
       },
        methods: {
			fnStudyHide(studyGroupId,fetchappuserid){
			   var self = this;
               var nparmap = {studyGroupId : studyGroupId, fetchappuserid : fetchappuserid};
               $.ajax({
                   url: "updateStuGroupHide.dox",
                   dataType: "json",	
                   type: "POST", 
                   data: nparmap,
                   success: function(data) {
                      console.log(data);
					  self.fnMyCnt();
                   }
               });
            },
            fnBack() {
                history.back();
            },
            fnhide() {
                this.hide = this.hide === "N" ? "Y" : "N";
            },
            fnBoardMode() {
                this.itemMode = "board";
                this.fnMyCnt(1);
            },
            fnCommentMode() {
                this.itemMode = "comment";
                this.fnMyCnt(1);
            },		
            fnboardview(boardTypeId, name) {
                this.boardTypeId = boardTypeId;
                this.name = name;
                this.search = '';
                this.fnboardList(1);
            },
            fnSession() {
                var self = this;
                var nparmap = {};
                $.ajax({
                    url: "sharedHeader.dox",
                    dataType: "json",	
                    type: "POST", 
                    data: nparmap,
                    success: function(data) {
                        self.isLogin = data.isLogin;
                        if(data.isLogin){
                            self.sessionUserId = data.userId;
                            self.sessionUserNickName = data.userNickName;
                            console.log('세션아이디:', self.sessionUserId);  // sessionUserId가 제대로 설정되었는지 확인
                            self.fnMyCnt();
                        } else {
                            self.sessionUserId = '';
                            self.sessionUserNickName = '';
                        }
                    }
                });
            },
            fnMyCnt(page = 1) {
                var self = this;
                var sessionUserId = self.author ? self.author : self.sessionUserId;
                var startIndex = (page - 1) * self.pageSize;
                var outputNumber = self.pageSize;
                self.currentPage = page;
                var nparmap = { 
                    userId: sessionUserId, 
                    startIndex: startIndex, 
                    outputNumber: outputNumber 
                };
                $.ajax({
                    url: "myCnt.dox",
                    dataType: "json",	
                    type: "POST", 
                    data: nparmap,
                    success: function(data) {
                        console.log(data);
                        self.countMyCommCnt = data.countMyCommCnt;
                        self.countMycommentCnt = data.countMycommentCnt;
                        self.selectMyCommList = data.selectMyCommList;
                        self.selectMyCommentList = data.selectMyCommentList;
						self.selectStuGroupList = data.selectStuGroupList;
                        if(self.itemMode === "board"){
                            self.totalPages = Math.ceil(self.countMyCommCnt / self.pageSize);
                        } else {
                            self.totalPages = Math.ceil(self.countMycommentCnt / self.pageSize);
                        }
                    }
                });
            },
            fnBoardDetail(boardId) {
                $.pageChange("/study-comm-detail", { boardId: boardId });
            },
			fnStudyHome(studyGroupId) {
                $.pageChange("/study-mygroup-detail", { studyGroupId: studyGroupId });
            },
        },
        mounted() {
            var self = this;
			// (추가) 로그인 상태가 변경되었을 때 세션 정보 다시 로드
			        window.addEventListener('loginStatusChanged', function () {
			            self.fnSession();  // (추가) 로그인 상태가 변경되었을 때 자동으로 세션 정보 업데이트
			        });
            window.addEventListener('loginStatusChanged', function(){
                if(window.sessionStorage.getItem("isLogin") === 'true'){
                    self.isLogin = true;	
                } else{
                    self.isLogin = false;
                }
                self.fnSession();
            });
            self.fnSession();
        }
    });
    app.mount('#app');
</script>
