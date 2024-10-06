<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<style>

		.ordered-list-container {
		    display: flex;
		    border-bottom: 1px solid #eee;
		    padding: 20px;
		    margin-bottom: 20px;
		}

		.left-section {
		    flex: 3;
		    padding-right: 20px;
		    border-right: 1px solid #eee; /* Border between left and right section */
		}

		.right-section {
		    flex: 1;
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		    padding-left: 20px;
		}

		.status {
			display: flex;
		    font-weight: bold;
		    margin-bottom: 5px;
		}
		.status div{
			flex:1;
			margin-bottom:15px;
		}
		.status h1{
		    font-size:20px;
		}

		.arrival-time {
		    color: green;
		    margin-bottom: 10px;
		}

		.ordered-product {
		    display: flex;
		    margin-bottom: 10px;
		}

		.ordered-product-image {
			width:80px;
		    height: 100px;
		    margin-right: 20px;
		}

		.ordered-product-info {
			flex:1;
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		}

		.ordered-product-name {
		    font-size: 18px;
		    margin-bottom: 10px;
		}

		.ordered-product-detail-info {
		    position: relative;
		    justify-content: space-between;
		    font-size: 16px;
		}

		.ordered-button {
		    padding: 10px;
		    background-color: #f0f0f0;
		    border: 1px solid #ddd;
		    cursor: pointer;
		    text-align: center;
		}
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
			.order-toast {
				visibility: hidden;
				background-color: #777;
				color: #fff;
				text-align: center;
				border-radius: 5px;
				padding: 2px 5px;
				position: absolute;
				z-index: 10;
				right: 27px;
				top: 0px;
				font-size: 17px;
				opacity: 0;
				transition: opacity 0.5s, transform 0.5s ease-in-out;
			}

			/* 토스트 메시지가 보여질 때 */
			.order-toast.show {
			  visibility: visible;
			  opacity: 1;
			  transform: translateY(-20px); /* 위로 슬라이드 */
			}
			.relative{
				position: relative;
			}
			.shop-list-search-select{			
			    background: #343A40;
			    color: #fff;
			    border: none;
			    cursor: pointer;
			    transition: background-color 0.3s;
			    font-size: 1em;
				padding: 10px;
				border-radius: 5px;
			}
			.relative-review{
				position: absolute;
				right: 0px;
				bottom: 86px;
			}
			.relative-cart{
				position: absolute;
				right: 0px;
				bottom: 32px;
			}
			.selected-orders-date{
				display:flex;
			}
			.selected-orders-date button{
				background-color: #ff7f50;
			}
			.selected-orders-date button:hover {
				background-color: #e74c3c;
			}
	</style>
</head>
<body>
		<main class="main-container">
			
	        <aside class="sidebar">
				<jsp:include page="/layout/header_sidebar.jsp"></jsp:include>
	        </aside>
			

	        <div class="content">
				<div id="app">

					
				<div v-if="isLogin">

					<div class="shop-list-title-bar">
						<h1 class="shop-list-title">주문 내역</h1>
						<div class="study-group-list-search-bar shop-list-search-bar">
							<input type="text" placeholder="검색어를 입력하세요" v-model="keyword" @keyup.enter="fnGetList(1)">
							<button class="shop-list-search-btn" @click="fnGetList(1)">검색</button>
							<select class="shop-list-search-select" v-model="pageSize" @change="fnGetList(1)">
								<option value="5">5개씩</option>	
								<option value="10">10개씩</option>	
								<option value="20">20개씩</option>	
							</select>
						</div>
					</div>
					<div v-if="orderList.length === 0">해당하는 상품이 존재하지 않습니다.</div>				
					
					
					<div class="selected-orders-date">
						<button class="block round clickableMenu" @click="fnChangeYear('')">전체</button>
						<button class="block round clickableMenu" @click="fnChangeYear(item)" v-for="item in orderYear">{{item}}</button>
					</div>
					<!--날짜별로 오더리스트 출력-->
					<div id="order-list-by-date" v-for="(items, date) in groupedByDate" :key="date">
						
						<div class="book-container">
						    <!-- Left Section -->
						    <div class="left-section">
								<div class="status">
									<div>
										<h1>주문 번호: {{date}}</h1>
										{{items[0].status}}
										<span class="arrival-time">{{items[0].arriveddateDay}} 도착</span>	
									</div>
									<h2 class="ordered-text">주문일: {{items[0].orderdateYear}}</h2>
									
								</div>
								
						        <div class="ordered-product" v-for="item in items">
						            <a @click="goToDetail(item.bookId)" href="javascript:;" >
										<img class="ordered-product-image" :src="item.image" :alt="item.title">
									</a>
									<div class="ordered-product-info  book-details">
										<a @click="goToDetail(item.bookId)" href="javascript:;" >
						                	<h1 class="ordered-product-name">{{ item.shortTitle }}</h1>
										</a>
						                <div class="ordered-product-detail-info book-details">
											<a @click="goToDetail(item.bookId)" href="javascript:;" >
						                    	<h3>{{item.price}} 원</h3 > <h3>{{item.quantity}} 개</h3>
											</a> 
											<button class="add-to-cart relative-review" @click="goToReview(item)">
												 {{ item.rating === 0 ? '리뷰 작성하기' : '리뷰 수정하기' }}
											</button>
									        <button class="add-to-cart relative-cart" @click="insertCartItem(item.bookId)">장바구니에 추가</button>
											<div :id="item.bookId" class="order-toast">추가되었습니다</div>
						                </div>
						            </div>
						        </div>
						    </div>
						    <!-- Right Section -->
						    <div class="right-section">
								<button class="add-to-cart" @click="fnSubmitRefund(items[0].orderId, items[0].imp)">교환, 반품 신청</button>
						    </div>
						</div>
					</div>
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

