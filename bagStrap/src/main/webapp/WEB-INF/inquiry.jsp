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

	.container {
	    opacity: 1;
	    margin: 50px auto; /* 중앙 정렬 */
	    padding: 30px; /* 내부 패딩 추가 */
	    max-width: 600px; /* 최대 너비 설정 */
	    background-color: #fff; /* 흰색 배경 */
	    border-radius: 8px; /* 둥근 모서리 */
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
	}

	h1 {
		text-align: center; 
		color: black; 
		margin-bottom: 20px; 
		font-size: 20px;
	}

	input, select, textarea {
	    width: 100%;
	    padding: 10px;
	    margin: 10px 0;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    transition: border-color 0.3s; /* 경계선 색상 부드러운 전환 */
	}

	input:focus, select:focus, textarea:focus {
	    border-color: #4a90e2; /* 포커스 시 경계선 색상 변화 */
	}
	.btn-group {
	    display: flex;
	    justify-content: space-between; /* 버튼 간의 간격 조정 */
	}

	.btn-group button {
	    flex: 1; /* 버튼이 동일한 크기로 늘어나도록 설정 */
	    margin: 5px; /* 버튼 간의 간격 */
	}
	button {
		padding: 10px 15px;
		border: none;
		background-color: #ff7f50;
		color: white;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;	
	}

	button:hover {
	    background-color: #e74c3c; /* 호버 시 어두운 색상 */
	}
</style>
<body>
	<main class="main-container">
	    <div id="app" class="content">
			<h1>문의하기</h1>
				<form class="container">
					<label>질문 유형:</label>
					<select v-model="category">
						<option value="all">선택하세요</option>
						<option value="general">일반 문의</option>
						<option value="order">주문 관련 </option>	
						<option value="refund">환불 및 교환 </option>
					</select>
					
			<!--		<div v-if="category == 'order'">
						<label>제품 이름:</label>
						<input type="text" v-model="productName" placeholder="제품 이름" required>
					</div>-->
					
					<label>제목:</label>
					<input type="text" id="title" v-model="title" required>
					
					<label>메시지:</label>
					<textarea id="message" v-model="message" rows="4" required></textarea>
		
				<div class="btn-group">
					<button type="button" @click="goBack()">취소</button>
					<button type="button" @click="fnSave()">문의하기</button>
				</div>
						
				</form>
		
		</div>
	</main>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
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
				        success: function(data) { 
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
				               
				               
				            } else {
				                this.sessionUserId = '';
				                
				            }
				        }
				    });
				},
				goBack(){
					location.href="cscenter";
				}
		},
        mounted() {
			var self=this;
			self.fnSession();
        }
    });
    app.mount('#app');
</script>