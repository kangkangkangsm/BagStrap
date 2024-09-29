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
	/* Pagination 스타일 */
    .stu-comm-list-pagination {
        margin-top: 10px;
        display: flex;
        justify-content: center;
    }

    .stu-comm-list-pagination a {
        text-decoration: none;
        color: #007bff;
        margin: 0 5px;
    }

    .stu-comm-list-pagination span {
        color: #666;
        margin: 0 5px;
    }

	/* 테이블 스타일 */
    .stu-comm-list-table {
	    width: 100%;
	    border-collapse: collapse;
	    margin-top: 20px;
	    font-size: 14px;
	}

    .stu-comm-list-table th, .stu-comm-list-table td {
	    padding: 10px;
	    text-align: left;
	    border-bottom: 1px solid #ddd;
	}

    .stu-comm-list-table th {
	    background-color: #f2f2f2;
	    font-weight: bold;
	}

    .stu-comm-list-table tr:hover {
	    background-color: #f5f5f5;
	}

    .stu-comm-list-table td a {
	    text-decoration: none;
	    color: #007bff;
	}

    .stu-comm-list-table td a:hover {
	    text-decoration: underline;
	}

    .stu-comm-list-table td:last-child {
	    text-align: center;
	}

	/* 검색 및 정렬 섹션 스타일 */
    .stu-comm-list-search-container {
	    display: flex;
	    justify-content: space-between;
	    margin-bottom: 10px;
	}

    .stu-comm-list-search-container input[type="text"] {
	    width: 200px;
	    padding: 5px;
	}

    .stu-comm-list-search-container select, 
    .stu-comm-list-search-container button {
	    padding: 5px 10px;
	    margin-left: 5px;
	}

	/* 페이징 스타일 */
	.stu-comm-list-pagination {
	    justify-content: center;
	    align-items: center;
	    margin: 20px 0;
	}

    .stu-comm-list-pagination button {
	    background-color: #f8f9fa;
	    border: 1px solid #dee2e6;
	    color: #007bff;
	    padding: 8px 12px;
	    margin: 0 2px;
	    cursor: pointer;
	    transition: background-color 0.3s, color 0.3s;
	    border-radius: 4px;
	}

    .stu-comm-list-pagination button:hover {
	    background-color: #007bff;
	    color: white;
	}

    .stu-comm-list-pagination button.active {
	    background-color: #007bff;
	    color: white;
	    cursor: default;
	}

    .stu-comm-list-pagination button:disabled {
	    background-color: #e9ecef;
	    color: #6c757d;
	    cursor: not-allowed;
	    border: 1px solid #dee2e6;
	}

    .stu-comm-list-pagination button:not(.active):not(:disabled):hover {
	    background-color: #0056b3;
	    color: white;
	}