</body>
</html>
<script>
	//localStorage.setItem('data', JSON.stringify(data));
	// JSON.parse(localStorage.getItem('data')).result
    const app = Vue.createApp({
        data() {
            return {
				//가변값 넣어라
				isLogin : false,
                isOrderExists : true,
				year: '',
				orderYear: [],
				orderList: [],
				list : {},
				codeList : {},
				selectedCodes : [],
				currentPage: 1,
				totalPages: 1,
				pageSize: 10,
				maxPageDisplay: 10,
				keyword:''
				
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
			},
		    groupedByDate() {
				var self = this;
		        return self.orderList.reduce((acc, item) => {
		            if (!acc[item.orderId]) {
		                acc[item.orderId] = [];
		            }
		            acc[item.orderId].push(item);
		            return acc;
		        }, {});
		    }
		},
        methods: {
			fnChangeYear(year){
				var self = this;
				self.year = year;
				self.fnGetList(1);
			},
            fnGetList(currentPage){
				var self = this;
				var nparmap = {
					year : self.year,
					keyword: self.keyword,
					currentPage: currentPage, 
					pageSize: self.pageSize
				};
				$.ajax({
					url:"/orderList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.orderList){
						self.orderList = data.orderList;
						self.orderYear = data.orderYear;
						self.currentPage = currentPage;
						self.totalPages = data.totalPages;
							
						}

					}
				});
            },
			goToDetail(bookId){
				$.pageChange("/shop/detail",{bookId : bookId});	

			},
			fnSubmitRefund(orderId, imp){
				$.pageChange("/myshop/refund",{orderId : orderId, imp : imp});
			},
			goToReview(book){
				$.pageChange("/myshop/review",{book : book});
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
							self.showToast(bookId);
						} else {
							alert(data.message);
						}
				    },
				    error: function(error) {
				        console.error("장바구니 추가 중 오류 발생", error);
				    }
				});
				
			},
			showToast(name) {
			  var toast = document.getElementById(name);
			  toast.className = "order-toast show"; // 토스트 메시지 표시
			  setTimeout(function() {
			    toast.className = toast.className.replace("show", ""); // 3초 후에 사라짐
			  }, 1000);
			}
        },
        mounted() {
            var self = this;
			self.fnGetList(self.currentPage);
			if(window.sessionStorage.getItem("isLogin") === 'true'){
				self.isLogin = true;	
			}
			if(window.sessionStorage.getItem("isAdmin") === 'true'){
				self.isAdmin = true;	
			}
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					self.isLogin = false;
				};
				self.fnGetList(self.currentPage);	
			});
			window.addEventListener('adminStatusChanged', function(){
				if(window.sessionStorage.getItem("isAdmin") === 'true'){
					self.isAdmin = true;	
				} else{
					self.isAdmin = false;
				};
				self.fnGetList(self.currentPage);	
			})
        }
    });
    app.mount('#app');
</script>