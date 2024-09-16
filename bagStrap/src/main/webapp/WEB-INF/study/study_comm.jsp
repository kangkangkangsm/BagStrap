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

	tr:nth-child(even) {
	    background-color: #f9f9f9;
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
	</style>
<body>
	<div id="app">
		<main class="main-container">
		<!--사이드 바 -->		
	        <aside class="sidebar">
				<div class="stu-comm-profile">
	                <img src="../src/profile.png" alt="프로필 사진" class="stu-comm-profile-img">
	                <div class="stu-comm-profile-info">
	                    <p><strong>하유성 님</strong></p>
	                </div>
	            </div>
	            <!-- 내가 쓴 게시글, 댓글 -->
	            <div class="stu-comm-user-activity">
	                <div class="stu-comm-activity-item">
	                    <span class="stu-comm-activity-icon">💬</span>
	                    <a href="#">내가 쓴 게시글</a>
	                    <span class="stu-comm-activity-count">0개</span>
	                </div>
	                <div class="stu-comm-activity-item">
	                    <span class="stu-comm-activity-icon">💬</span>
	                    <a href="#">내가 쓴 댓글</a>
	                    <span class="stu-comm-activity-count">2개</span>
	                </div>
	            </div>
	            <nav class="stu-comm-menu">
	                <button>커뮤니티 글쓰기</button>
	                <ul v-for="item in boardTypelist">
						<template v-if="item.boardTypeId >= 1000 && item.boardTypeId <= 1999 ">
	                    <li><a href="#" @click="fnboardview(item.boardTypeId)">{{item.name}}</a></li>
						</template>
					</ul>
					<hr>
					<ul v-for="item in boardTypelist">
						<template v-if="item.boardTypeId >= 2000 && item.boardTypeId <= 2999 ">
	                    <li><a href="#" @click="fnboardview(item.boardTypeId)">{{item.name}}</a></li>
						</template>
					</ul>
					<hr>	
					<ul v-for="item in boardTypelist">
						<template v-if="item.boardTypeId >= 3000 && item.boardTypeId <= 3999 ">
	                    <li><a href="#" @click="fnboardview(item.boardTypeId)">{{item.name}}</a></li>
						</template>
	                </ul>
	            </nav>
				<hr>
				<div class="stu-comm-recent-comments">
	              <h3>최근 게시글</h3>
	              <ul v-for = "item in boardList">
	                  <li><a href="#">{{item.title}}</a></li>
	              </ul>
	              <div class="stu-comm-pagination">
	                  <a href="#">이전</a>
	                  <a href="#">다음</a>
		              </div>
		          </div>
	        </aside>
			
			<!--메인 컨텐츠-->
			<div class="content">
				
				<table>
					<tr>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
					<tr v-for="item in commlist">
						<td>{{item.name}}</td>
						<td>{{item.title}}</td>
						<td>{{item.userNickname}}</td>
						<td>{{item.cDatetime}}</td>
						<td>조회</td>	
					</tr>
				</table>
				
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
				boardTypelist : [],
				boardList : [],
				commlist : [],
				boardTypeId :1000
            };
        },
        methods: {
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
		   fnboardList(){
				var self = this;
				var nparmap = { boardTypeId : self.boardTypeId };
				$.ajax({
					url:"selectStuCommListBoard.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						self.commlist = data.commlist; 
						console.log(data);

				}
			});
           },
		   fnboardview(boardTypeId){
				var self = this;
				self.boardTypeId = boardTypeId;
				self.fnboardList();
		   },
		   
        },
        mounted() {
            var self = this;
			self.fnboardList();
			self.fnboardtypeList();
			
        }
    });
    app.mount('#app');
</script>