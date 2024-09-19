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
	    background-color: #f5f5f5;
	    color: #333;
	}

	.stu-comm-myboard-container {
	    max-width: 600px;
	    margin: 50px auto;
	    background-color: #fff;
	    padding: 20px;
	    border-radius: 8px;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}

	.stu-comm-myboard-header {
	    text-align: center;
	    margin-bottom: 20px;
	}

	.stu-comm-myboard-picture {
	    width: 100px;
	    height: 100px;
	    background-color: #e0e0e0;
	    border-radius: 50%;
	    display: inline-block;
	    margin-bottom: 10px;
	}

	h2 {
	    font-size: 24px;
	    color: #555;
	}

	.stu-comm-myboard-info {
	    text-align: center;
	    margin-bottom: 30px;
	}

	.stu-comm-myboard-info table {
	    width: 100%;
	    border-collapse: collapse;
	}

	.stu-comm-myboard-info th, .stu-comm-myboard-info td {
	    padding: 10px;
	    font-size: 18px;
	}

	.stu-comm-myboard-info th {
	    color: black;
	}
	.stu-comm-myboard-info th,tr a {
		    color: black;
		}
	.stu-comm-myboard-info td {
	    color: #333;
	    font-weight: bold;
	}

	.stu-comm-myboard-post-section, .stu-comm-myboard-study-section {
	    margin-bottom: 30px;
	}

	h3 {
	    font-size: 20px;
	    margin-bottom: 10px;
	}

	ul {
	    list-style-type: none;
	}

	ul li {
	    padding: 10px 0;
	    border-bottom: 1px solid #e0e0e0;
	}

	ul li a {
	    color: #0066cc;
	    text-decoration: none;
	    font-size: 16px;
	}

	ul li a:hover {
	    text-decoration: underline;
	}

	ul li span {
	    display: block;
	    color: #999;
	    font-size: 14px;
	    margin-top: 5px;
	}
	</style>
<body>
	<div id="app">
		<main class="main-container">
		<!--사이드 바 -->		
	        <aside class="sidebar">
	        </aside>
			
			<!--메인 컨텐츠-->
			<div class="content">
				<div class="stu-comm-myboard-container">
				        <div class="stu-comm-myboard-header">
				            <div class="stu-comm-myboard-picture">
								
				            </div>
				            <h2>{{sessionUserNickName}}</h2>
				        </div>

				        <div class="stu-comm-myboard-info">
				            <table>
				                <tr>
				                    <th><a href="#" @click="fnBoardMode">게시글</a></th>
				                    <th><a href="#" @click="fnCommentMode">댓글</a></th>
				                </tr>
				                <tr>
				                    <td><a href="#" @click="fnBoardMode">{{countMyCommCnt}}</a></td>
				                    <td><a href="#" @click="fnCommentMode">{{countMycommentCnt}}</a></td>
				                </tr>
				            </table>
				        </div>
					<template v-if="itemMode == 'board'">
				        <div class="stu-comm-myboard-post-section">
				            <h3>게시글</h3>
				            <ul v-for="item in selectMyCommList">
				                <li>
				                    <a href="#" @click="fnBoardDetail(item.boardId)">{{item.title}}</a>
				                    <span href="#" @click="fnBoardDetail(item.boardId)">{{item.createdDate}}</span>
				                </li>
				            </ul>
				        </div>
					</template>
					<template v-if="itemMode == 'comment'">
				        <div class="stu-comm-myboard-study-section">
				            <h3>댓글</h3>
				               <ul v-for="item in selectMyCommentList">
				                <li>
				                    <a href="#" @click="fnBoardDetail(item.postId)" >{{item.content}}</a>
				                    <span href="#" @click="fnBoardDetail(item.postId)" >{{item.createdDate}}</span>
				                </li>
				            </ul>
				        </div>
					</template>	
					
					<div class="pagination">
						    <button @click="fnMyCnt(currentPage - 1)" :disabled="currentPage <= 1">이전</button>
						    <button v-for="page in totalPages" :class="{active: page == currentPage}" @click="fnMyCnt(page)">
						        {{ page }}
						    </button>
						    <button @click="fnMyCnt(currentPage + 1)" :disabled="currentPage >= totalPages">다음</button>
						</div>
			      
					<div class="stu-comm-myboard-post-section">
				            <h3>내가 활동중인 스터디 목록</h3>
				            <ul v-for="">
				                <li>
									<template v-if="hide == 'Y'">
				                    <a href="#">스터디1(공개중) </a> 
									<button @click="fnhide()">숨기기</button>
									</template>
									<template v-if="hide == 'N'">
									<a href="#">스터디1(숨김중) </a>
									<button @click="fnhide()">공개하기</button>
									</template>
									
				                </li>
				            </ul>
				        </div>
				    </div>
	    </main>

	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				user: '${sessionScope.user}',
				isLogin : false,
				sessionUserId : '',
				sessionUserNickName : '',
				countMyCommCnt : {},
				countMycommentCnt : {},
				selectMyCommList : [],
				selectMyCommentList : [],
				itemMode : '${itemMode}',
				totalPages:5,
				currentPage: 1,      // 현재 페이지 
				pageSize: 5,        // 한페이지에 보여줄 개수 
				hide : "N"
			
            };
        },
        methods: {
			fnhide(){
				var self = this;
				if(self.hide == "N"){
					self.hide = "Y"
				}else{
					self.hide = "N"
				}
			},
		   fnBoardMode(){
   				var self = this;
   				self.itemMode = "board";
				self.fnMyCnt(page = 1);
   		   },
		   fnCommentMode(){
   				var self = this;
				self.itemMode = "comment";
				self.fnMyCnt(page = 1);
   				
	   		   },		
		   fnboardview(boardTypeId,name){
				var self = this;
				self.boardTypeId = boardTypeId;
				self.name = name;
				self.search = '';
				self.fnboardList(1);
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
						self.isLogin = data.isLogin 
						if(data.isLogin){
							self.sessionUserId = data.userId;
							self.sessionUserNickName = data.userNickName;
							console.log('세션아이디:', self.sessionUserId);  // sessionUserId가 제대로 설정되었는지 확인
						self.fnMyCnt()
						} else {
							self.sessionUserId = '';
							self.sessionUserNickName = '';
						}
					
					}
				});
			},
			fnMyCnt(page = 1){
					var self = this;
					var sessionUserId = self.sessionUserId;
					var startIndex = (page-1) * self.pageSize;
					var outputNumber = self.pageSize;
					self.currentPage = page;
					var nparmap = { userId : sessionUserId,startIndex : startIndex,outputNumber : outputNumber,
					};
					$.ajax({
						url:"myCnt.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) {
							console.log(data);
							self.countMyCommCnt=data.countMyCommCnt;
							self.countMycommentCnt=data.countMycommentCnt;
							self.selectMyCommList=data.selectMyCommList;
							self.selectMyCommentList=data.selectMyCommentList;
							if(self.itemMode == "board"){
							self.totalPages = Math.ceil(self.countMyCommCnt/self.pageSize);
							} else {
							self.totalPages = Math.ceil(self.countMycommentCnt/self.pageSize);
							}
					}
				});
		       },
			  fnBoardDetail(boardId){
	   				 $.pageChange("/study-comm-detail.do",{boardId : boardId});
	   				 },
        },
        mounted() {
            var self = this;
			self.fnSession();
			
			
        }
    });
    app.mount('#app');
</script>