<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>공지사항</title>
</head>
<style>
	body {
	    font-family: 'Arial', sans-serif;
	    background-color: #f4f4f4;
	    color: #333;
	    margin: 0;
	    padding: 20px;
	}
	h1 {
	    text-align: center;
	    margin-bottom: 20px;
	    color: #2c3e50;
	}
	select {
	    margin: 20px 0;
	    padding: 10px;
	    border-radius: 5px;
	    border: 1px solid #ccc;
	    font-size: 1em;
	}
	.list-item {
	    background-color: white;
	    padding: 15px;
	    border-radius: 5px;
	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	    margin-bottom: 15px;
	    transition: transform 0.2s;
	}
	.list-item:hover {
	    transform: scale(1.02);
	}
	.list-item a {
	    text-decoration: none;
	    color: #2980b9;
	    font-weight: bold;
	}
	.list-item a:hover {
	    text-decoration: underline;
	}
	.add-button {
	    padding: 10px 15px;
	    background-color: #007BFF;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s;
	}
	.add-button:hover {
	    background-color: #0056b3;
	}
	.pagination {
	    margin-top: 20px;
	    text-align: center;
	}
	.pagination button {
	    margin: 0 5px;
	    padding: 10px;
	    border: 1px solid #007BFF;
	    background-color: white;
	    color: #007BFF;
	    cursor: pointer;
	    border-radius: 5px;
	    transition: background-color 0.3s;
	}
	.pagination button:hover {
	    background-color: #007BFF;
	    color: white;
	}
	.pagination button.active {
	    background-color: #007BFF;
	    color: white;
	}
</style>

<body>
	<div id="app">
		<h1>공지사항</h1>
		
		<select v-model="selectSize" @change="fnGetList(1)">
			<option value="5">5개</option>
			<option value="10">10개</option>
			<option value="15">15개</option>
		</select>
		
		<div v-if="isLogin && isAdmin">
			<button class="add-button"  @click="goAddNotice">추가</button>
		</div>

		<div class="list-item" v-for="item in list" :key="item.noticeId">
			<a href="#" @click="fnDetail(item.noticeId)">
				{{ item.title }} - 작성자: {{ item.author }} | 조회수: {{ item.hit }} | 작성일: {{ item.createdDateFormatted }}
			</a>
		</div>
		
		<div class="pagination">
		    <button v-if="currentPage > 1" @click="fnGetList(currentPage - 1)">이전</button>
		    <button v-for="page in totalPages" 
				:class="{active: page == currentPage}"
				@click=fnGetList(page)>
		        {{ page }}
		    </button>
		    <button v-if="currentPage < totalPages" @click="fnGetList(currentPage + 1)">다음</button>
		</div>
				
	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				keyword : "",
				isLogin: false, // 로그인 상태
				isAdmin: false, // 관리자 상태
				sessionId:'${sessionId}',
				sessionStatus:'${sessionStatus}',
				sessionEmail:'${sessionEmail}',
				
				currentPage: 1, //현재 페이지    
				totalPages: 1, 
				selectSize: 5,
				
            };
        },
        methods: {
            fnGetList(page){
				var self = this;
				self.pageSize = self.selectSize;
				self.currentPage = page;
				var startIndex = (page-1) * self.pageSize;
				var outputNumber = self.pageSize;
				
				var nparmap = {
					author: self.sessionId,
					startIndex: startIndex,
					outputNumber: outputNumber,
				};
				//console.log(nparmap); // 확인용
				$.ajax({
					url:"notice-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;	
						self.totalPages = Math.ceil(data.count/self.pageSize); //올림, 동적 생성 
						
					}
				});
            },
			fnDetail(noticeId){
				$.pageChange("noticedetail",{noticeId: noticeId});
			},
			goAddNotice() {
			    location.href = "noticeadd"; // 공지사항 추가 페이지로 이동
			}

        },
        mounted() {
            var self = this;
			self.fnGetList(self.currentPage);
			window.addEventListener('loginStatusChanged', function() {
				self.isLogin = window.sessionStorage.getItem("isLogin") === 'true';
				self.isAdmin = window.sessionStorage.getItem("isAdmin") === 'true';
				self.fnGetList(self.currentPage); // 로그인 상태 변경 시 목록 갱신
			});
			
        }
    });
    app.mount('#app');
</script>	