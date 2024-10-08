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
		font-family: 'Noto Sans KR', sans-serif;
	}
	* {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	}
	body {
	    font-family: 'Noto Sans KR', sans-serif; /* 한글과 영문에 적합한 세련된 폰트 */
	    line-height: 1.6;
	    color: #333;
	    background: url('images/background.jpg') no-repeat center center fixed;
	    background-size: cover;
	}
  .post-count {
    display: flex;
        align-items: center;
    }

    .post-count label {
        margin-right: 15px;
        font-size: 1.1em; /* 글자 크기 조정 */
        font-weight: bold;
        color: #555;
    }

    .post-count select {
        padding: 8px 12px;
        border: 1px solid #ced4da;
        border-radius: 4px;
        background-color: #fff;
        cursor: pointer;
        font-size: 0.5em; /* 글자 크기 조정 */
		width:0%
	
    }

    /* 검색 및 정렬 섹션 */
    .stu-comm-list-search-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
        gap: 15px;
    }

    .stu-comm-list-search-container select,
    .stu-comm-list-search-container input[type="text"],
    .stu-comm-list-search-container button {
        padding: 10px 15px;
        border: 1px solid #ced4da;
        border-radius: 4px;
        font-size: 1em; /* 글자 크기 조정 */
    }

    .stu-comm-list-search-container select {
        width: 130px;
    }

    .stu-comm-list-search-container input[type="text"] {
        flex: 1;
        min-width: 200px;
        padding-right: 40px;
        font-size: 1em; /* 글자 크기 조정 */
    }

    .stu-comm-list-search-container button {
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s;
        font-size: 1em; /* 글자 크기 조정 */
    }

    .stu-comm-list-search-container button:hover {
        background-color: #0056b3;
    }

    /* 테이블 스타일 */
    .stu-comm-list-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 16px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
        margin-bottom: 30px;
    }

    .stu-comm-list-table th, .stu-comm-list-table td {
        padding: 15px 20px;
        text-align: center;
    }

    .stu-comm-list-table th {
        background-color: #343a40;
        color: #fff;
        font-weight: bold;
        font-size: 1.1em; /* 글자 크기 조정 */
    }

    .stu-comm-list-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .stu-comm-list-table tr:hover {
        background-color: #e9ecef;
    }

    /* <a> 태그 스타일: 파란색 및 검은색 */
    /* 기본 <a> 태그 스타일: 파란색 */
    .stu-comm-list-table td a {
        color: #007bff; /* 파란색 */
        text-decoration: none;
        transition: color 0.3s;
        font-size: 1em; /* 글자 크기 조정 */
    }

    /* <a> 태그 호버 시 색상 변경: 진한 파란색 */
    .stu-comm-list-table td a:hover {
        color: #0056b3; /* 진한 파란색 */
        text-decoration: underline;
    }

    /* 검은색 <a> 태그를 위한 클래스 */
    .stu-comm-list-table td a.black-link {
        color: #000000; /* 검은색 */
    }

    /* 검은색 <a> 태그 호버 시 색상 변경: 어두운 회색 */
    .stu-comm-list-table td a.black-link:hover {
        color: #333333; /* 어두운 회색 */
        text-decoration: underline;
    }

    .stu-comm-list-table td:last-child {
        text-align: center;
    }

    /* Pagination 스타일 */
    .stu-comm-list-pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 30px 0;
        gap: 10px;
		color: #000000;
    }

    .stu-comm-list-pagination button {
        background-color: #ffffff;
        border: 1px solid #dee2e6;
    	 color: #000000;
        padding: 10px 15px;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
        border-radius: 4px;
        font-size: 1em; /* 글자 크기 조정 */
    }

    .stu-comm-list-pagination button:hover {
        background-color: #E0E0E0;
        color: #ffffff;
    }

    .stu-comm-list-pagination button.active {
        background-color: #000000;
        color: #ffffff;
        cursor: default;
    }

    .stu-comm-list-pagination button:disabled {
        background-color: #e9ecef;
        color: #6c757d;
        cursor: not-allowed;
        border: 1px solid #dee2e6;
    }

    /* 반응형 디자인 */
  
