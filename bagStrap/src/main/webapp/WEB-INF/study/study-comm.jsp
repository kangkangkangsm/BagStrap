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
	.stu-comm-profile {
	    display: flex;
	    align-items: center;
	    margin-bottom: 30px;
    }

    .stu-comm-profile-img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 10px;
    }

    .stu-comm-profile-info {
        flex-grow: 1;
    }

    .stu-comm-profile-info p {
        margin: 0;
        padding: 0;
    }
	
	.stu-comm-activity-item {
        display: flex;
        align-items: center;
        margin-bottom: 5px;
    }

    .stu-comm-activity-icon {
        margin-right: 5px;
    }

    .stu-comm-activity-item a {
        text-decoration: none;
        color: #333;
        font-weight: bold;
        margin-right: 10px;
		width:200px;
    }

    .stu-comm-activity-count {
        color: #666;
    }
	.stu-comm-user-activity {
        margin-top: 10px;
	}
	.stu-comm-menu {
	    margin-top: 20px;
		padding: 0;
		  display: block;  /* display 속성을 추가 */
	}

	.stu-comm-menu button {
	    width: 93%;
	    padding: 10px;
	    margin-bottom: 10px;
	    background-color: #333;
	    color: #fff;
	    border: none;
	    cursor: pointer;
	}

	.stu-comm-menu ul {
	    list-style: none;
	    padding: 0;
	}

	.stu-comm-menu li {
	    display: flex;
	    justify-content: space-between;
	    margin: 10px 0;
	}

	.stu-comm-menu a {
	    text-decoration: none;
	    color: #007bff;
		width:190px;
	}
	
	.stu-comm-recent-comments {
        margin-top: 30px;
    }

    .stu-comm-recent-comments h3 {
        margin-bottom: 10px;
        font-size: 14px;
        font-weight: bold;
    }

    .stu-comm-recent-comments ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .stu-comm-recent-comments li {
        margin-bottom: 5px;
    }

    .stu-comm-pagination {
        margin-top: 10px;
    }

    .stu-comm-pagination a {
        text-decoration: none;
        color: #007bff;
        margin: 0 5px;
    }

    .stu-comm-pagination span {
        color: #666;
        margin: 0 5px;
    }

	<!-- 추가 -->
	
	table {
	    width: 100%;
	    border-collapse: collapse;
	    margin-top: 20px;
	    font-size: 14px;
	}

	th, td {
	    padding: 10px;
	    text-align: left;
	    border-bottom: 1px solid #ddd;
	}

	th {
	    background-color: #f2f2f2;
	    font-weight: bold;
	}

	tr:hover {
	    background-color: #f5f5f5;
	}

	

	td a {
	    text-decoration: none;
	    color: #007bff;
	}

	td a:hover {
	    text-decoration: underline;
	}

	td:last-child {
	    text-align: center;
	}

	/* 검색 및 정렬 섹션 스타일 */
	.search-container {
	    display: flex;
	    justify-content: space-between;
	    margin-bottom: 10px;
	}

	.search-container input[type="text"] {
	    width: 200px;
	    padding: 5px;
	}

	.search-container select, .search-container button {
	    padding: 5px 10px;
	    margin-left: 5px;
	}

	.pagination {
	    display: flex;
	    justify-content: center;
	    margin-top: 20px;
	}

	.pagination a {
	    margin: 0 5px;
	    padding: 5px 10px;
	    border: 1px solid #ddd;
	    color: #007bff;
	    text-decoration: none;
	}

	.pagination a:hover {
	    background-color: #f0f0f0;
	}
	
	/* 페이징 */
	.pagination {
	    justify-content: center;
	    align-items: center;
	    margin: 20px 0;
	}
	.pagination button {
	    background-color: #f8f9fa;
	    border: 1px solid #dee2e6;
	    color: #007bff;
	    padding: 8px 12px;
	    margin: 0 2px;
	    cursor: pointer;
	    transition: background-color 0.3s, color 0.3s;
	    border-radius: 4px;
	}

	.pagination button:hover {
	    background-color: #007bff;
	    color: white;
	}

	.pagination button.active {
	    background-color: #007bff;
	    color: white;
	    cursor: default;
	}

	.pagination button:disabled {
	    background-color: #e9ecef;
	    color: #6c757d;
	    cursor: not-allowed;
	    border: 1px solid #dee2e6;
	}

	.pagination button:not(.active):not(:disabled):hover {
	    background-color: #0056b3;
	    color: white;
	}
	</style>
