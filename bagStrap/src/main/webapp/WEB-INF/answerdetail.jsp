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
	    background-color: #f4f4f4; /* 배경 색상 */
	    font-family: 'Roboto', sans-serif; /* 폰트 설정 */
	}

	h1 {
	    font-size: 28px; /* 제목 크기 조정 */
	    color: #333; /* 제목 색상 */
	    margin-bottom: 10px; /* 제목 아래 여백 */
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
	    display: inline-block; /* 버튼 정렬을 위해 */
	    padding: 12px 20px; /* 버튼 패딩 */
	    background-color: #007BFF; /* 버튼 배경색 */
	    color: white; /* 버튼 글자색 */
	    border: none; /* 테두리 없애기 */
	    border-radius: 5px; /* 모서리 둥글게 */
	    cursor: pointer; /* 커서 모양 변경 */
	    transition: background-color 0.3s, transform 0.2s; /* 배경색 전환 및 클릭 효과 */
	}

	.ToMyBtn:hover {
	    background-color: #0056b3; /* 호버 시 배경색 변화 */
	    transform: translateY(-2px); /* 버튼을 위로 이동하는 효과 */
	}

	.ToMyBtn:active {
	    transform: translateY(0); /* 클릭 시 위치 초기화 */
	}
</style>
<body>
	<div id="app"> 
		<h1 class="title" v-html="info.title"> </h1> <hr>
		<div class="content" v-html="info.message"></div>
		작성일: {{info.createdDateFormatted}}
		<hr>
		 답변: <div class="content" v-html="info.answerMessage"></div>
		 작성일: {{info.DateFormatted}}
		<button class="ToMyBtn" @click="ToMy">목록</button>
	</div>
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