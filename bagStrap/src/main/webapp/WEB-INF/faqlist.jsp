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
		text-align: center; 
	    color: black; 
	    margin-bottom: 20px; 
		font-size: 20px;
	}
	.input-container {
	    display: flex; /* 플렉스 박스 사용 */
	    justify-content: center; /* 가로 중앙 정렬 */
	    align-items: center; /* 세로 중앙 정렬 */
	    margin-bottom: 20px; /* 요소 간의 간격 */
	}
	select, input {
	    padding: 10px; /* 편안한 패딩 */
	    margin: 10px; /* 요소 간의 여백 */
	    border: 1px solid #ccc; /* 연한 테두리 */
	    border-radius: 4px; /* 둥근 모서리 */
	    width: auto; /* 자동 너비 */
	    max-width: 300px; /* 최대 너비 제한 */
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
	<main class="main-container">
		<div id="app" class="content">
			<h1>자주 묻는 질문</h1>
			
			<div class="input-container">
			    <select v-model="searchOption">
			        <option value="all">::전체::</option>
			        <option value="title">제목</option>
					<option value="category">카테고리</option>
			    </select>
			    <input placeholder="검색어" v-model="keyword">
			    <button @click="fnGetList(1)">검색</button>
			</div>
			
			<div v-for="item in list">
				<details>	
				    <summary>[{{item.category}}] {{ item.question }}</summary>
				    <p>{{ item.answer }}</p>
				</details>
			</div>	
		</div>
	</main>
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
				
				// "전체"가 선택되면 검색어를 리셋
				 if (self.searchOption === "all") {
				     self.keyword = ""; // 검색어 리셋
				 }
				 
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