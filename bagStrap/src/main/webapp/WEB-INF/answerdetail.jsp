<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>view 기본 세팅 파일</title>
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

	h1 {
		font-size: 28px; 
		color: black; 
		margin-bottom: 15px; 
	}

	hr {
	    margin: 20px 0; /* 수평선 간격 조절 */
	    border: 1px solid lightgray; /* 수평선 색상 */
	}

	.content {
	    line-height: 1.8; /* 줄 간격 조정 */
	    color: #444; /* 텍스트 색상 조정 */
	    margin-bottom: 20px; /* 아래 여백 추가 */
	    padding: 10px; /* 패딩 추가 */
	    background-color: #fff; /* 배경 색상 */
	    border-radius: 5px; /* 모서리 둥글게 */
	    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	}

	.ToMyBtn {
		display:block;
		margin: 20px auto; /* 버튼 가운데 정렬 */
		padding: 10px 15px;
		border: none;
		background-color: #ff7f50;
		color: white;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
		transition: background-color 0.3s; /* 부드러운 호버 효과 */
	}

	.ToMyBtn:hover {
		background-color: #e74c3c;
	}

</style>
<body>
	<main class="main-container">
		<div id="app" class="content"> 
			<h1 class="title" v-html="info.title"> </h1> <hr>
			<div class="content" v-html="info.message"></div>
			작성일: {{info.createdDateFormatted}}
			<hr>
			 답변: <div class="content" v-html="info.answerMessage"></div>
			 작성일: {{info.DateFormatted}}<br>
			<button class="ToMyBtn" @click="ToMy">목록</button>
		</div>
	</main>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				inquiryId : '${inquiryId}',
				info : {},
            };
        },
        methods: {
			fnInfo(){
				var self = this;
				var nparmap = {
					keyword: self.inquiryId
				};
				$.ajax({
					url: "answer-detail.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.info = data.info;
					}
				});
			},
			ToMy() {
				location.href = "myinquiry"; // 목록 페이지로 이동
			}
        },
        mounted() {
			var self = this;
			self.fnInfo();
        }
    });
    app.mount('#app');
</script>