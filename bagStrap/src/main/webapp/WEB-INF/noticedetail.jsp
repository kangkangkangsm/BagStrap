<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>공지사항 상세</title>
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
		
		.detail {
		    font-size: 14px; 
		    color: #888; 
		    margin-bottom: 15px;

		}
		
		hr {
		    margin: 20px 0; /* 수평선 간격 조절 */
		    border: 1px solid #ddd; /* 수평선 색상 */
		}
		
		.content {
		    line-height: 1.8; /* 줄 간격 조정 */
		    color: #444; /* 내용 텍스트 색상 */
		    margin-bottom: 30px; /* 내용과 버튼 간격 */
		    background-color: #fff; /* 내용 배경색 */
		    padding: 20px; /* 내용 패딩 */
		    border-radius: 8px; /* 내용 박스 모서리 둥글게 */
		    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 내용 박스 그림자 */
		}
		
		.ToListBtn {
			padding: 10px 15px;
			border: none;
			background-color: #ff7f50;
			color: white;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
		}
		
		.ToListBtn:hover {
			background-color: #e74c3c;
		}
	</style>
</head>
<body>
	<main class="main-container">
		<div id="app" class="content">
			<h1>{{info.title}}</h1>
			<div class="detail">작성자: {{info.author}} | 작성일: {{info.createdAt}} | 조회수: {{info.hit}}</div>
			<hr>
			<div class="content" v-html="info.content"></div>
			<button class="ToListBtn" @click="ToList">목록으로</button>
		</div>
	</main>
	<jsp:include page="/layout/footer.jsp"></jsp:include>    
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				noticeId : '${noticeId}',
				info : {},
            };
        },
        methods: {
			fnInfo(){
				var self = this;
				var nparmap = {
					keyword: self.noticeId
				};
				$.ajax({
					url: "notice-detail.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.info = data.info;
					}
				});
			},
			ToList() {
				location.href = "noticelist"; // 목록 페이지로 이동
			}
        },
        mounted() {
			var self = this;
			self.fnInfo();
        }
    });
    app.mount('#app');
</script>