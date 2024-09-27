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
	table {
		margin: 20px auto;
		width: auto;
	}
	td > a, li > a {
		color: black;
	}
	table, tr, th, td {
		border: 1px solid black;
		padding: 5px 5px;
		border-collapse: collapse;
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
	}
	.pagination button.active {
		background-color: #007BFF;
		color: white;
	}
</style>

<body>
	<div id="app">
		<h1>문의 내역</h1>
		
		<select v-model="selectSize" @change="fnGetList(1)">
			<option value="5">5개</option>
			<option value="10">10개</option>
			<option value="15">15개</option>
		</select>
		
		<table>
			<tr>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>상태</th>
				<th>수정</th>
				<th>답변</th>
			</tr>
			<tr v-for="item in list">
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
						<button @click="Change(item)">수정</button>
					</div>
					<div v-if="mode=='2' && checkId == item.inquiryId">
						<button @click="fnUpdate(item)">변경</button>
					</div>
				</td>
				<td>
					<button @click="AnswerInq">답변하기</button>
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
			AnswerInq() {
			    location.href = "answerinq"; // 공지사항 추가 페이지로 이동
			}
        },
        mounted() {
            var self = this;
			self.fnSession();	
        }
    });
    app.mount('#app');
</script>