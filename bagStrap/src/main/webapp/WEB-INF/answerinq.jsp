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
		padding: 10px 15px;
		border: none;
		background-color: #ff7f50;
		color: white;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;	
	}
	button:hover {
		background-color: #e74c3c;
	}
</style>
<body>
	<main class="main-container">
		<div id="app" class="content">
		<!--번호:{{info.inquriyId}} -->
			<form class="container">
				
				<label>답변:</label>
				<textarea id="message" v-model="message" rows="4" required></textarea>
	
				<button type="button" @click="fnSave()">답변하기</button>	
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