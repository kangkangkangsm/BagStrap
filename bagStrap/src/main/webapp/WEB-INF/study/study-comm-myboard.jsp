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
        /* 기본 스타일 */
    
		
		.content{
			width:800px;
		}
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
		}

      

        .stu-comm-myboard-container {
            width: 96%;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        .stu-comm-myboard-h3 {
            font-size: 24px;
            color: #333;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

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
        }

        .stu-comm-myboard-forum-text {
            display: flex;
            flex-direction: column;
        }

        .stu-comm-myboard-forum-title {
            font-size: 18px;
            font-weight: bold;
            color: #007BFF;
        }

        .stu-comm-myboard-forum-subtitle {
            font-size: 14px;
            color: gray;
        }

        .stu-comm-myboard-pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .stu-comm-myboard-pagination button {
            padding: 10px 15px;
            border: none;
            margin: 0 5px;
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
        }

        .stu-comm-myboard-pagination button.active {
            background-color: #0056b3;
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

        .stu-comm-myboard-post-section, 
        .stu-comm-myboard-study-section {
            margin-bottom: 40px;
        }

        /* 리스트 스타일 */
        .stu-comm-myboard-ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .stu-comm-myboard-li {
            padding: 10px 0;
         
        }

        .stu-comm-myboard-span {
            display: block;
            color: #999;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <main class="main-container">
        <aside class="sidebar">
            <jsp:include page="/layout/header_sidebar.jsp"></jsp:include>  
        </aside>
            <div id="app">
                <div class="content">
                    <div class="stu-comm-myboard-container">
						<!-- 활동중인 스터디 -->
                        <div class="stu-comm-myboard-post-section">
                            <h3 class="stu-comm-myboard-h3">활동중인 스터디</h3>
                            <!-- selectStuGroupList 중 fetchapplstatus가 'Y'인 데이터만 출력 -->
                            <div class="stu-comm-myboard-forum-container" v-for="item in activeStudies">
                                <template v-if="item.filePath">
                                    <img :src="item.filePath" alt="Forum Icon" class="stu-comm-myboard-forum-icon">
                                </template>
                                <template v-else>
                                    <img src="../src/profile.png" alt="Forum Icon" class="stu-comm-myboard-forum-icon">
                                </template>    
                                <div class="stu-comm-myboard-forum-text">
                                    <span class="stu-comm-myboard-forum-title">{{item.studyName}}</span>
                                    <template v-if="item.studyAdminId === sessionUserId">
                                        <span class="stu-comm-myboard-forum-subtitle">👑 | 👥 {{item.applyY}} / {{item.maxparticipants}} | 신청내역 : {{item.applyN}}</span>
                                    </template>
                                    <template v-else>
                                        <span class="stu-comm-myboard-forum-subtitle">👥 {{item.applyY}} / {{item.maxparticipants}}</span>
                                    </template>
                                </div>
								<a href="#" class="hide-link">비공개</a>
                            </div>
                        </div>
                        
                        <!-- 신청 대기중인 스터디 -->
                        <div class="stu-comm-myboard-post-section">
                            <h3 class="stu-comm-myboard-h3">신청 대기중인 스터디</h3>
                            <!-- selectStuGroupList 중 fetchapplstatus가 'N'인 데이터만 출력 -->
                            <div class="stu-comm-myboard-forum-container" v-for="item in pendingStudies" >
                                <template v-if="item.filePath">
                                    <img :src="item.filePath" alt="Forum Icon" class="stu-comm-myboard-forum-icon">
                                </template>
                                <template v-else>
                                    <img src="../src/profile.png" alt="Forum Icon" class="stu-comm-myboard-forum-icon">
                                </template>    
                                <div class="stu-comm-myboard-forum-text">
                                    <span class="stu-comm-myboard-forum-title">{{item.studyName}}</span>
                                    <span class="stu-comm-myboard-forum-subtitle"> 신청 대기중</span>
                                </div>
                            </div>
                        </div>
						
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
                        <template v-if="itemMode == 'board'">	
                            <div class="stu-comm-myboard-post-section">      
                                <ul class="stu-comm-myboard-ul">
                                    <li class="stu-comm-myboard-li" v-for="item in selectMyCommList" :key="item.boardId">
                                        <a class="stu-comm-myboard-a" href="#" @click="fnBoardDetail(item.boardId)">{{item.title}}</a>
                                        <span class="stu-comm-myboard-span" @click="fnBoardDetail(item.boardId)">{{item.createdDate}}</span>
                                    </li>
                                </ul>
                            </div>
                        </template>
                        <template v-if="itemMode == 'comment'">
                            <div class="stu-comm-myboard-study-section"> 
                                <ul class="stu-comm-myboard-ul">
                                    <li class="stu-comm-myboard-li" v-for="item in selectMyCommentList" :key="item.postId">
                                        <a class="stu-comm-myboard-a" href="#" @click="fnBoardDetail(item.postId)">{{item.content}}</a>
                                        <span class="stu-comm-myboard-span" @click="fnBoardDetail(item.postId)">{{item.createdDate}}</span>
                                    </li>
                                </ul>
                            </div>
                        </template>    
                        <div class="stu-comm-myboard-pagination">
							<template v-if=" totalPages >= 2">
                            <button @click="fnMyCnt(currentPage - 1)" :disabled="currentPage <= 1">이전</button>
                            <button v-for="page in totalPages" :key="page" :class="{active: page == currentPage}" @click="fnMyCnt(page)">
                                {{ page }}
                            </button>
                            <button @click="fnMyCnt(currentPage + 1)" :disabled="currentPage >= totalPages">다음</button>
							</template>
							<button class="stu-comm-myboard-btn" @click="fnBack" style="background-color:black;">뒤로가기</button>
                        </div>                        
                    </div>
                </div>
            </div>
    </main>
    <jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>
<script>
    const app = Vue.createApp({
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
                const self = this;
                const nparmap = {};
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
                const self = this;
                const sessionUserId = self.author ? self.author : self.sessionUserId;
                const startIndex = (page - 1) * self.pageSize;
                const outputNumber = self.pageSize;
                self.currentPage = page;
                const nparmap = { 
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
        },
        mounted() {
            const self = this;
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
