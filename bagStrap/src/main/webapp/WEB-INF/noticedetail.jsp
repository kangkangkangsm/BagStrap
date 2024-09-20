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
	h1 {
	    font-size: 24px; 
	    color: #333; 
	}
	hr {
	    margin: 20px 0; /* 수평선 간격 조절 */
	    border: 1px solid lightgray; /* 수평선 색상 */
	}
	.content {
		line-height: 1.6;
		color: black;
		margin-bottom: 20px;
	}
	.ToListBtn {
	    padding: 10px 15px; /* 버튼 패딩 */
	    background-color: #007BFF; /* 버튼 배경색 */
	    color: white; /* 버튼 글자색 */
	    border: none; /* 테두리 없애기 */
	    border-radius: 5px; /* 모서리 둥글게 */
	    cursor: pointer; /* 커서 모양 변경 */
	    transition: background-color 0.3s; /* 배경색 전환 효과 */
	}

	.ToListBtn:hover {
	    background-color: #0056b3; /* 호버 시 배경색 변화 */
	}
</style>
<body>
	<div id="app">
		<h1>{{info.title}} </h1> 작성자: {{info.author}} 
		<hr>
		<div class="content" v-html="info.content"></div>
		<button class="ToListBtn" @click="ToList">목록</button>
	</div>
	
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