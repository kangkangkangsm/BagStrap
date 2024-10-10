<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<style>
		table {
			border-collapse:collapse;
		}
		th, td {
			border:2px solid black;
			padding:6px;
			text-align:center; 
		}
		th {
			background-color:#e0e0e0;
		}
	</style>
</head>
<body>
		<main class="main-container">
			
	        <aside class="sidebar">
				<jsp:include page="/layout/header_sidebar.jsp"></jsp:include>
	        </aside>

	        <div class="content">
				<div id="app">
					<div>
						<select v-model="searchOption">
							<option value="all">::전체::</option>
							<option value="name">이름</option>
							<option value="nickName">닉네임</option>	
						</select>
						<input type="text" v-model="keyword" placeholder="검색어을 입력하세요">
						<button @click="fnGetList">검색</button>
					</div>
					<div>
						<select v-model="changePage" @change=fnGetLsit(1)>
							<option value="5">5개씩</option>
							<option value="10">10개씩</option>
							<option value="15">15개씩</option>
						</select>
					</div>	
					
					<table>
						<tr>
							<th>이름</th>
							<th>닉네임</th>
							<th>아이디</th>
							<th>이메일</th>
							<th>핸드폰 번호</th>
							<th>자격</th>
							<th>차단</th>
							<th>Y/N</th>
						</tr>
						<tr v-for="item in list">
								<td>{{item.userName}}</td>
								<td>{{item.userNickName}}</td>
								<td>{{item.userId}}</td>
								<td>{{item.email}}</td>
								<td>{{item.phone}}</td>
								<td>{{item.status}}</td>
								<td>{{item.ban}}</td>
								<td>
								<button v-if="item.ban === 'N'" @click="fnAdminUpdate(item.userId, 'Y')">차단</buttton>
								<button v-else @click="fnAdminUpdate(item.userId, 'N')">해제
								</td>
						</tr>
					</table>
					<div>
						<button>이전</button>
						<button>1</button>
						<button>2</button>
						<button>3</button>
						<button>다음</button>
					</div>
				</div>
			</div>
	    </main>

	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>
<script>
	//localStorage.setItem('data', JSON.stringify(data));
	// JSON.parse(localStorage.getItem('data')).result
    const app = Vue.createApp({
        data() {
            return {
				list:[],
				userId:'',
				ban:'',
				searchOption:'all',
				keyword:'',
				changePage:'5'
			};
        },
        methods: {
			fnGetList() {
				var self=this;
				var nparam={
					searchOption:self.searchOption,
					keyword:self.keyword
				};
				$.ajax({
					url:"/join.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) {
					
							self.list=data.list;	
					 }
				});
			},
			fnAdminUpdate(userId,ban) {
				var self=this;
				var nparam={
					userId:userId,
					ban:ban
				};
				$.ajax({
					url:"/updateAdmin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) {
					
						self.fnGetList();
					}
				});
			}
   	 },					
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>