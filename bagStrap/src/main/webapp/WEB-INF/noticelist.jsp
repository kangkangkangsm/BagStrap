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
	.main-container {
	     display: flex;
	     min-height: 100vh;
	     font-family: 'Arial', sans-serif;
	     background-color: #f4f6f9;
	 }
	 .content {
	      width:100%;
	      padding: 40px;
	      background-color: #ffffff;
	 }
	.count{
		padding: 8px 12px;
		border: 1px solid #ced4da;
		border-radius: 4px;
		background-color: #fff;
		cursor: pointer;
		font-size: 1em; /* 글자 크기 조정 */
	}
	table {
		width: 100%;
		border-collapse: collapse;
		font-size: 16px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.1);
		border-radius: 8px;
		overflow: hidden;
		margin-bottom: 30px;
	}

	th,td {
		padding: 15px 20px;
		text-align: center;
	}
	
	th{
		background-color: #343a40;
		color: #fff;
		font-weight: bold;
		font-size: 1.1em; /* 글자 크기 조정 */
	}


	tr:nth-child(even) {
	    background-color: #f2f2f2;
	}
	tr:hover {
        background-color: #e9ecef;
	}
	td,a{
		color: black;
		text-decoration: none;
		transition: color 0.3s;
		font-size: 1em; /* 글자 크기 조정 */
	}
	
	td a:hover{
		color: #0056b3; /* 진한 파란색 */
		text-decoration: underline;
	}
	
	td:last-child {
        text-align: center;
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
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 30px 0;
		gap: 10px;
		color: #000000;
	}
	.pagination button {
		background-color: #ffffff;
		border: 1px solid #dee2e6;
		 color: #000000;
		padding: 10px 15px;
		cursor: pointer;
		transition: background-color 0.3s, color 0.3s;
		border-radius: 4px;
		font-size: 1em; /* 글자 크기 조정 */
	}
	.pagination button:hover {
		background-color: #E0E0E0;
		color: #ffffff;
	}
	.pagination button.active {
		background-color: #000000;
		color: #ffffff;
		cursor: default;
	}
	button:disabled {
        background-color: #e9ecef;
        color: #6c757d;
        cursor: not-allowed;
        border: 1px solid #dee2e6;
	}
</style>

<body>
    <main class="main-container">
        <div id="app" class="content">
            <h1>공지사항</h1>
            
			
            <select class="count" v-model="selectSize" @change="fnGetList(1)">
                <option value="5">5개</option>
                <option value="10">10개</option>
                <option value="15">15개</option>
            </select>
            
            <div v-if="isLogin && isAdmin">
                <button class="add-button" @click="goAddNotice">추가</button>
            </div>
    
            <table>
                <tr>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                </tr>
                <tr v-for="item in list" :key="item.noticeId">
                    <td>{{ item.category }}</td>
                    <td>
                        <a href="#" @click="fnDetail(item.noticeId)">{{ item.title }}</a>
                    </td>
                    <td>{{ item.author }}</td>
                    <td>{{ item.hit }}</td>
                    <td>{{ item.createdDateFormatted }}</td>
                </tr>
            </table>
    
            <div class="pagination">
                <button v-if="currentPage > 1" @click="fnGetList(currentPage - 1)">이전</button>
                <button v-for="page in totalPages" 
                    :class="{ active: page == currentPage }"
                    @click="fnGetList(page)">
                    {{ page }}
                </button>
                <button v-if="currentPage < totalPages" @click="fnGetList(currentPage + 1)">다음</button>
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
				var startIndex = (page-1) * self.selectSize;
				var outputNumber = self.selectSize;
				
				var nparmap = {
					author: self.sessionId,
					startIndex: startIndex,
					outputNumber: outputNumber,
				};
				
				$.ajax({
					url:"notice-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;	
						self.totalPages = Math.ceil(data.count/self.selectSize); //올림, 동적 생성 
						
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