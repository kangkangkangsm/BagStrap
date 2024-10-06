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
	        padding: 20px 0; /* 상하 패딩만 설정 */
	        margin-bottom: 20px;
	    }

	    .left-section {
	        flex: 3;
	        padding-right: 20px;
	        border-right: 1px solid #eee;
	    }

	    .right-section {
	        flex: 1;
	        display: flex;
	        flex-direction: column;
	        justify-content: space-between;
	        padding-left: 20px;
	    }

	    .status {
	        font-weight: bold;
	        margin-bottom: 5px;
	    }

	    .arrival-time {
	        color: green;
	        margin-bottom: 10px;
	    }

	    .ordered-product {
	        display: flex;
	        margin-bottom: 10px;
	        padding: 10px 0; /* 상하 패딩 추가 */
	    }

	    .ordered-product-image {
	        width: 80px;
	        height: 100px;
	        margin-right: 20px;
	    }

	    .ordered-product-info {
	        flex: 1;
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
	        font-size: 16px;
	    }

	    .relative-right {
	        position: absolute;
	        right: 0;
	        bottom: 0;
	    }

	    .ordered-button {
	        padding: 10px;
	        background-color: #ff7f50;
	        border: 1px solid #ddd;
	        cursor: pointer;
	        text-align: center;
	    }

	    .refundReasonList3 {
	        margin-left: 20px;
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
			.shop-list-title-bar a{
			color: cadetblue;
			margin-top: 20px;
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
			    background-color: white;
			    border-radius: 10px;
			    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
			    padding: 20px;

			    width: 100%;
			}

			.book-cover {
			    width: 150px;
			    height: auto;
			    border-radius: 5px;
			    margin-right: 20px;
			}

			.book-details {
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
			.quantity-container {
			    display: flex;
			    align-items: center;
			    justify-content: center; /* 가운데 정렬 */
			    border: 1px solid #ddd; /* 테두리 */
			    border-radius: 5px; /* 둥근 모서리 */
			    padding: 5px; /* 패딩 */
			}

			.quantity-button {
			    background-color: #ff7f50; /* 버튼 배경색 */
			    color: white; /* 버튼 글자색 */
			    border: none; /* 버튼 테두리 제거 */
			    padding: 10px 15px; /* 버튼 패딩 */
			    cursor: pointer; /* 커서 포인터 */
			    font-size: 18px; /* 글자 크기 */
			    border-radius: 5px; /* 둥근 모서리 */
			    transition: background-color 0.3s; /* 배경색 변화 효과 */
			}

			.quantity-button:hover {
			    background-color: #e74c3c; /* 버튼 hover 색상 */
			}

			.quantity-value {
				text-align: center; /* 가운데 정렬 */

				width: fit-content;
				background-color: #bbb; /* 버튼 배경색 */
				color: white; /* 버튼 글자색 */
				border: none; /* 버튼 테두리 제거 */
				padding: 7px 12px; /* 버튼 패딩 */
				cursor: pointer; /* 커서 포인터 */
				font-size: 18px; /* 글자 크기 */
				border-radius: 5px; /* 둥근 모서리 */
				transition: background-color 0.3s; /* 배경색 변화 효과 */
			    margin: 0 10px; /* 양쪽 여백 */
			}
			.cart-checkbox{
				accent-color: #ff7f50;
				cursor: pointer; /* 커서 스타일 */
				border-radius: 5px;
				transform: scale(1.5); /* 크기 조정 (1.5배) */
				margin-right: 20px;
			}
			.order-btn-container{
				margin-top: 10px;
				display:flex;
			}
			.order-btn-flex{
				flex:1;
			}
			.price-sum{
				font-size: 18px;
				color: #333;
				font-weight: bold;
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

				
				<div class="shop-list-title-bar">
					<h1 class="shop-list-title" v-if="cartList.length !== 0">상품을 선택해 주세요</h1>
					<h1 class="shop-list-title" v-if="cartList.length === 0">장바구니가 비어있습니다.</h1>
					<a href="javascript:;" @click="fnToShop()" class="" v-if="cartList.length === 0">책 구매하러 가기</a>
				</div>
				<div class="book-container" v-for="(book, index) in cartList" :key="book.bookId" style="text-decoration: none; color: inherit;">
					<input class="cart-checkbox" :id="book.bookId" :name="book.bookId" type="checkbox" @change="isItemChecked(-1)"/>
					<label :for="book.bookId">
					    <img :src="book.image" alt="책 표지" class="book-cover">
					</label>
					<label class="book-details" :for="book.bookId">
						<div class="book-details" >
							<h1>{{ book.shortTitle }}</h1>
							<h3>{{ book.author }}</h3>
							<h2>{{ book.shortDescription }}</h2>
	
					        <div class="rating">
								평점: {{ book.rating }}
					        </div>
						</div>					
					</label>

						
				    <div class="relative">
						<div class="quantity-container">
						    <button class="quantity-button" @click="changeQuantity(book, -1)" id="decrease">-</button>
							<span class="quantity-value">{{book.quantity}}</span>
						    <button class="quantity-button" @click="changeQuantity(book, 1)" id="increase">+</button>
						</div>
						<p class="price">{{ book.price }}원</p>
						<p class="discount" v-if="book.discount != 0">{{ book.discount }}% 할인 중</p>
				        <button class="add-to-cart" @click="deleteCartItem(book.bookId)">장바구니에서 제거</button>
				    </div>
				</div>

				<div class="order-btn-container" v-if="cartList.length !== 0">
				    <div class="order-btn-flex"></div>
						<button class="add-to-cart" @click="toOrder()">주문하기</button>	
				</div>	
				<div class="order-btn-container" v-if="cartList.length !== 0">
				    <div class="order-btn-flex"></div>
						<p class="price-sum">상품금액: <span class="refund-amount-value">{{priceSum}} 원</span></p>							
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
				isLogin : true,
				progress : 1,
				cartList : [],
				selectedBooks: [],
				

				selectedRadio1: '',
				selectedRadio2: '',
				refundReasonList1: [],
				refundReasonList2: [],
				refundReasonList3: [],
				selectedReason: '',
				refundReasonContent: '',
				file: null,
				data : {
					storeId: "${store_id}",
					 // 채널 키 설정
					 channelKey: "${CHANNEL_KEY}",
					 paymentId: self.orderId,
					 orderName: "현이의 가방끈",
					 totalAmount: self.priceSum,
					 currency: "CURRENCY_KRW",
					 payMethod: "CARD",
					 customer: {
				       fullName: "${FULLNAME}",
				       phoneNumber: "${PHONE_NUMBER}",
				       email: "${EMAIL}",
				     }
				}
				
				
            };
        },
		computed: {
			priceSum(){
				var result = 0
				this.selectedBooks.forEach(item => {
					console.log('quantity: '+ typeof item.bookQuantity);
					console.log('bookPrice: '+ typeof item.bookPrice);
					result = result + item.bookQuantity*item.bookPrice;
				})
				return result;
			}
		},
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url:"/cartList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						
						self.cartList = data.cartList;
					}
				});
            },
			fnToShop(){
				$.pageChange("/shop/list",{category : 'All'});	
			},
			changeQuantity(book, numb){
				var self = this;
				book.quantity += numb;
				if(book.quantity === 0){
					book.quantity = 1;
				}
				self.isItemChecked(book.bookId);
				
			},
			isItemChecked(flg){
				var self = this;
				self.selectedBooks = [];
				self.cartList.forEach(item => {
					if(document.getElementById(item.bookId).checked === true){
						self.selectedBooks.push({
							bookId : item.bookId,
							bookQuantity : item.quantity,
							bookPrice : item.price
						});
					}
				})
				if(flg !== -1){
					const item = self.cartList.filter(item => item.bookId === flg);
					var nparmap = {
						bookId : item[0].bookId,
						quantity : item[0].quantity
					};
					$.ajax({
						url:"/changeCartItem.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
						}
					});
				}
			},
			toOrder(){
				var self = this;
				if(self.selectedBooks.length !== 0){
					$.pageChange("/payment/order",{orderList : self.selectedBooks, priceSum : self.priceSum});	
				} else {
					alert("주문할 상품을 선택해주세요");
				}
				
			},
			deleteCartItem(bookId){
				if(confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")){
					var self = this;
					var nparmap = {
						bookId : bookId
					};
					$.ajax({
						url:"/deleteCartItem.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							alert(data.message);
							if(data.result){
								self.fnGetList();
							}
						}
					});
					
				}
			}
        },
        mounted() {
            var self = this;
			self.fnGetList();
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					alert('로그인하쇼');
					self.isLogin = false;
				};
				self.fnGetList();
			});
        }
    });
    app.mount('#app');
</script>