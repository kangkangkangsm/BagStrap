<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도서 검색</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>

</head>
<body>
	
	<div id="app">
	    <form @submit.prevent="fnSearch">
	        <input type="text" v-model="query" placeholder="검색어를 입력하세요">
	        <button type="submit">검색</button>
			<button type="button" @click="fnCreateDB">DB추가</button>
			<select v-model="category">
				<option :value="item.boardTypeId" v-for="item in categoryList">{{item.name}}</option>
			</select>
			{{category}}
	    </form>

	    <div id="results">
	        <div v-for="item in results" :key="item.title">
	            <h3>{{ item.title }}</h3>
	            <p>저자: {{ item.author }}</p>
	            <p>출판사: {{ item.publisher }}</p>
	            <p>출판일: {{ item.pubdate }}</p>
	            <p>가격: {{ item.price }}</p>
	            <p><a :href="item.link">자세히 보기</a></p>
	        </div>
	    </div>
	</div>
		
	
    <script>
		const app = Vue.createApp({
		    data() {
		        return {
		            query: '',
		            results: [],
					parMap: [],
					category: 2012,
					categoryList:[]
		        };
		    },
		    methods: {
				fnGetCategoryList(){
					var self = this;
				    $.ajax({
				        url: '/selectCategory.dox',
				        type: 'POST',
				        contentType: 'application/json',  // JSON으로 보낼 것을 명시
				        success: function(data) {
				           
				            self.categoryList = data.list;
				        },
				        error: function(e) {
				            alert('오류 발생: ' + e.responseText);
				        }
				    });
				},
		        fnSearch() {
		            var self = this;
		            $.ajax({
		                url: '/search1',
		                type: 'GET',
		                data: { query: self.query },
		                success: function(data) {
		                 
		                    self.results = data.items;
							data.items.forEach(function(item){
								var map = {
									isbn : item.isbn,
									title : item.title,
									description : item.description,
									author : item.author,
									publisher : item.publisher,
									price : item.discount,
									image : item.image,
									quantity : 10,
									category : self.category,
									ebook : 'N'
								}
								self.parMap.push(map);
							})
							
		                },
		                error: function() {
		                    self.results = [{ title: '검색 중 오류가 발생했습니다.' }];
		                }
		            });
		        },
				fnCreateDB() {
				    var self = this;
				    $.ajax({
				        url: '/addBook.dox',
				        type: 'POST',
				        contentType: 'application/json',  // JSON으로 보낼 것을 명시
				        data: JSON.stringify({ bookList: self.parMap }),  // 데이터를 JSON 문자열로 변환
				        success: function(data) {
				           
				            alert('성공~');
				        },
				        error: function(e) {
				            alert('오류 발생: ' + e.responseText);
				        }
				    });
				}
		    },
		    mounted() {
		        // This could be used for any initialization logic, if needed
				this.fnGetCategoryList()
		    }
		});

		app.mount('#app');
		
		
        
    </script>
</body>
</html>



<!--KAKAO API-->
<!--<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page contentType="text/html; charset=UTF-8" %>
	<%@ page pageEncoding="UTF-8" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Search</title>
</head>
<body>
    <h1>Book Search</h1>
    <form action="/searchBook" method="get">
        <input type="text" name="query" placeholder="책 제목을 입력하세요" required>
        <button type="submit">검색</button>
    </form>
</body>
</html>-->