</style>
<body>
	<main class="main-container">
		<!-- 사이드 바 -->		
		<aside class="sidebar">
			<jsp:include page="/layout/study_comm_sidebar.jsp"></jsp:include>  
        </aside>

		<!-- 메인 컨텐츠 -->
		<div id="app" class="content">
			<!-- 페이지 헤더 -->
			<div style="font-size:30px;" v-if="name2">{{name2}}</div>
			<div style="font-size:30px;" v-else>{{name}}</div>

			<!-- 게시물 수 선택 -->
			<div>게시물 수:
				<select v-model="pageSize" @change="fnboardList(1)">
					<option value='10'>10개씩</option>
					<option value='15'>15개씩</option>
					<option value='20'>20개씩</option>
				</select>
			</div>

			<!-- 게시물 목록 테이블 -->
			<table class="stu-comm-list-table">
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
						<!-- 카테고리 -->
						<td>
							<a href="#" @click="fnView(item.boardId)" 
							   :style="{ color: item.boardTypeId === 1002 ? 'red' : 'black' }">
							   {{item.name}}
							</a>
						</td>

						<!-- 제목 -->
						<td>
							<a href="#" @click="fnView(item.boardId)" 
							   :style="{ color: item.boardTypeId === 1002 ? 'red' : 'black' }">
							   {{item.title}}
							</a>
							<template v-if="item.cnt">
								<strong style="color:red;">[{{item.cnt}}]</strong>
							</template>
						</td>

						<!-- 작성자 -->
						<td>
							<a href="#" @click="fnUserboard(item.author, item.userNickName)" 
							   :style="{ color: item.boardTypeId === 1002 ? 'red' : 'black' }">
							   {{item.userNickName}}
							</a>
						</td>

						<!-- 작성일 -->
						<td>
							<a href="#" @click="fnView(item.boardId)" 
							   :style="{ color: item.boardTypeId === 1002 ? 'red' : 'black' }">
							   {{item.createdDateFormatted}}
							</a>
						</td>

						<!-- 좋아요 -->
						<td>
							<a href="#" @click="fnView(item.boardId)" 
							   :style="{ color: item.boardTypeId === 1002 ? 'red' : 'black' }">
							   {{item.commLikeCnt}}
							</a>
						</td>

						<!-- 조회수 -->
						<td>
							<a href="#" @click="fnView(item.boardId)" 
							   :style="{ color: item.boardTypeId === 1002 ? 'red' : 'black' }">
							   {{item.views}}
							</a>
						</td>
					</template>
					<template v-if="item.boardstatus === 'Y' && isAdmin">
						<td colspan="5"><a href="#" @click="fnView(item.boardId)" style="color:black;">관리자에 의해 숨김 처리된 게시글입니다.</a></td>
					</template>
					<template v-if="item.boardstatus === 'Y' && !isAdmin">
						<td colspan="5"><a style="color:black;">관리자에 의해 숨김 처리된 게시글입니다.</a></td>
					</template>
				</tr>
			</table>

			
			<div class="stu-comm-list-pagination">
			    <button @click="fnboardList(currentPage - 1)" :disabled="currentPage <= 1">이전</button>
			    <button v-for="page in totalPages" :class="{active: page == currentPage}" @click="fnboardList(page)">
			        {{ page }}
			    </button>
			    <button @click="fnboardList(currentPage + 1)" :disabled="currentPage >= totalPages">다음</button>
			</div>

			<!-- 검색 및 정렬 섹션 -->
			<div class="stu-comm-list-search-container">
				<select v-model="selectedPeriod">
					<option value="all" @change="fnboardList(1)">전체기간</option>
					<option value="1day">1일</option>
					<option value="1week">1주</option>
					<option value="1month">1개월</option>
					<option value="6months">6개월</option>
					<option value="1year">1년</option>
				</select>
				<select v-model="boardSearch">
					<option value="all" @change="fnboardList(1)">제목+내용</option>
					<option value="title">제목만</option>
					<option value="author">작성자</option>
				</select>
				<input type="text" v-model="search" @keyup.enter="fnboardList(1)">
				<button @click="fnboardList()">검색</button>
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
				boardTypelist: [],
				boardList: [],
				commlist: [],
				currentPage: 1,      // 현재 페이지
				pageSize: 10,        // 한 페이지에 보여줄 개수
				totalPages: 5,
				cnt: '',
				name: "전체글보기",
				search: "",
				boardSearch: "all",
				selectedPeriod: "all",
				user: '${sessionScope.user}',
				isLogin: false,
				sessionUserId: '',
				userId: '',
				password: '',
				boardTypeId: '${boardTypeId}',
				boardTypeId2: '${boardTypeId2}',
				countMyCommCnt: '',
				countMycommentCnt: '',
				name2: '${name2}'
            };
        },
        methods: {
			fnInsertComm() {
				location.href = "commInsert";
			},
			fnboardtypeList() {
				var self = this;
				$.ajax({
					url: "selectStuCommType.dox",
					dataType: "json",	
					type: "POST", 
					data: {},
					success: function(data) {
						self.boardTypelist = data.boardTypelist; 
						self.boardList = data.boardList;
					}
				});
			},		
			fnboardList(page = 1) {
				var self = this;
				var startIndex = (page - 1) * self.pageSize;
				var outputNumber = self.pageSize;
				self.currentPage = page;
				var boardTypeId = self.boardTypeId2 || self.boardTypeId;
				var search = self.search;
				var boardSearch = self.boardSearch;
				var period = self.selectedPeriod;
				var nparmap = { 
					boardTypeId: boardTypeId,
					startIndex: startIndex, 
					outputNumber: outputNumber, 
					search: search, 
					boardSearch: boardSearch,
					period: period 
				};
				$.ajax({
					url: "selectStuCommListBoard.dox",
					dataType: "json",	
					type: "POST", 
					data: nparmap,
					success: function(data) {
						console.log(data);
						self.commlist = data.commlist;
						self.cnt = data.cnt;
						self.totalPages = Math.ceil(self.cnt / self.pageSize);
						self.boardTypeId2 = '';
					}
				});
			},
			fnboardview(boardTypeId, name) {
				var self = this;
				self.name2 = "";
				self.boardTypeId = boardTypeId;
				self.name = name;
				self.search = '';
				self.fnboardList(1);
			},
			fnSession() {
				var self = this;
				$.ajax({
					url: "sharedHeader.dox",
					dataType: "json",	
					type: "POST", 
					data: {},
					success: function(data) {
						self.isLogin = data.isLogin;
						if (data.isLogin) {
							self.sessionUserId = data.userId;
							self.sessionUserNickName = data.userNickName;
							self.isAdmin = data.isAdmin;
							
						} else {
							self.sessionUserId = '';
							self.sessionUserNickName = '';
						}
					}
				});
			},
			fnView(boardId) {
				$.pageChange("/study-comm-detail", { boardId: boardId });
			},
			fnUserboard(author, userNickName) {
				$.pageChange("/study-comm-myboard", { author: author, itemMode: "board", userNickName: userNickName });
			},
        },
        mounted() {
            var self = this;
			self.fnboardList(1);
			self.fnboardtypeList();
			self.fnSession();
			window.addEventListener('loginStatusChanged', function() {
				if (window.sessionStorage.getItem("isLogin") === 'true') {
					self.isLogin = true;
				} else {
					self.isLogin = false;
				}
				self.fnSession();
			});
        }
    });
    app.mount('#app');
</script>
