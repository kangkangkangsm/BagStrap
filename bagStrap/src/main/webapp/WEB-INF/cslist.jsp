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
	table {
		margin : 20px auto;
		width: 80%;
	}
	td > a, li > a{
		color:black;
	}

	table, tr, th, td {
		border : 1px solid black;
		padding : 5px 5px;
		border-collapse: collapse;
	}
</style>

<body>
	<div id="app">
		<div id=searchContanier> 
			<select v-model="searchOption">
				<option value="all">::전체::</option>
				<option value="title">제목</option>
				<option value="name">작성자</option>
			</select>
			검색 : <input placeholder="검색어" v-model="keyword">
			<button @click="fnGetList(1)">검색</button>
			
<!--			<ul style="margin: 20px;">
				<li><a href="#" @click="fnCategory('')"> 전체글보기</a></li>
				<li><a href="#" @click="fnCategory(1001)"> 인기글</a></li>
				<li><a href="#" @click="fnCategory(1002)"> 공지사항</a></li>
				<li><a href="#" @click="fnCategory(1003)"> 자유게시판</a></li>
				<li><a href="#" @click="fnCategory(1004)"> 질문게시판</a></li>
			</ul>-->
			<select v-model="category" @change="fnGetList">
			    <option value="">전체글보기</option>
			    <option v-for="category in categories" 
					:key="category.id" :value="category.id">
			        {{ category.name }}
			    </option>
			</select>

		</div>
	
		<table>
			<tr>
				<th>게시글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>타입</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.boardId}}</td>
				<td>
					<a href="#" @click="fnView(item.boardId)">
					{{item.title}}</a> ({{item.cnt}})
				</td>
				<td>{{item.userNickName}}</td>
				<td>{{item.views}}</td>
				<td>{{item.createdDateFormatted}}</td>
				<td>{{item.boardTypeId}}</td>
			</tr>	
		</table>
					
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				keyword:"",
				searchOption:"all",
				category: "",
				categories:[
					{ id: 1001, name: '인기글' },
					{ id: 1002, name: '공지사항' },
					{ id: 1003, name: '자유게시판' },
					{ id: 1004, name: '질문게시판' }
				]
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					keyword : self.keyword,
					searchOption:self.searchOption,
					category: self.category,
				};
				$.ajax({
					url:"cs-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
						
					}
				});
            },
			/*fnCategory(boardTypeId){
				var self=this;
				self.category = boardTypeId;
				self.fnGetList();
			},*/
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>