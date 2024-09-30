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
	body {
	    font-family: 'Arial', sans-serif;
	    background-color: #f4f7fa; /* 부드러운 배경색 */
	    color: #333; /* 기본 텍스트 색상 */
	    margin: 0;
	    padding: 20px;
	}
	h1 {
	    font-size: 28px; /* 제목 크기 조정 */
	    color: #007BFF; /* 제목 색상 */
	    margin-bottom: 10px; /* 제목과 내용 간격 */
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
	    padding: 15px; /* 내용 패딩 */
	    border-radius: 8px; /* 내용 박스 모서리 둥글게 */
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 내용 박스 그림자 */
	}
	.ToListBtn {
	    padding: 10px 20px; /* 버튼 패딩 */
	    background-color: #007BFF; /* 버튼 배경색 */
	    color: white; /* 버튼 글자색 */
	    border: none; /* 테두리 없애기 */
	    border-radius: 5px; /* 모서리 둥글게 */
	    cursor: pointer; /* 커서 모양 변경 */
	    transition: background-color 0.3s, transform 0.2s; /* 배경색 및 효과 전환 */
	    font-size: 16px; /* 버튼 텍스트 크기 */
	}
	.ToListBtn:hover {
	    background-color: #0056b3; /* 호버 시 배경색 변화 */
	    transform: scale(1.05); /* 호버 시 크기 변화 */
	}
</style>
<body>
	<div id="app">
		<h1>{{info.title}} </h1> 작성자: {{info.author}} 
		<hr>
		<div class="content" v-html="info.content"></div>
		<button class="ToListBtn" @click="ToList">목록</button>
	</div>
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