<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>내 문의</title>
</head>
<style>
	.main-container {
	     display: flex;
	     min-height: 100vh;
	     font-family: 'Arial', sans-serif;
	     background-color: #f4f6f9;
	 }
	 .content {
	      width: 100%;
	      padding: 40px;
	      background-color: #ffffff;
	 }
	 
	 h1{
		text-align: center; 
		color: black; 
		margin-bottom: 20px; 
		font-size: 20px;
	 }
	 
	 .select {
	 	display: flex;
	 	justify-content: flex-end; /* 오른쪽으로 정렬 */
	 	margin-bottom: 20px; /* 아래쪽 여백 추가 */
	 }
	 
	 .select select {
	     padding: 10px; /* 패딩 추가 */
	     font-size: 16px; /* 글자 크기 조정 */
	     border: 1px solid #ced4da; /* 테두리 색상 */
	     border-radius: 4px; /* 둥근 모서리 */
	     background-color: #ffffff; /* 배경색 */
	     cursor: pointer; /* 포인터 커서 */
	 }

	 table {
	 	width: 100%;
	 	border-collapse: collapse;
	 	font-size: 16px;
	 	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	 	border-radius: 8px;
	 	overflow: hidden;
	 	margin-bottom: 30px;
	 }
	 
	 th, td {
		padding: 7px;
	 	text-align: center;
	 }
	 
	 th {
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
	 
	 td, a {
	 	color: black;
	 	text-decoration: none;
	 	transition: color 0.3s;
	 }
	 
	 td a:hover {
	 	color: #0056b3; /* 진한 파란색 */
	 	text-decoration: underline;
	 }
	 
	 td:last-child {
	 	text-align: center;
	 }
	 
	 .btn{
		padding: 10px 20px; /* 패딩을 동일하게 설정 */
		border: none;
		background-color: #ff7f50; /* 버튼 배경색 */
		color: white; /* 글자색 */
		border-radius: 5px; /* 둥근 모서리 */
		cursor: pointer; /* 포인터 커서 */
		font-size: 16px; /* 글자 크기 통일 */
		min-width: 100px; /* 최소 너비 설정 */
		transition: background-color 0.3s; /* 배경 색상 변화 효과 */
	 }
	 
	 .btn :hover {
	     background-color: #e74c3c; 
	 }

	.pagination {
		margin-top: 20px;
		text-align: center;
	}

	.pagination button {
		margin: 0 5px;
		padding: 10px 15px; /* 버튼 여백 증가 */
		border: 1px solid #007BFF; /* 테두리 색상 */
		background-color: white; /* 버튼 배경 색상 */
		color: #007BFF; /* 버튼 글자 색상 */
		border-radius: 4px; /* 둥근 모서리 */
		cursor: pointer; /* 커서 포인터 */
		transition: background-color 0.3s; /* 배경 색상 변화 효과 */
	}

	.pagination button:hover {
		background-color: #007BFF; /* 호버 시 배경 색상 변경 */
		color: white; /* 호버 시 글자 색상 변경 */
	}

	.pagination button.active {
		background-color: #007BFF; /* 활성화된 버튼 색상 */
		color: white; /* 글자 색상 */
	}
</style>

<body>
	<main class="main-container">
	<div id="app" class="content">
		<h1>문의 내역</h1>
		
		<div class="select">
			<select v-model="selectSize" @change="fnGetList(1)">
				<option value="5">5개</option>
				<option value="10">10개</option>
				<option value="15">15개</option>
			</select>
		</div>
		
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>처리</th>
				<th>수정/변경</th>
				<th>답변</th>
			</tr>
			<tr v-for="item in list" :key="item.inquiryId">
				<td>{{item.inquiryId}}</td>
				<td>{{item.title}}</td>
				<td>{{item.message}}</td>
				<td>{{item.userNickName}}</td>
				<td>{{item.createdDateFormatted}}</td>
				<td>
					<div v-if="mode=='1' || checkId != item.inquiryId">
						{{item.answer}}
					</div>
					<div v-if="mode=='2' && checkId == item.inquiryId">
						<select v-model="item.answer">
							<option value="대기">대기</option>
							<option value="처리 중">처리 중</option>
							<option value="완료">완료</option>
						</select>
					</div>			
				</td>
				<td>
					<div v-if="mode == '1' || checkId != item.inquiryId">
						<button class="btn" @click="Change(item)">수정</button>
					</div>
					<div v-if="mode=='2' && checkId == item.inquiryId">
						<button class="btn" @click="fnUpdate(item)">변경</button>
					</div>
				</td>
				<td>
					<button class="btn" @click="fnAnswerInq(item.inquiryId)">답변</button>
				</td>
			</tr>	
		</table>
		
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
	</main>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				isLogin: false,
				list: [],
				checkId: null ,
				mode: '1',
				sessionUserId: '',	
				
				currentPage: 1, //현재 페이지    
				totalPages: 1, 
				selectSize: 5,
            };
        },
        methods: {
			Change(item){
				var self=this;
				self.mode='2';
				self.checkId = item.inquiryId;
			},
            fnGetList(page) {
				var self = this;
				
				self.pageSize = self.selectSize;
				self.currentPage = page;
				var startIndex = (page-1) * self.pageSize;
				var outputNumber = self.pageSize;
				
				if (!this.sessionUserId) {
				      console.log("로그인 정보가 없습니다.");
				      return;
				  }
				var nparmap = {
					userId: self.sessionUserId,
					startIndex: startIndex,
					outputNumber: outputNumber,
				};
				
				$.ajax({
					url: "histroy-inq.dox",
					dataType: "json",	
					type: "POST", 
					data: nparmap,
					success: function(data) { 
						console.log(data);
						self.list = data.list;	
						self.totalPages = Math.ceil(data.count/self.pageSize); //올림, 동적 생성 
					}
				});
            },
			fnSession() {
			    $.ajax({
			        url: "sharedHeader.dox",
			        dataType: "json",	
			        type: "POST", 
			        success: (data) => {
			            this.isLogin = data.isLogin;
			            if (data.isLogin) {
			                this.sessionUserId = data.userId;  
			                console.log('세션아이디:', this.sessionUserId);
							this.fnGetList(this.currentPage); // 로그인 후 문의 내역 가져오기
			            } else {
			                this.sessionUserId = '';
			            }
			        }
			    });
			},
			fnUpdate(item){
				var self = this;
				
				var nparmap = {
					answer: item.answer,
					inquiryId: self.checkId	
				};
				$.ajax({
					url:"update-inq.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						//console.log(data);
						alert(data.message);
						self.fnGetList(self.currentPage);
						self.mode = '1';  
				        self.checkId = null;
					}
				});
			},
			fnAnswerInq(inquiryId) {
				$.pageChange("answerinq",{inquiryId: inquiryId});
			}
        },
        mounted() {
            var self = this;
			self.fnSession();	
        }
    });
    app.mount('#app');
</script>