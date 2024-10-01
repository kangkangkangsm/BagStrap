<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>FAQ</title>
</head>
<style>
	body {
	    font-family: 'Roboto', sans-serif; /* 깨끗한 현대적인 폰트 */
	    background-color: #f4f7fa; /* 부드러운 배경색 */
	    color: #333; /* 기본 텍스트 색상 */
	    margin: 0;
	    padding: 20px;
	}

	h1 {
	    text-align: center; /* 제목 중앙 정렬 */
	    color: #4a90e2; /* 제목 색상 */
	    margin-bottom: 20px; /* 제목과 다른 요소 간의 간격 */
	}
	.input-container {
	    display: flex; /* 플렉스 박스 사용 */
	    flex-direction: column; /* 세로 정렬 */
	    align-items: center; /* 가운데 정렬 */
	    margin-bottom: 20px; /* 요소 간의 간격 */
	}
	select, input {
	    padding: 10px; /* 편안한 패딩 */
	    margin: 10px 0; /* 요소 간의 여백 */
	    border: 1px solid #ccc; /* 연한 테두리 */
	    border-radius: 4px; /* 둥근 모서리 */
	    width: 100%; /* 전체 너비 사용 */
	    max-width: 300px; /* 최대 너비 제한 */
	}

	button {
	    padding: 10px 15px; /* 버튼 패딩 */
	    background-color: #4a90e2; /* 버튼 배경색 */
	    color: white; /* 버튼 텍스트 색상 */
	    border: none; /* 테두리 없음 */
	    border-radius: 4px; /* 둥근 모서리 */
	    cursor: pointer; /* 포인터 커서 */
	}

	button:hover {
	    background-color: #357ABD; /* 호버 시 어두운 파란색 */
	}
    details {
		width: 100%; /* 화면의 100% */
		max-width: 600px; /* 최대 너비 설정 */
		margin: 10px auto; /* 가운데 정렬 */ 
        border: 1px solid #aaa;
        border-radius: 4px;
        padding: 8px 8px 0 8px;
        opacity: 0.8;
    }
    details[open] {
        opacity: 1;
        padding: 8px;
    }
    details[open] summary {
        background-color: azure;
    }
    summary {
        font-weight: bold;
        background-color: bisque;
        margin: -8px -8px 0 -8px;
        padding: 8px;
    }
</style> 
<body>
	<div id="app">
		<h1>자주 묻는 질문</h1>
		
		<div class="input-container">
		    <select v-model="searchOption">
		        <option value="all">::전체::</option>
		        <option value="title">제목</option>
		    </select>
		    검색 : <input placeholder="검색어" v-model="keyword">
		    <button @click="fnGetList(1)">검색</button>
		</div>
		
		<div v-for="item in list">
			<details>	
			    <summary>[{{item.category}}] {{ item.question }}</summary>
			    <p>{{ item.answer }}</p>
			</details>
		</div>
		
	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				keyword :"",
				searchOption:"all",
            };
        },
        methods: {
			fnGetList(){
				var self = this;
				var nparmap = {
					keyword : self.keyword,
					searchOption:self.searchOption,
				};
				$.ajax({
					url:"faq-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
					}
				});
			},

        },
        mounted() {
			var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>