</style>
<body>
	<main class="main-container">
		<!-- 사이드 바 -->		
		<aside class="sidebar">
			<jsp:include page="/layout/study_comm_sidebar.jsp"></jsp:include>  
	    </aside>

		<!-- 메인 컨텐츠 -->
		<div id="app" class="content">
			<!-- 검색 및 정렬 섹션 -->
			<div class="stu-comm-list-search-container">
				<div class="post-count">
					<label for="pageSize" style="font-size:20px;">게시물 수:</label>
					<select id="pageSize" v-model="pageSize" @change="fnboardList(1)">
						<option value='10'>10개씩</option>
						<option value='15'>15개씩</option>
						<option value='20'>20개씩</option>
					</select>
				</div>
				<select v-model="selectedPeriod" @change="fnboardList(1)">
					<option value="all">전체기간</option>
					<option value="1day">1일</option>
					<option value="1week">1주</option>
					<option value="1month">1개월</option>
					<option value="6months">6개월</option>
					<option value="1year">1년</option>
				</select>
				<select v-model="boardSearch" @change="fnboardList(1)">
					<option value="all">제목+내용</option>
					<option value="title">제목만</option>
					<option value="author">작성자</option>
				</select>
				<input type="text" v-model="search" placeholder="검색어를 입력하세요" @keyup.enter="fnboardList(1)">
				<button @click="fnboardList()" style="background:#343A40">검색</button>
				<button @click="fnInsertComm()" style="background:#343A40">글쓰기</button>
			</div>

			<!-- 게시물 목록 테이블 -->
			<table class="stu-comm-list-table">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>좋아요</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="item in commlist" :key="item.boardId">
						<template v-if="item.boardstatus === 'N'">
							<!-- 카테고리 -->
							<td>
								<a href="#" @click.prevent="fnView(item.boardId)" 
								   :style="{ color: item.boardTypeId === 1002 ? 'red' : 'black' }">
								   {{item.name}}
								</a>
							</td>

							<!-- 제목 -->
							<td>
								<a href="#" @click.prevent="fnView(item.boardId)" 
								   :style="{ color: item.boardTypeId === 1002 ? 'red' : 'black' }">
								   {{item.title}}
								</a>
								<template v-if="item.cnt">
									<strong style="color:red;">[{{item.cnt}}]</strong>
								</template>
							</td>

							<!-- 작성자 -->
							<td>
								<a href="#" @click.prevent="fnUserboard(item.author, item.userNickName)" 
								   :style="{ color: item.boardTypeId === 1002 ? 'red' : 'black' }">
								   {{item.userNickName}}
								</a>
							</td>

							<!-- 작성일 -->
							<td>
								{{item.createdDateFormatted}}
							</td>

							<!-- 좋아요 -->
							<td>
								{{item.commLikeCnt}}
							</td>

							<!-- 조회수 -->
							<td>
								{{item.views}}
							</td>
						</template>
						<template v-if="item.boardstatus === 'Y' && isAdmin">
							<td colspan="6">
								<a href="#" @click.prevent="fnView(item.boardId)" style="color:black;">관리자에 의해 숨김 처리된 게시글입니다.</a>
							</td>
						</template>
						<template v-if="item.boardstatus === 'Y' && !isAdmin">
							<td colspan="6">
								<span style="color:black;">관리자에 의해 숨김 처리된 게시글입니다.</span>
							</td>
						</template>
					</tr>
				</tbody>
			</table>

			<!-- 페이징 -->
			<div class="stu-comm-list-pagination">
			    <button @click="fnboardList(currentPage - 1)" :disabled="currentPage <= 1">이전</button>
			    <button v-for="page in totalPages" :key="page" :class="{active: page == currentPage}" @click="fnboardList(page)" >
			        {{ page }}
			    </button>
			    <button @click="fnboardList(currentPage + 1)" :disabled="currentPage >= totalPages" >다음</button>
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
				pageSize: 20,        // 한 페이지에 보여줄 개수
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
			fnInsertComm(){
				var self = this;
				if(!self.isLogin){
					alert("로그인 먼저 하세요.");
					document.getElementById('headerLoginModal').showModal();
					document.getElementById('inputId').focus();
					
				}else{
				location.href="commInsert"					
				}
			},
        },
        mounted() {
            var self = this;
			self.fnboardList(1);
			self.fnboardtypeList();
			self.fnSession();
	// (추가) 로그인 상태가 변경되었을 때 세션 정보 다시 로드
	        window.addEventListener('loginStatusChanged', function () {
	            self.fnSession();  // (추가) 로그인 상태가 변경되었을 때 자동으로 세션 정보 업데이트
	        });
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
