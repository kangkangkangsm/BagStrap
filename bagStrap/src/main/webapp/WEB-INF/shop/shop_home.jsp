<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<style>
		.book-list {
			display: grid;
			grid-template-columns: repeat(5, 1fr); /* 5 books per row */
			gap: 20px;
			padding: 20px;
			padding-top: 250px;
		}
		
		.book-item {
			border-radius: 10px;
			text-align: center;
			padding: 15px;
			position: relative;
		}

		.book-item img {
			width: 190px;
			height: 250px;
			object-fit: cover;
		}

		.book-item h5 {
			margin-top: 10px;
			font-size: 14px;
			font-weight: bold;
		}

		.book-item .price {
			font-size: 14px;
			color: #ff5722;
			margin-top: 5px;
		}

		.book-item .discount {
			font-size: 12px;
			color: #999;
		}

		.book-item .rating {
			margin-top: 10px;
			color: #4CAF50;
		}

		.book-item .heart-icon {
			position: absolute;
			bottom: 10px;
			right: 10px;
			cursor: pointer;
			width: 20px;
			height: 20px;
		}

		.book-item .border-soft {
			border: none;
		}
		.button-menu{
			padding: 20px;
			padding-top: 200px;
		}
		.top-menu {
           display: flex;
           justify-content: center;
           background-color: #f1f1f1;
           padding: 15px 0;
           margin-bottom: 20px;
       }

       .top-menu button {
           background: none;
           border: none;
           padding: 10px 20px;
           font-size: 16px;
           cursor: pointer;
       }

       .top-menu button.active {
           border-bottom: 3px solid #ff8000;
           font-weight: bold;
       }
	</style>
</head>
<body>
	<div id="app">
		<main class="main-container">
						<aside class="sidebar">
			         
			     </aside>

				 
			<!-- Book list -->
			<div class="book-list">
				<a v-for="book in bookList" :href="'/bookDetail/' + book.id" class="book-item" style="text-decoration: none; color: inherit;">
					<img :src="book.image" alt="책 이미지">
					<h5>{{ book.title }}</h5>
					<div class="price">{{ book.price }}원</div>
					<div class="discount">{{ book.discount }}% 할인</div>
					<div class="rating">평점: {{ book.rating }}</div>
					<img class="heart-icon" src="/src/heart.png" alt="좋아요">
				</a>
			</div>
		</main>
	</div>

	<jsp:include page="/layout/footer.jsp"></jsp:include>

	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
	<script>
		const app = new Vue({
			el: '#app',
			data() {
				return {
					bookList: [],
					selectedCategory: 'all'
				};
			},
			methods: {
				fnGetList() {
					var self = this;
					$.ajax({
						url: "bookList.dox",
						dataType: "json",
						type: "POST",
						success: function(data) {
							self.bookList = data.bookList;
						}
					});
				},
				fnFilterCategory(category) {
					this.selectedCategory = category;
					this.fnGetList();  // Fetch books by category
				}
			},
			mounted() {
				this.fnGetList();
			}
		});
	</script>
</body>
</html>