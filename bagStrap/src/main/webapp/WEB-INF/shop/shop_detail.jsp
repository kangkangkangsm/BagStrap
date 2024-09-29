<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
<style>

	.shop-detail-container {
	            width: 70%;
	            margin: auto;
	            background: #fff;
	            border-radius: 10px;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	            padding: 20px;
	        }
	        .shop-detail-header {
	            display: flex;
	            justify-content: space-between;
	            align-items: flex-start;
	            padding-bottom: 20px;
	            border-bottom: 1px solid #ddd;
	        }
	        .shop-detail-image {
	            flex: 0 0 30%;
	            text-align: center;
	        }
	        .shop-detail-image img {
	            width: 150px;
	            height: 220px;
	        }
	        .shop-detail-info {
	            flex: 1;
	            margin-left: 30px;
	        }
	        .shop-detail-title {
	            font-size: 26px;
	            font-weight: bold;
	            margin-bottom: 10px;
	            color: #333;
	        }
	        .shop-detail-author {
	            font-size: 16px;
	            color: #777;
	            margin-bottom: 20px;
	        }
	        .shop-detail-item {
	            padding: 8px 0;
	            border-bottom: 1px solid #eee;
	        }
	        .shop-detail-description {
	            margin: 20px 0;
	            padding: 15px;
	            background-color: #f9f9f9;
	            border: 1px solid #ddd;
	            border-radius: 5px;
	        }
	        .shop-detail-related-books, .shop-detail-study-section {
	            margin: 20px 0;
	            border-top: 2px solid #ddd;
	            padding-top: 20px;
	        }
	        .shop-detail-related-books h3, .shop-detail-study-section h3, .shop-detail-reviews h3 {
	            font-size: 22px;
	        }
	        .shop-detail-related-books-list, .shop-detail-study-list {
	            display: grid;
	            grid-template-columns: repeat(4, 1fr);
	            gap: 15px;
	        }
	        .shop-detail-related-book-item, .shop-detail-study-item {
	            background: #fff;
	            border: 1px solid #ddd;
	            padding: 15px;
	            border-radius: 10px;
	            text-align: center;
	        }
	        .shop-detail-related-book-item img, .shop-detail-study-item img {
	            width: 100px;
	            height: 150px;
	            margin-bottom: 10px;
	        }
	        .shop-detail-related-book-item h4, .shop-detail-study-item h4 {
	            margin: 10px 0;
	            font-size: 16px;
	        }
	        .shop-detail-related-book-item .price, .shop-detail-study-item .study-info {
	            font-size: 14px;
	            color: #555;
	        }
	        .shop-detail-purchase-section {
	            text-align: center;
	            padding: 20px 0;
	            border-top: 2px solid #ddd;
	            margin-top: 20px;
	        }
	        .shop-detail-purchase-section button {
	            padding: 10px 30px;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	            font-size: 16px;
	            margin: 5px;
	        }
	        .shop-detail-btn-buy {
	            background: #28a745;
	            color: #fff;
	        }
	        .shop-detail-btn-add-cart {
	            background: #007bff;
	            color: #fff;
	        }
	        .shop-detail-reviews {
	            margin: 20px 0;
	            border-top: 2px solid #ddd;
	            padding-top: 20px;
	        }
	        .shop-detail-review-item {
	            margin-bottom: 10px;
	            padding: 15px;
	            background: #fff;
	            border-radius: 5px;
	            border: 1px solid #ddd;
	        }
	        .shop-detail-review-item:last-child {
	            margin-bottom: 0;
	        }
	        .shop-detail-rating {
	            color: #f39c12;
	        }
		
