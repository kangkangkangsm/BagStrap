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
	body {
	    font-family: 'Roboto', sans-serif; /* 깔끔한 폰트 */
	    background-color: #f4f7fa; /* 부드러운 배경색 */
	    color: #333; /* 기본 텍스트 색상 */
	    margin: 0;
	    padding: 20px;
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
	    text-align: center; /* 제목 중앙 정렬 */
	    color: #4a90e2; /* 제목 색상 */
	    margin-bottom: 20px; /* 제목과 폼 간의 간격 */
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

	button {
	    background-color: #5cb85c;
	    color: white;
	    padding: 10px 15px;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    width: 100%; /* 버튼 전체 너비 사용 */
	    transition: background-color 0.3s; /* 배경색 부드러운 전환 */
	}

	button:hover {
	    background-color: #4cae4c; /* 호버 시 어두운 색상 */
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
			
	<!--		<div v-if="category == 'order'">
				<label>제품 이름:</label>
				<input type="text" v-model="productName" placeholder="제품 이름" required>
			</div>-->
			
			<label>제목:</label>
			<input type="text" id="title" v-model="title" required>
			
			<label>메시지:</label>
			<textarea id="message" v-model="message" rows="4" required></textarea>

			<button type="button" @click="fnSave()">문의하기</button>	
		</form>
	</div>
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