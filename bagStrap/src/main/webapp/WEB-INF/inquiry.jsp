<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>문의하기</title>
</head>
<style>
	.container {
		  opacity: 1;
		  margin-top: 50px;
		  padding-left: 100px;
		  padding-right: 100px;
	}
	input, select, textarea {
		width: 100%;
		padding: 10px;
		margin: 10px 0;
		border: 1px solid #ccc;
		border-radius: 4px;
	}
	button {
		background-color: #5cb85c;
		color: white;
		padding: 10px 15px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}
	button:hover {
		background-color: #4cae4c;
	}
</style>
<body>
	<div id="app">
	<h1>문의하기</h1>
		<form class="container">
			<label>질문 유형:</label>
			<select v-model="category">
				<option value="all">선택하세요</option>
				<option value="general">일반 문의</option>
				<option value="order">주문 관련 </option>
				<option value="refund">환불 및 교환 </option>
			</select>
			
			<label>제목:</label>
			<input type="text" id="title" v-model="title" required>
			
			<label>메시지:</label>
			<textarea id="message" v-model="message" rows="4" required></textarea>

			<button type="submit" @click="fnSave()">제출하기</button>	
		</form>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				isLogin : false,
				category : "all",
				title:"",
				message:"",
				sessionUserId : '',
            };
        },
        methods: {
			fnSave() {
					var self=this;
					if (self.category === "all") {
					       alert("질문 유형을 선택하세요.");
					       return;
					   }
					if (!self.title || !self.message) {
					       alert("제목과 메시지를 입력해주세요.");
					       return;
					   }
				    var nparam = {
						inqcategory: self.category,
				        inqTitle: self.title, 
				        message: self.message,
				        userId: self.sessionUserId
				    };
				   
				    $.ajax({
				        url: "inquiry-add.dox",
				        dataType: "json",	
				        type: "POST", 
				        data: nparam,
				        success: (data) => { 
				            alert(data.message);
				            if (data.result === "success") {
				                location.href = "cscenter"; 
				            }
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
				               
				                console.log('세션아이디:', this.sessionUserId);  // sessionUserId가 제대로 설정되었는지 확인
				            } else {
				                this.sessionUserId = '';
				                
				            }
				        }
				    });
				}
		},
        mounted() {
			var self=this;
			self.fnSession();
        }
    });
    app.mount('#app');
</script>