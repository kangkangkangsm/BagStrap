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
		width: 80%;
	}
	td > a, li > a {
		color: black;
	}
	table, tr, th, td {
		border: 1px solid black;
		padding: 5px 5px;
		border-collapse: collapse;
	}
</style>

<body>
	<div id="app">
		<h1>내 문의</h1>
		<button @click="fnCheckRemove">선택삭제</button>
		<table>
			<tr>
				<th></th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>상태</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in list" :key="item.inquiryId">
				<td>
					<input type="checkbox" v-model="selectItem" :value="item.inquiryId">
				</td>
				<td>{{item.title}}</td>
				<td>{{item.message}}</td>
				<td>{{item.createdDateFormatted}}</td>
				<td>{{item.answer}}</td>
				<td>
					<button @click=fnDelete(item.inquiryId)>삭제</button>
				</td>
			</tr>	
		</table>
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
				sessionUserId: '',	
				selectItem: [],
            };
        },
        methods: {
            fnGetList() {
				var self = this;
				if (!this.sessionUserId) {
				      console.log("로그인 정보가 없습니다.");
				      return;
				  }
				var nparmap = {
					userId: self.sessionUserId,
				};
				
				$.ajax({
					url: "inquiry-list.dox",
					dataType: "json",	
					type: "POST", 
					data: nparmap,
					success: function(data) { 
						console.log(data);
						self.list = data.list;	
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
							this.fnGetList(); // 로그인 후 문의 내역 가져오기
			            } else {
			                this.sessionUserId = '';
			            }
			        }
			    });
			},
			fnCheckRemove() {
				var self = this;
				
				if (self.selectItem.length === 0) {
					alert("삭제할 항목을 선택하세요.");
					return;
				}
				
				var fList = JSON.stringify(self.selectItem);
				var nparmap = {selectItem : fList};
				$.ajax({
					url:"delete-inquiry.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("삭제 완료");
						self.fnGetList(1);
					}
				});
        	},
        },
        mounted() {
            var self = this;
			self.fnSession();	
        }
    });
    app.mount('#app');
</script>