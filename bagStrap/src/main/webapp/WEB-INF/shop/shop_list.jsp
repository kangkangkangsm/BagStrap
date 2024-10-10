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

		.study-group-list-search-bar {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin-bottom: 30px;
			gap: 15px;
		}

		.study-group-list-search-bar input[type="text"] {
			flex: 1;
			padding: 12px 16px;
			border: 1px solid #ddd;
			border-radius: 10px;
			font-size: 16px;
			transition: border 0.3s;
		}

		.study-group-list-search-bar input[type="text"]:focus {
			border-color: #007bff;
			outline: none;
		}

		.study-group-list-search-bar button {
			background:#343A40;
		   color: #fff;
		   border: none;
		   cursor: pointer;
		   transition: background-color 0.3s;
		   font-size: 1em; /* 글자 크기 조정 */
		}
		.shop-list-title{
			font-size: 30px;
			font-weight: bold;
			margin: 0px 20px 0px 0px;
		}
		.shop-list-title-bar{
			display:flex;
			margin: 20px auto;
		}
		.shop-list-search-bar{
			flex:1
		}
		.shop-list-search-btn{
			width: 80px;
		}
		
		.book-container {
		    display: flex;
		    align-items: center;
		    background-color: #f9f9f9;
		    border-radius: 10px;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		    padding: 20px;
			margin-top: 10px;
		    width: 100%;
		}
		.book-container img{
			border: 1px solid #eee;

		}
		.book-cover {
		    width: 150px;
		    height: auto;
		    border-radius: 5px;
		    margin-right: 20px;
		}

		.book-details {
			box-sizing: border-box;
			padding-right: 15px;	
		    flex-grow: 1;
		}
		.book-details h1 {
			font-weight: bold;
		    font-size: 24px;
		    margin: 0 0 10px;
		}
		.book-details h2 {
		    font-size: 20px;
		    margin: 0 0 10px;
		}
		.book-details h3 {
			opacity: 0.8;
		    font-size: 18px;
		    margin: 0 0 10px;
		}
		.price {
		    font-size: 20px;
		    margin: 5px 0;
		}

		.rating {
		    display: flex;
		    margin: 5px 0;
		}

		.star {
		    width: 20px;
		    height: 20px;
		    margin-right: 2px;
		}

		.discount {
		    font-size: 18px;
		    color: red;
		    margin: 10px 0;
		}

		.add-to-cart {
			z-index: 10;
		    padding: 10px 15px;
		    border: none;
		    background-color: #ff7f50;
		    color: white;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 16px;
		}

		.add-to-cart:hover {
		    background-color: #e74c3c;
		}
		/* 토스트 메시지 기본 스타일 */
		.toast {
			visibility: hidden;
			background-color: #777;
			color: #fff;
			text-align: center;
			border-radius: 5px;
			padding: 2px 5px;
			position: absolute;
			z-index: 1;
			right: 27px;
			top: 24px;
			font-size: 17px;
			opacity: 0;
			transition: opacity 0.5s, transform 0.5s ease-in-out;
		}

		/* 토스트 메시지가 보여질 때 */
		.toast.show {
		  visibility: visible;
		  opacity: 1;
		  transform: translateY(-20px); /* 위로 슬라이드 */
		}
		.relative{
			position: relative;
		}

		/* Pagination 스타일 */
		.pagination {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    margin: 30px 0;
		    gap: 10px;
		    color: #000000;
		}

		.pagination button {
		    background-color: #ffffff;
		    border: 1px solid #dee2e6;
		    color: #000000;
		    padding: 10px 15px;
		    cursor: pointer;
		    transition: background-color 0.3s, color 0.3s;
		    border-radius: 4px;
		    font-size: 1em; /* 글자 크기 조정 */
		}

		.pagination button:hover {
		    background-color: #E0E0E0;
		    color: #ffffff;
		}

		.pagination button.active {
		    background-color: #000000;
		    color: #ffffff;
		    cursor: default;
		}

		.pagination button:disabled {
		    background-color: #e9ecef;
		    color: #6c757d;
		    cursor: not-allowed;
		    border: 1px solid #dee2e6;
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

				<div class="shop-list-title-bar">
					<h1 class="shop-list-title">{{category}}</h1>
					<div class="study-group-list-search-bar shop-list-search-bar">
						<input type="text" placeholder="검색어를 입력하세요" v-model="keyword" @keyup.enter="fnGetList(1)">
						<button class="shop-list-search-btn" @click="fnGetList(1)">검색</button>
					</div>
				</div>
				<div v-if="bookList.length === 0">해당하는 상품이 존재하지 않습니다.</div>
				<div class="book-container" v-for="(book, index) in bookList" :key="book.bookId" style="text-decoration: none; color: inherit;">
					<a @click="goToDetail(book.bookId)" href="javascript:;" >
					    <img :src="book.image" alt="책 표지" class="book-cover">
					</a>
					<a class="book-details" @click="goToDetail(book.bookId)" href="javascript:;" >
							<h1>{{ book.shortTitle }}</h1>
							<h3>{{ book.author }}</h3>
							<h2>{{ book.shortDescription }}</h2>
					        
	
					        <div class="rating">
								평점: {{ book.rating }}
					        </div>
					</a>
				    <div class="relative">
						<p class="price">{{ book.price }}원</p>
						<p class="discount" v-if="book.discount != 0">{{ book.discount }}% 할인 중</p>
				        <button class="add-to-cart" @click="insertCartItem(book.bookId)">장바구니에 추가</button>
						<div :id="book.bookId" class="toast">추가되었습니다</div>
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
						pageSize: 5,
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
								
								if(data.bookList){
								self.bookList = data.bookList;
								self.currentPage = currentPage;
								self.totalPages = data.totalPages;	
								
									
								}								
			                },
			                error: function(error) {
			                    
			                }
			            });
			        },
					goToDetail(bookId){
						$.pageChange("/shop/detail",{bookId : bookId});	

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
								
								if(data.result){
									self.showToast(bookId);
								} else {
									alert(data.message);
								}
						    },
						    error: function(error) {
						       
						    }
						});
						
					},
					showToast(name) {
					  var toast = document.getElementById(name);
					  toast.className = "toast show"; // 토스트 메시지 표시
					  setTimeout(function() {
					    toast.className = toast.className.replace("show", ""); // 3초 후에 사라짐
					  }, 1000);
					}
			    },
			    mounted() {
					var self = this;
			        this.fnGetList(1); // 컴포넌트가 로드될 때 책 리스트를 불러옴
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
						
						self.fnGetList(1);	
					});
			    }
			});
			
			app.mount('#app');
		</script>
</body>
</html>