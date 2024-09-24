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
        /* .stu-comm-myboard- prefixed classes for internal content */
        .stu-comm-myboard-container {
            width: 100%;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            
            box-sizing: border-box;
        }

        .stu-comm-myboard-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .stu-comm-myboard-h2 {
            font-size: 24px;
            color: #555;
            margin: 0;
        }

        .stu-comm-myboard-info {
            text-align: center;
            margin-bottom: 30px;
        }

        .stu-comm-myboard-table {
            width: 100%;
            border-collapse: collapse;
        }

        .stu-comm-myboard-th, .stu-comm-myboard-td {
            padding: 10px;
            font-size: 18px;
        }

        .stu-comm-myboard-th {
            color: black;
        }

        .stu-comm-myboard-th, .stu-comm-myboard-tr a {
            color: black;
        }

        .stu-comm-myboard-td {
            color: #333;
            font-weight: bold;
        }

        .stu-comm-myboard-h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .stu-comm-myboard-ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .stu-comm-myboard-li {
            padding: 10px 0;
            border-bottom: 1px solid #e0e0e0;
        }

        .stu-comm-myboard-a {
            color: #0066cc;
            text-decoration: none;
            font-size: 16px;
        }

        .stu-comm-myboard-a:hover {
            text-decoration: underline;
        }

        .stu-comm-myboard-span {
            display: block;
            color: #999;
            font-size: 14px;
            margin-top: 5px;
        }

        .stu-comm-myboard-btn {
            margin-left: auto; /* 버튼을 오른쪽으로 정렬 */
            display: block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .stu-comm-myboard-btn:hover {
            background-color: #0056b3;
        }

        .stu-comm-myboard-post-section, 
        .stu-comm-myboard-study-section {
            margin-bottom: 30px;
        }

        .stu-comm-myboard-pagination {
            text-align: center;
            margin-top: 20px;
        }

        .stu-comm-myboard-pagination button {
            margin: 0 2px;
            padding: 5px 10px;
            border: none;
            background-color: #007BFF;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }

        .stu-comm-myboard-pagination button:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }

        .stu-comm-myboard-pagination button.active {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <main class="main-container">
        <!-- 사이드 바 -->		
        <aside class="sidebar">
            <jsp:include page="/layout/study_comm_sidebar.jsp"></jsp:include>  
        </aside>
        <!-- 메인 컨텐츠 -->
        <div class="content">
            <div id="app">
                <div class="content">
                    <div class="stu-comm-myboard-container">
                    <template v-if="userNickName">
                        <h2 class="stu-comm-myboard-h2">유저 페이지</h2>
                    </template>
                    <template v-else>
                        <h2 class="stu-comm-myboard-h2">마이페이지</h2>
                    </template>
                        <button class="stu-comm-myboard-btn" @click="fnBack">뒤로가기</button>
                        <div class="stu-comm-myboard-header">
                            <template v-if="userNickName">
                                <h2 class="stu-comm-myboard-h2">{{userNickName}}</h2>
                            </template>
                            <template v-else>
                                <h2 class="stu-comm-myboard-h2">{{sessionUserNickName}}</h2>
                            </template>
                        </div>

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
                                <h3 class="stu-comm-myboard-h3">게시글</h3>
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
                                <h3 class="stu-comm-myboard-h3">댓글</h3>
                                <ul class="stu-comm-myboard-ul">
                                    <li class="stu-comm-myboard-li" v-for="item in selectMyCommentList" :key="item.postId">
                                        <a class="stu-comm-myboard-a" href="#" @click="fnBoardDetail(item.postId)">{{item.content}}</a>
                                        <span class="stu-comm-myboard-span" @click="fnBoardDetail(item.postId)">{{item.createdDate}}</span>
                                    </li>
                                </ul>
                            </div>
                        </template>	

                        <div class="stu-comm-myboard-pagination">
                            <button @click="fnMyCnt(currentPage - 1)" :disabled="currentPage <= 1">이전</button>
                            <button 
                                v-for="page in totalPages" 
                                :key="page" 
                                :class="{active: page == currentPage}" 
                                @click="fnMyCnt(page)">
                                {{ page }}
                            </button>
                            <button @click="fnMyCnt(currentPage + 1)" :disabled="currentPage >= totalPages">다음</button>
                        </div>
                  
                        <div class="stu-comm-myboard-post-section">
                            <h3 class="stu-comm-myboard-h3">내가 활동중인 스터디 목록</h3>
                            <ul class="stu-comm-myboard-ul">
                                <li class="stu-comm-myboard-li">
                                    구현예정임
                                    <template v-if="hide == 'Y'">
                                        <a class="stu-comm-myboard-a" href="#">스터디1(공개중)</a> 
                                        <button class="stu-comm-myboard-btn" @click="fnhide()">숨기기</button>
                                    </template>
                                    <template v-if="hide == 'N'">
                                        <a class="stu-comm-myboard-a" href="#">스터디1(숨김중)</a>
                                        <button class="stu-comm-myboard-btn" @click="fnhide()">공개하기</button>
                                    </template>
                                </li>
                            </ul>
                        </div>
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
                totalPages: 5,
                currentPage: 1,      // 현재 페이지 
                pageSize: 5,         // 한 페이지에 보여줄 개수 
                hide: "N",
                author: '${author}',
                userNickName: '${userNickName}'
            };
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