</style>
</head>
<body>
	<main class="main-container">
		
		<div class="content">
			<div id="app">

				<div class="shop-detail-container">
				        <!-- 도서 기본 정보: 책 이미지와 도서 정보 병렬 배치 -->
				        <div class="shop-detail-header">
				            <div class="shop-detail-info">
				                <div class="shop-detail-title">책 제목 예시</div>
				                <div class="shop-detail-author">저자: 홍길동</div>
				                <div class="shop-detail-item"><strong>출판사:</strong> 예문당</div>
				                <div class="shop-detail-item"><strong>출판일:</strong> 2024년 5월 3일</div>
				                <div class="shop-detail-item"><strong>ISBN:</strong> 978-1234567890</div>
				                <div class="shop-detail-item"><strong>페이지 수:</strong> 320 페이지</div>
				                <div class="shop-detail-item"><strong>카테고리:</strong> 소설</div>
				            </div>
				            
				            <div class="shop-detail-image">
				                <img src="https://via.placeholder.com/150x220" alt="책 표지">
				            </div>
				        </div>

				        <!-- 도서 설명 -->
				        <div class="shop-detail-description">
				            <h3>도서 설명</h3>
				            이 책은 현대 사회의 다양한 문제들을 날카롭게 다루며, 독자들에게 깊은 통찰력을 제공한다. 흥미로운 서사와 매력적인 캐릭터가 돋보이며, 사회 비판적 메시지를 담고 있다.
				        </div>

				        <!-- 비슷한 책 추천 섹션 -->
				        <div class="shop-detail-related-books">
				            <h3>비슷한 책 추천</h3>
				            <div class="shop-detail-related-books-list">
				                <div class="shop-detail-related-book-item">
				                    <img src="https://via.placeholder.com/100x150" alt="관련 도서 1">
				                    <h4>관련 도서 제목 1</h4>
				                    <div class="price">₩ 12,000</div>
				                </div>
				                <div class="shop-detail-related-book-item">
				                    <img src="https://via.placeholder.com/100x150" alt="관련 도서 2">
				                    <h4>관련 도서 제목 2</h4>
				                    <div class="price">₩ 13,000</div>
				                </div>
				            </div>
				        </div>

				        <!-- 관련 스터디 목록 섹션 -->
				        <div class="shop-detail-study-section">
				            <h3>관련 스터디 목록</h3>
				            <div class="shop-detail-study-list">
				                <div class="shop-detail-study-item">
				                    <img src="https://via.placeholder.com/100x150" alt="스터디 이미지">
				                    <h4>스터디 그룹 1</h4>
				                    <div class="study-info">진행 기간: 2024-10-01 ~ 2024-11-30</div>
				                </div>
				                <div class="shop-detail-study-item">
				                    <img src="https://via.placeholder.com/100x150" alt="스터디 이미지">
				                    <h4>스터디 그룹 2</h4>
				                    <div class="study-info">진행 기간: 2024-12-01 ~ 2025-01-30</div>
				                </div>
				            </div>
				        </div>

				        <!-- 구매 및 장바구니 버튼 -->
				        <div class="shop-detail-purchase-section">
				            <button class="shop-detail-btn-buy">구매하기</button>
				            <button class="shop-detail-btn-add-cart">장바구니에 추가</button>
				        </div>

				        <!-- 사용자 리뷰 -->
				        <div class="shop-detail-reviews">
				            <h3>사용자 리뷰</h3>
				            <div class="shop-detail-review-item">
				                <strong>사용자1</strong> <span class="shop-detail-rating">★★★★★</span>
				                <p>정말 재미있게 읽었어요! 책의 구성도 훌륭하고, 깊이 있는 이야기였습니다.</p>
				            </div>
				            <div class="shop-detail-review-item">
				                <strong>사용자2</strong> <span class="shop-detail-rating">★★★★☆</span>
				                <p>전체적으로 좋았지만, 중간에 약간 늘어지는 부분이 있었습니다.</p>
				            </div>
				        </div>
				    </div>

	</main>

	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script>

			const app = Vue.createApp({
			    data() {
			        return {
						isLogin: false,
						isAdmin: false,
						bookId: '${bookId}',
			            detailList: [],
						reviewList: [],
						currentPage: 1,
						totalPages: 5,
						pageSize: 10,
						maxPageDisplay: 5
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
			                bookId: self.bookId,
							currentPage: self.currentPage, 
							pageSize: self.pageSize,
							category: self.category,
							category2: self.category2,
							rating: self.rating,
							highPrice: self.highPrice
			            };
			            
			            $.ajax({
			                url: "/selectBookDetail.dox", // 서버의 URL
			                dataType: "json",
			                type: "POST",
			                data: nparmap, // 검색어 데이터를 함께 전송
			                success: function(data) {
								console.log(data);
								if(data.detailList){
								self.detailList = data.detailList;
								self.reviewList = data.reviewList;
								self.currentPage = currentPage;
								self.totalPages = data.totalPages;	
								
									
								}								
			                },
			                error: function(error) {
			                    console.error("데이터를 불러오는 중 오류 발생", error);
			                }
			            });
			        },
					insertCartItem(){
					var self = this;
					if(!self.isLogin){
						alert('로그인 후 이용해주세요');
						return;
					}
					$.ajax({
					    url: "/insertCartItem.dox", // 서버의 URL
					    type: "POST", // GET 방식으로 전송
					    data: { bookId: self.bookId }, // bookIds를 전송
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
			        this.fnGetList(); 
					window.addEventListener('loginStatusChanged', function(){
						if(window.sessionStorage.getItem("isLogin") === 'true'){
							self.isLogin = true;	
						} else{
							self.isLogin = false;
						};
						self.fnGetList(self.currentPage);	
					});

			    }
			});
			
			app.mount('#app');
		</script>
</body>
</html>