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
		<select v-model="searchOption">
			<option value="all">::전체::</option>
			<option value="title">제목</option>
		</select>
		검색 : <input placeholder="검색어" v-model="keyword">
					<button @click="fnGetList(1)">검색</button>
		<div v-for="item in list">
			<details>	
			    <summary>[{{item.category}}] {{ item.question }}</summary>
			    <p>{{ item.answer }}</p>
			</details>
		</div>
		
	</div>
	
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