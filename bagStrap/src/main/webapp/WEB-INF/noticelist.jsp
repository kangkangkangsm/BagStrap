<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
	.list-item {
		padding: 10px;
		border-bottom: 1px solid #ccc;
	}
	.list-item:last-child {
		border-bottom: none;
	}
	.list-item a {
		text-decoration: none;
		color: black;
	}
	.add-button{
		padding: 10px 15px; /* 버튼 패딩 */
		background-color: #007BFF; /* 버튼 배경색 */
		color: white; /* 버튼 글자색 */
		border: none; /* 테두리 없애기 */
		border-radius: 5px; /* 모서리 둥글게 */
		cursor: pointer; /* 커서 모양 변경 */
		transition: background-color 0.3s; /* 배경색 전환 효과 */
	}
	.add-button:hover {
	    background-color: #0056b3; /* 호버 시 배경색 변화 */
	}
</style>

<body>
	<div id="app">
	
		<h1>공지사항</h1>
		<div class="list-item" v-for="item in list" :key="item.noticeId">
			<a href="#" @click="fnDetail(item.noticeId)">
				{{ item.title }} - 작성자: {{ item.author }} | 조회수: {{ item.hit }} | 작성일: {{ item.createdDateFormatted }}
			</a>
		</div>
		<button class="add-button" @click="goAddNotice">추가</button>
					
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				keyword : "",
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					keyword : self.keyword,
				};
				$.ajax({
					url:"notice-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;		
					}
				});
            },
			fnDetail(noticeId){
				$.pageChange("noticedetail",{noticeId: noticeId});
			},
			goAddNotice() {
			    location.href = "noticeadd"; // 공지사항 추가 페이지로 이동
			}

        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>