<body>
	<div id="app">
		<main class="main-container">
		<!--사이드 바 -->		
	        <aside class="sidebar">
				<div class="stu-comm-profile">
	                <img src="../src/profile.png" alt="프로필 사진" class="stu-comm-profile-img" @click="fnMyboard">
	                <div class="stu-comm-profile-info">
	                    <p @click="fnMyboard"><strong>{{sessionUserNickName}} 님</strong></p>
	                </div>
	            </div>
	            <!-- 내가 쓴 게시글, 댓글 -->
	            <div class="stu-comm-user-activity">
	                <div class="stu-comm-activity-item">
	                    <span class="stu-comm-activity-icon">💬</span>
	                    <a href="#" @click="fnMyboard">내가 쓴 게시글</a>
	                    <a class="stu-comm-activity-count" href="#" @click="fnMyboard">{{countMyCommCnt}}개</a>
	                </div>
	                <div class="stu-comm-activity-item">
	                    <span class="stu-comm-activity-icon">💬</span>
	                    <a href="#" @click="fnMycomment" >내가 쓴 댓글</a>
	                    <a class="stu-comm-activity-count" href="#" @click="fnMycomment">{{countMycommentCnt}}개</a>
	                </div>
	            </div>
	            <nav class="stu-comm-menu">
	                <button @click="fnInsertComm">커뮤니티 글쓰기</button>
	                <ul v-for="item in boardTypelist">
						<template v-if="item.boardTypeId >= 1000 && item.boardTypeId <= 1999 ">
	                    <li><a href="#" @click="fnboardview(item.boardTypeId, item.name)">{{item.name}}</a></li>
						</template>
					</ul>
					<hr>
					<ul v-for="item in boardTypelist">
						<template v-if="item.boardTypeId >= 2000 && item.boardTypeId <= 2999 ">
	                    <li><a href="#" @click="fnboardview(item.boardTypeId,item.name)">{{item.name}}</a></li>
						</template>
					</ul>
					<hr>	
					<ul v-for="item in boardTypelist">
						<template v-if="item.boardTypeId >= 3000 && item.boardTypeId <= 3999 ">
	                    <li><a href="#" @click="fnboardview(item.boardTypeId,item.name)">{{item.name}}</a></li>
						</template>
	                </ul>
	            </nav>
				<hr>
				<div class="stu-comm-recent-comments">
	             
		          </div>
	        </aside>
			
			<!--메인 컨텐츠-->
			<div class="content">
				<div style="font-size:30px;" v-if="name2">{{name2}}</div>
				<div style="font-size:30px;" v-else>{{name}}</div>
				 <div>게시물 수 :<select v-model="pageSize" @change="fnboardList(1)"></div>
				<option value='10'>10개씩 </option>
				<option value='15'>15개씩 </option>
				<option value='20'>20개씩 </option>
				</select>	
				<table>
					<tr>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>좋아요</th>
						<th>조회수</th>
					</tr>
					<tr v-for="item in commlist">
						<template v-if="item.boardstatus === 'N'">
						<td><a href="#" @click="fnView(item.boardId)">{{item.name}}</a></td>
						<td><a href="#" style="color:black;" @click="fnView(item.boardId)">{{item.title}}</a> 
							<template v-if="item.cnt">
							<strong style="color:red;">[{{item.cnt}}]</strong>
							</template>
						</td>
						<td><a href="#" @click="fnView(item.boardId)">{{item.userNickName}}</a></td>
						<td><a href="#" @click="fnView(item.boardId)">{{item.createdDateFormatted}}</a></td>
						<td><a href="#" @click="fnView(item.boardId)">{{item.commLikeCnt}}</a></td>
						<td><a href="#" @click="fnView(item.boardId)">{{item.views}}</a></td>	
						</template>
						<template v-if="item.boardstatus === 'Y' && isAdmin">
						<td colspan="5"><a href="#" @click="fnView(item.boardId)" style="color:black;">관리자에 의해 숨김 처리된 게시글 입니다.</a></td>
						</template>
						<template v-if="item.boardstatus === 'Y' && !isAdmin">
						<td colspan="5"><a style="color:black;">관리자에 의해 숨김 처리된 게시글 입니다.</a></td>
						</template>
					</tr>
				</table>
				<div class="pagination">
				    <button @click="fnboardList(currentPage - 1)" :disabled="currentPage <= 1">이전</button>
				    <button v-for="page in totalPages" :class="{active: page == currentPage}" @click="fnboardList(page)">
				        {{ page }}
				    </button>
				    <button @click="fnboardList(currentPage + 1)" :disabled="currentPage >= totalPages">다음</button>
				</div>
	        </div>
			<select v-model="selectedPeriod">
			    <option value="all" @change="fnboardList(1)">전체기간</option>
			    <option value="1day">1일</option>
			    <option value="1week">1주</option>
			    <option value="1month">1개월</option>
			    <option value="6months">6개월</option>
			    <option value="1year">1년</option>
			</select>
			<select v-model="boardSearch">
				<option value='all' @change="fnboardList(1)">제목+내용</option>
				<option value='title'>제목만 </option>
				<option value='author'>글작성자 </option>
			</select>	
			<input type="text" v-model="search" @keyup.enter="fnboardList(1)">
			<button @click="fnboardList()">검색</button>
			{{boardTypeId2}}
	    </main>

	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				boardTypelist : [],
				boardList : [],
				commlist : [], //
				boardTypeId :1000,
				currentPage: 1,      // 현재 페이지 
				pageSize: 10,        // 한페이지에 보여줄 개수 
				totalPages:5,
				cnt :'',
				name:"전체글보기",
				search : "",
				boardSearch : "all",
				selectedPeriod : "all",
				user: '${sessionScope.user}',
				isLogin : false,
				sessionUserId : '',
				userId : '',
				password : '',
				boardTypeId2 : '${boardTypeId2}',
				countMyCommCnt : '',
				countMycommentCnt : '',
				name2 : '${name2}'
				
			
            };
        },
        methods: {
			fnInsertComm(){
				location.href="commInsert"
			},
			fnboardtypeList(){
				var self = this;
				var nparmap = {  
				};
				$.ajax({
					url:"selectStuCommType.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						self.boardTypelist = data.boardTypelist; 
						self.boardList = data.boardList;
						console.log(data);

				}
			});
           },		
		   fnboardList(page = 1){
				var boardTypeId = '';
				var self = this;
				var startIndex = (page-1) * self.pageSize;
				var outputNumber = self.pageSize;
				self.currentPage = page;
				var boardTypeId = self.boardTypeId2 || self.boardTypeId;
				var search = self.search;
				var boardSearch = self.boardSearch;
				var period = self.selectedPeriod;
				var nparmap = { boardTypeId : boardTypeId,startIndex : startIndex, 
								outputNumber : outputNumber, search : search, boardSearch : boardSearch,
								period : period };
				$.ajax({
					url:"selectStuCommListBoard.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.commlist = data.commlist; 
						self.cnt = data.cnt;
						self.totalPages = Math.ceil(self.cnt/self.pageSize);
						self.boardTypeId2 = '';

				}
			});
           },
		   fnboardview(boardTypeId,name){
				var self = this;
				self.name2 = "";
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
							console.log(data);
						self.isLogin = data.isLogin 
						if(data.isLogin){
							self.sessionUserId = data.userId;
							self.sessionUserNickName = data.userNickName;
							self.isAdmin = data.isAdmin;
							console.log('세션아이디:', self.sessionUserId);  // sessionUserId가 제대로 설정되었는지 확인
							self.fnMyCnt();
						} else {
							self.sessionUserId = '';
							self.sessionUserNickName = '';
						}
					
					}
				});
			},
			fnMyCnt(){
				var self = this;
				var sessionUserId = self.sessionUserId;
				var nparmap = { userId : sessionUserId
				};
				$.ajax({
					url:"sidebarCnt.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.countMyCommCnt=data.countMyCommCnt;
						self.countMycommentCnt=data.countMycommentCnt;

				}
			});
	       },
		    fnView(boardId){
				 $.pageChange("/study-comm-detail",{boardId : boardId});
				 },
			fnMyboard(){
				 $.pageChange("/study-comm-myboard",{itemMode : "board"});
				 },
			fnMycomment(){
 				 $.pageChange("/study-comm-myboard",{itemMode : "comment"});
 				 },				
					
        },
        mounted() {
            var self = this;
			self.fnboardList(1);
			self.fnboardtypeList();
			self.fnSession();
			
			
        }
    });
    app.mount('#app');
</script>