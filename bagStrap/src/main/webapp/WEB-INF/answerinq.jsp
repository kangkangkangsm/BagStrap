<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>답변</title>
</head>
<style>
	body {
		background-color: #f4f4f4; /* 배경 색상 */
		font-family: 'Roboto', sans-serif; /* 폰트 설정 */
	}
	
	.container {
		  opacity: 1;
		  margin-top: 50px;
		  padding-left: 100px;
		  padding-right: 100px;
	}
	
	label {
	    font-weight: bold; /* 굵은 글씨 */
	    margin-bottom: 10px; /* 아래 여백 추가 */
	    display: block; /* 블록 요소로 변경 */
	}
	
	input, select, textarea {
		width: 100%;
		padding: 12px;
		margin: 10px 0;
		border: 1px solid #ccc;
		border-radius: 4px;
	}
	button {
		background-color: #5cb85c;
		color: white;
		padding: 13px px;
		border: none;
		border-radius: 16px;
		cursor: pointer;
	}
	button:hover {
		background-color: #4cae4c;
	}
</style>
<body>
	<div id="app">
	<!--번호:{{info.inquriyId}} -->
		<form class="container">
			
			<label>답변:</label>
			<textarea id="message" v-model="message" rows="4" required></textarea>

			<button type="button" @click="fnSave()">답변하기</button>	
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
				inquiryId: '${inquiryId}',
				message:"",
				sessionUserId : '',
            };
        },
        methods: {
			fnSave() {
					var self=this;

				    var nparam = {
				    	inquiryId : self.inquiryId,
				        answerMessage : self.message,
				        userId: self.sessionUserId
				    };
				   
				    $.ajax({
				        url: "answer-inq.dox",
				        dataType: "json",	
				        type: "POST", 
				        data: nparam,
				        success: function(data) {
				        	console.log(data);
				            alert(data.message);
 				            if (data.result === "success") {
				                location.href = "history"; 
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