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

		.relative-right{
			position: absolute;
			right:0px;
			bottom:0px
		}
		.ordered-button {
		    padding: 10px;
		    background-color: #f0f0f0;
		    border: 1px solid #ddd;
		    cursor: pointer;
		    text-align: center;
		}
		.refundReasonList3{
			
			margin-left:20px;	
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
				cart입니당
				<div>
					<div>{{selectedBooks}}</div>
					<div>{{selectedRadio1}}</div>
					<div>{{selectedRadio2}}</div>
					<div>{{refundReasonContent}}</div>
					<div>{{priceSum}}</div>
					<div>{{quantityOfBooks}}</div>
				</div>		
				
				<div class="progress" v-if="progress === 1">			
					<h2>상품을 선택해 주세요</h2>
					<div class="ordered-list-container round">
					    <div class="left-section">
					        <div class="ordered-product" v-for="item in cartList">
								<input type="checkbox" :value="item.bookId" @change="isItemChecked(item.bookId, item.price, item.quantity)"/>

					            <img class="ordered-product-image" :src="item.image" :alt="item.title">
								<div class="ordered-product-info">
					                <div class="ordered-product-name">{{item.title}}</div>
					                <div class="ordered-product-detail-info">
					                    <span>{{item.price}}</span> / <span>{{item.quantity}}</span> 
										<button class="ordered-button relative-right">장바구니에서 제거</button>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
				</div>

				<div class="progress">			

					<div class="refund-container">
					    <div class="refund-amount">

							<div>
								<button class="ordered-button" @click="toOrder()">주문하기</button>			
							</div>
							
				            <div class="refund-amount-details">
				                <p>상품금액: <span class="refund-amount-value">{{priceSum}} 원</span></p>
				           </div>
				       </div>
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
				
				priceSum: 0,
				
				response : {
					
				},
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
			isItemChecked(bookId, bookPrice, bookQuantity){
				var self = this;
				let bookExists = false;
				
				const price = +bookPrice
				const quantity = +bookQuantity
				self.selectedBooks.forEach(item => {
					if(item.bookId === bookId){
						self.priceSum = self.priceSum-(price*quantity);
						self.selectedBooks = self.selectedBooks.filter(item => item.bookId !== bookId);
						bookExists = true;
					}
				})
				if(!bookExists){
					self.priceSum = self.priceSum+(price*quantity);
					self.selectedBooks.push({
						bookId : bookId,
						bookQuantity : bookQuantity,
						bookPrice : bookPrice
					});
				}

				
			},
			toOrder(){
				var self = this;
				$.pageChange("/payment/order",{orderList : self.selectedBooks, priceSum : self.priceSum});
			}
        },
        mounted() {
            var self = this;
			self.fnGetList();
			IMP.init("imp11730175"); 
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					alert('로그인하쇼');
					self.isLogin = false;
				};
			});
        }
    });
    app.mount('#app');
</script>