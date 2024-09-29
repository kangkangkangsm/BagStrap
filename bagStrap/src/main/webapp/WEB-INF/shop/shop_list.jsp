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
	    padding: 20px 0;
	}

	.book-item {
	    background-color: #fff;
	    border-radius: 10px;
	    text-align: center;
	    padding: 15px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    position: relative;
	}

	.book-item img {
	    width: 100%;
	    height: 250px;
	    object-fit: cover;
	    border-radius: 10px 10px 0 0;
	}

	.book-item h5 {
	    margin-top: 10px;
	    font-size: 16px;
	    font-weight: bold;
	    color: #333;
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

	/* 체크박스 크기와 위치 조정 */
	.book-item input[type="checkbox"] {
	    position: absolute;
	    top: 10px;
	    left: 10px;
	    transform: scale(1.5); /* 체크박스를 더 크게 보이게 조정 */
	    cursor: pointer;
	}

	/* 카테고리 및 검색 영역 */
	.main-chap1 {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    margin-bottom: 20px;
	}

	.main-chap1 h1 {
	    font-size: 28px;
	    font-weight: bold;
	    color: #333;
	}

	.main-chap1 button {
	    margin-left: 10px;
	    padding: 10px 20px;
	    background-color: #f1f1f1;
	    border: 1px solid #ccc;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	}

	.main-chap1 button:hover {
	    background-color: #e0e0e0;
	}

	.main-chap1 button:active {
	    background-color: #d1d1d1;
	    border-color: #999;
	}

	.inputBox {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding: 20px;
	    background-color: #f8f9fa;
	    border-radius: 10px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    margin-bottom: 20px;
	}

	.inputBox input {
	    width: 300px;
	    height: 40px;
	    padding: 0 15px;
	    border: 1px solid #ced4da;
	    border-radius: 5px;
	    font-size: 16px;
	    box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	    transition: border-color 0.3s ease;
	}

	.inputBox input:focus {
	    border-color: #007bff;
	    outline: none;
	}

	.inputBox button {
	    padding: 10px 20px;
	    background-color: #007bff;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    font-size: 16px;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
		margin-left: -65%;
	}

	.inputBox button:hover {
	    background-color: #0056b3;
	}

	.inputBox select {
	    padding: 10px;
	    font-size: 14px;
	    border: 1px solid #ced4da;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: border-color 0.3s ease;
	}

	.inputBox select:focus {
	    border-color: #007bff;
	    outline: none;
	}

	/* 하단 버튼 영역 */
	.button-container {
	    display: flex;
	    justify-content: flex-start;
	    align-items: center;
	    padding: 20px 0;
	}

	.button-container input[type="checkbox"] {
	    margin-right: 10px;
	    transform: scale(1.2);
	}

	.button-container button {
	    margin-left: 10px;
	    padding: 10px 20px;
	    background-color: #ff8000;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	}

	.button-container button:hover {
	    background-color: #e67700;
	}

	hr {
	    width: 100%;
	    height: 1px;
	    border: none;
	    background-color: #ccc;
	    margin: 20px 0;
	}
	/* 페이징 버튼 스타일 */
		.pagination {
		    display: flex;
		    justify-content: center;
		    margin: 20px 0;
		}

		.pagination button {
		    background-color: #f8f9fa;
		    border: 1px solid #dee2e6;
		    color: #007bff;
		    padding: 8px 12px;
		    margin: 0 2px;
		    cursor: pointer;
		    transition: background-color 0.3s, color 0.3s;
		    border-radius: 4px;
		}

		.pagination button.active {
		    background-color: #007bff;
		    color: white;
		    cursor: default;
		}

		.pagination button:disabled {
		    background-color: #e9ecef;
		    color: #6c757d;
		    cursor: not-allowed;
		}

		.pagination button:not(.active):not(:disabled):hover {
		    background-color: #0056b3;
		    color: white;
		}
		
</style>
</head>
<body>
	<main class="main-container">
		
        <aside class="sidebar">
			<jsp:include page="/layout/shop_sidebar.jsp"></jsp:include>
        </aside>
		
		<div class="content">
			<div id="app">

				<div>
					<!-- 메인 제목과 버튼 -->
					
		
					<!-- 검색 및 필터 -->
					<div class="inputBox">
						<div class="main-chap1">
							<h1>{{category}}</h1>
						</div>
						<select v-model="pageSize" @change="fnGetList(1)">
							<option value="5">5개씩</option>	
							<option value="10">10개씩</option>	
							<option value="20">20개씩</option>	
						</select>
					</div>
		
					<!-- 체크박스 및 장바구니 버튼 -->
					<div class="button-container">
						{{selectedBooks}}
						<input type="checkbox" v-model="isAllSelected" @change="selectAllBooks"> 전체선택
						<button @click="addToCart()">장바구니</button>
					</div>
		
					<hr>
		
					<div class="book-list">
						<!--'/bookDetail/' + book.BOOK_ID-->
						<div v-for="(book, index) in bookList" :key="book.bookId" class="book-item" style="text-decoration: none; color: inherit;">
							<a @click="goToDetail(book.bookId)" href="javascript:;" >
								<input type="checkbox" :value="book.bookId" @change="isItemChecked(book.bookId)">
								<img :src="book.image" alt="책 이미지">
								<h5>{{ book.title }}</h5>
								<div class="price">{{ book.price }}원</div>
								<div class="discount">{{ book.discount }}% 할인</div>
								<div class="rating">평점: {{ book.rating }}</div>
								<img class="heart-icon" src="/src/heart.png" alt="좋아요">
							</a>
							<button type="button" @click="insertCartItem(book.bookId)">장바구니 추가</button>
						</div>
						
					</div>
					
					<!--페이징네이션 버튼-->
					<div class="pagination">
						<button v-if="currentPage > 1" @click="fnGetList(currentPage - 1)">이전</button>
					    <button v-for="page in pagesToShow" :class="{active: page == currentPage}" @click="fnGetList(page)">
					        {{ page }}
					    </button>
					    <button v-if="currentPage < totalPages" @click="fnGetList(currentPage + 1)">다음</button>
					</div>
				</div>
			
				
			</div>
		</div>

	</main>

	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script>
		const initialCategory = '${category}' || 'All';

			const app = Vue.createApp({
			    data() {
			        return {
						isLogin: false,
						isAdmin: false,
						category: initialCategory,
			            bookList: [],          // 서버에서 받아올 전체 책 데이터
						currentPage: 1,
						totalPages: 5,
						pageSize: 10,
						maxPageDisplay: 10,
						keyword: '',           // 검색 키워드
						category2: 2000,
						rating: 0,
						highPrice: 100000
			        };
			    },
				computed: {
				  startPage() {
				    // 현재 페이지 기준으로 시작 페이지 계산
				    return Math.floor((this.currentPage - 1) / this.maxPageDisplay) * this.maxPageDisplay + 1;
				  },
				  endPage() {
				    // 끝 페이지 계산 (총 페이지 수를 넘지 않도록 제한)
				    return Math.min(this.startPage + this.maxPageDisplay - 1, this.totalPages);
				  },
				  pagesToShow() {
				    // 시작 페이지부터 끝 페이지까지 배열 생성
				    let pages = [];
				    for (let i = this.startPage; i <= this.endPage; i++) {
				      pages.push(i);
				    }
				    return pages;
				  }
				},
			    methods: {
			        // 책 리스트 가져오기 (검색어에 따라 달라짐)
			        fnGetList(currentPage) {
			            const self = this;
			            const nparmap = {
			                keyword: self.keyword,
							currentPage: currentPage, 
							pageSize: self.pageSize,
							category: self.category,
							category2: self.category2,
							rating: self.rating,
							highPrice: self.highPrice
			            };
			            
			            $.ajax({
			                url: "/bookList.dox", // 서버의 URL
			                dataType: "json",
			                type: "POST",
			                data: nparmap, // 검색어 데이터를 함께 전송
			                success: function(data) {
								console.log(data);
								if(data.bookList){
								self.bookList = data.bookList;
								self.currentPage = currentPage;
								self.totalPages = data.totalPages;	
								
									
								}								
			                },
			                error: function(error) {
			                    console.error("데이터를 불러오는 중 오류 발생", error);
			                }
			            });
			        },
					goToDetail(bookId){
						$.pageChange("/shop/detail",{bookId : bookId});	

					},
					isItemChecked(bookId){
						var self = this;
						let bookExists = false;
						
						const quantity = +bookQuantity
						self.selectedBooks.forEach(item => {
							if(item.bookId === bookId){
								self.selectedBooks = self.selectedBooks.filter(item => item.bookId !== bookId);
								bookExists = true;
							}
						})
						if(!bookExists){
							self.selectedBooks.push({
								bookId : bookId
							});
						}

						
					},
					insertCartItem(bookId){
					var self = this;
					if(!self.isLogin){
						alert('로그인 후 이용해주세요');
						return;
					}
					$.ajax({
					    url: "/insertCartItem.dox", // 서버의 URL
					    type: "POST", // GET 방식으로 전송
					    data: { bookId: bookId }, // bookIds를 전송
					    success: function(data) {
							console.log(data)
							if(data.result){
								if(confirm(data.message +'장바구니로 이동하시겠습니까?')){
									$.pageChange("/myshop/cart", {});	
								}
							} else {
								alert(data.message);
							}
					    },
					    error: function(error) {
					        console.error("장바구니 추가 중 오류 발생", error);
					    }
					});
						
					}
			    },
			    mounted() {
					var self = this;
			        this.fnGetList(self.currentPage); // 컴포넌트가 로드될 때 책 리스트를 불러옴
					window.addEventListener('loginStatusChanged', function(){
						if(window.sessionStorage.getItem("isLogin") === 'true'){
							self.isLogin = true;	
						} else{
							self.isLogin = false;
						};
						self.fnGetList(self.currentPage);	
					});
					window.addEventListener('shopCategoryChange', function(){

						self.rating = +window.sessionStorage.getItem("rating");
						self.category2 = +window.sessionStorage.getItem("category");
						self.keyword = window.sessionStorage.getItem("keyword");
						self.highPrice = +window.sessionStorage.getItem("highPrice");
						
						self.fnGetList(self.currentPage);	
					});
			    }
			});
			
			app.mount('#app');
		</script>
</body>
</html>