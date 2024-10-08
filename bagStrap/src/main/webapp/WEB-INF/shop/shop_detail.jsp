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
	            margin: 30px auto;
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
				background-color: #f9f9f9;
				border-radius: 10px;
				margin: 5px 20px;
				flex: 0 0 22%;
				text-align: center;
				padding: 20px;
	        }
	        .shop-detail-image img {
				border: 1px solid #eee;
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
	            background: #f9f9f9;
	            border: 1px solid #ddd;
	            padding: 15px;
	            border-radius: 10px;
	            text-align: center;
	        }
	        .shop-detail-related-book-item img, .shop-detail-study-item img {
				border: 1px solid #eee;
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
	            background: #ff7f50;
	            color: #fff;
	        }
			.shop-detail-btn-add-cart:hover {
	            background: #e74c3c;
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
			.present-review{
				font-size: 12px;
				color: #777;
				margin-left: 58px;
				
			}
			.only-flex{
				display:flex;
			}
			.only-flex-one{
				flex: 1;
			}
		
</style>
</head>
<body>
	<main class="main-container">
		
		<div class="content">
			<div id="app">
				
				
				<div class="shop-detail-container">
			        <div class="shop-detail-header">
						<div class="shop-detail-image">
			                <img :src="book[0]?.image || 'a-yo'" alt="책 표지">
			            </div>
						<div class="shop-detail-info">
			                <div class="shop-detail-title">{{ book[0]?.shortTitle || '제목이 없습니다.' }}</div>
			                <div class="shop-detail-author">저자: 홍길동</div>
			                <div class="shop-detail-item"><strong>출판사:</strong> {{ book[0]?.publisher || 'publisher가 없습니다.' }}</div>
			                <div class="shop-detail-item"><strong>ISBN:</strong> {{book[0]?.bookId || 'isbn이 없습니다.'}}</div>
			                <div class="shop-detail-item"><strong>카테고리:</strong> {{recommendList[0]?.name || 'category가 없습니다.'}}</div>
							<div class="present-review">현재 리뷰: {{reviewList.length}}</div>
							<a href="#shop-detail-reviews">
							<svg v-for="number in 5" :fill="(book[0]?.rating !== undefined && book[0]?.rating >= number) ? 'orange' : 'gray'" baseProfile="tiny" height="24px" id="Layer_1" version="1.2" viewBox="0 0 24 24" width="24px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><g><path d="M9.362,9.158c0,0-3.16,0.35-5.268,0.584c-0.19,0.023-0.358,0.15-0.421,0.343s0,0.394,0.14,0.521    c1.566,1.429,3.919,3.569,3.919,3.569c-0.002,0-0.646,3.113-1.074,5.19c-0.036,0.188,0.032,0.387,0.196,0.506    c0.163,0.119,0.373,0.121,0.538,0.028c1.844-1.048,4.606-2.624,4.606-2.624s2.763,1.576,4.604,2.625    c0.168,0.092,0.378,0.09,0.541-0.029c0.164-0.119,0.232-0.318,0.195-0.505c-0.428-2.078-1.071-5.191-1.071-5.191    s2.353-2.14,3.919-3.566c0.14-0.131,0.202-0.332,0.14-0.524s-0.23-0.319-0.42-0.341c-2.108-0.236-5.269-0.586-5.269-0.586    s-1.31-2.898-2.183-4.83c-0.082-0.173-0.254-0.294-0.456-0.294s-0.375,0.122-0.453,0.294C10.671,6.26,9.362,9.158,9.362,9.158z"/></g></g></svg>
							</a>
			            </div>
			        </div>
					<div class="shop-detail-purchase-section">
			            <!--<button class="shop-detail-btn-buy">구매하기</button>-->
			            <button class="shop-detail-btn-add-cart" @click="insertCartItem()">장바구니에 추가</button>
			        </div>
			        <div class="shop-detail-description">
			            <h3>도서 설명</h3>
			            {{book[0]?.description || '몰라인마'}}
			        </div>
	
			        <div class="shop-detail-related-books">
			            <h3>비슷한 책 추천</h3>
			            <div class="shop-detail-related-books-list">
			                <div class="shop-detail-related-book-item" v-for="item in recommendList">
								<a href="javascript:;" @click="goToOtherBook(item.bookId)">
				                    <img :src="item.image" :alt="item.bookId">
				                    <h4>{{item.shortTitle}}</h4>
				                    <div class="price">₩ {{item.price}}</div>
								</a>
			                </div>
			            </div>
			        </div>
	
			        <div class="shop-detail-study-section">
			            <h3>관련 스터디 목록</h3>
			            <div class="shop-detail-study-list">
			                <div class="shop-detail-study-item" v-for="item in detailList">
								<a href="javascript:;" @click="goToStudy(item.studyGroupId)">
			                    <img :src="item.filePath" alt="스터디 이미지">
			                    <h4>{{item.studyName}}</h4>
			                    <div class="study-info">진행 기간 <br>
									{{item.startdate}} ~ {{item.enddate}}</div>
								</a>
			                </div>
			            </div>
			        </div>
	
			        <div id="shop-detail-reviews" class="shop-detail-reviews">
			            <h3>사용자 리뷰</h3>
			            <div class="shop-detail-review-item" v-for="item in reviewList" :key="item.rating">
							<div class="only-flex">
				                <span class="only-flex-one">{{item.userId}} 
									<span class="shop-detail-rating">
										<svg v-for="number in 5" :fill="item.rating >= number ? 'orange' : 'gray'" baseProfile="tiny" height="24px" id="Layer_1" version="1.2" viewBox="0 0 24 24" width="24px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><g><path d="M9.362,9.158c0,0-3.16,0.35-5.268,0.584c-0.19,0.023-0.358,0.15-0.421,0.343s0,0.394,0.14,0.521    c1.566,1.429,3.919,3.569,3.919,3.569c-0.002,0-0.646,3.113-1.074,5.19c-0.036,0.188,0.032,0.387,0.196,0.506    c0.163,0.119,0.373,0.121,0.538,0.028c1.844-1.048,4.606-2.624,4.606-2.624s2.763,1.576,4.604,2.625    c0.168,0.092,0.378,0.09,0.541-0.029c0.164-0.119,0.232-0.318,0.195-0.505c-0.428-2.078-1.071-5.191-1.071-5.191    s2.353-2.14,3.919-3.566c0.14-0.131,0.202-0.332,0.14-0.524s-0.23-0.319-0.42-0.341c-2.108-0.236-5.269-0.586-5.269-0.586    s-1.31-2.898-2.183-4.83c-0.082-0.173-0.254-0.294-0.456-0.294s-0.375,0.122-0.453,0.294C10.671,6.26,9.362,9.158,9.362,9.158z"/></g></g></svg>
									</span>
								</span>
								<!--<span v-if="item.isUser">
									<a href="javascript:;" @click="goToReview(item)">수정 </a>
									<a>삭제</a>
								</span>-->
							</div>

			                <p>{{item.reviewComment}}</p>
			            </div>
			        </div>			
						
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
						recommendList: [],
						book: [],
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
								
								if(data.result){
								self.detailList = data.detailList;
								self.reviewList = data.reviewList;
								self.recommendList = data.recommendList;
								self.currentPage = currentPage;
								self.totalPages = data.totalPages;	
								self.book = data.detailList.filter((item) => {
									if(item.title != null && item.title != undefined)
									 return item
								 })
								
									
								}								
			                },
			                error: function(error) {
			                  
			                }
			            });
			        },
					goToReview(book){
						$.pageChange("/myshop/review",{book : book});
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
					},
					goToOtherBook(bookId){
						$.pageChange("/shop/detail", {bookId : bookId})
					},
					goToStudy(boardId) {
						$.pageChange("/study-group-detail", { boardNo: boardId });
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