<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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
				
				<div>
					<span :style="{ color: progress>0 ? 'blue' : 'black' }"> 1 상품 선택</span>
					<span :style="{ color: progress>1 ? 'blue' : 'black' }"> - 2 사유 선택</span>
					<span :style="{ color: progress>2 ? 'blue' : 'black' }"> - 3 해결방법 선택</span>
					<div>{{selectedRadio1}}</div>
					<div>{{selectedRadio2}}</div>
					<div>{{refundReasonContent}}</div>
					<div>{{imp}}</div>
					
					
					
				</div>		
				<div class="progress" v-if="progress === 1">			
					<h2>상품을 선택해 주세요{{priceSum}}</h2>
					<div class="ordered-list-container round">
					    <div class="left-section">
					        <div class="ordered-product" v-for="item in orderList" :key="item.bookId">
								<input type="checkbox" :id="item.bookId" :value="item.quantity"@change="isItemChecked()"/>
					            <img class="ordered-product-image" :src="item.image" :alt="item.title">
								
								<div class="ordered-product-info">
					                <div class="ordered-product-name">{{item.title}}</div>
					                <div class="ordered-product-detail-info">
					                    <span>{{item.price}}</span> / 
										<span>
											<input type="number" v-model="item.quantity" @change="isItemChecked()" min="1" :max="fnGetMax(item.bookId)"/>
										</span> 
										<button class="ordered-button relative-right">장바구니에 추가</button>
					                </div>
					            </div>
								
					        </div>
							
					    </div>
					</div>
				</div>
				
				
				<div class="progress" v-if="progress === 2">
				    <div class="refundReasonList1" v-for="item1 in refundReasonList1" :key="item1.reasonId">
				        {{ item1.reasonText }}
				        
						<div class="refundReasonList2" v-for="item2 in refundReasonList2" :key="item2.reasonId">
							
							<template v-if="startsWith(item1.reasonId, item2.reasonId)">
					            <label class="">
					                <input type="radio" name="reason2" :value="item2.reasonId" v-model="selectedRadio1" @change="fnChangeReason(2, item2.reasonId)"> {{ item2.reasonText }}
					            </label>
								<div v-show="selectedRadio1 === item2.reasonId">
									<div class="refund-textarea" v-if="item2.textarea === 'Y'">
										<textarea rows="15" cols="120" placeholder="내용을 입력해주세요" v-model="refundReasonContent"></textarea>
									</div>
									<div class="refund-file-upload" v-if="item2.fileUpload === 'Y'">
										<input type="file"/>(50MB 이하)
									</div>
					                
									
									<div v-for="item3 in refundReasonList3" :key="item3.reasonId">
										<template v-if="startsWith(item2.reasonId, item3.reasonId)">
											<label>
					                    		<input class="refundReasonList3" type="radio" name="reason3" :value="item3.reasonId" v-model="selectedRadio2" @change="fnChangeReason(3, item3.reasonId)">{{ item3.reasonText }}
											</label>
										</template>
										<div v-show="selectedRadio2 === item3.reasonId">
											<div class="refund-textarea" v-if="item3.textarea === 'Y'">
												<textarea rows="15" cols="120" placeholder="내용을 입력해주세요" v-model="refundReasonContent"></textarea>
											</div>
											<div class="refund-file-upload" v-if="item3.fileUpload === 'Y'">
												<input type="file"/>(50MB 이하)
											</div>
										</div>
					                </div>
									
								</div>
				            </template>
				        </div>
						
				    </div>
				</div>
				
				
				<div class="progress" v-if="progress === 3">			

					<div class="refund-container">
					       <div class="refund-amount">
					           <p class="refund-amount-title">환불안내</p>
					           <div class="refund-amount-details">
					               <p>상품금액: <span class="refund-amount-value">{{priceSum}} 원</span></p>
					               <p>배송비: <span class="refund-amount-value">0 원</span></p>
					               <p>반품비: <span class="refund-amount-value">0 원</span></p>
					               <p>환불 예상금액: <span class="refund-amount-value">{{priceSum}} 원</span></p>
					               <p>환불 수단: <span class="refund-amount-value">삼성카드 / 일시불 {{priceSum}} 원</span></p>
					           </div>
					       </div>
					   </div>
					
					
					
				</div>

				<div>
					<button v-if="progress<3" @click="fnChangeProgress(1)">다음</button>	
					<button v-if="progress==3" @click="fnRefund()">환불신청</button>
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
                orderId : '${orderId}',
				imp : '${imp}',
				progress : 1,
				orderList : [],
				selectedBooks: [],
				orderMaxList : [],

				selectedRadio1: '',
				selectedRadio2: '',
				refundReasonList1: [],
				refundReasonList2: [],
				refundReasonList3: [],
				selectedReason: '',
				refundReasonContent: '',
				
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
			},
			fnGetMax(bookId){
				return (bookId) => {
					var self = this;
					const item = self.orderMaxList.find(item => item.bookId === bookId);
					return item ? item.quantity : 0
				}
			}
		},
        methods: {
			reasonSelectLogic(reasonId){
				// 쓰는거 아님
				var self = this;
				var item1 = self.refundReasonList2.filter(item => item.reasonId.startsWith(reasonId) );
				var item2 = self.refundReasonList3.filter(item => item.reasonId.startsWith(reasonId));
				if(item1.length !=0){
					console.log(item1[0])
					if(item1[0].textarea === 'Y'){
						//alert('첫번째 radio에 있는 refundReasonContent만 읽으면 됨')
					} else {
						self.refundReasonContent = item1[0].reasonText
						//alert('첫번째 radio에 있는 value만 읽으면 됨')
					}
				} else if(item2.length !=0){
					if(item2[0].textarea === 'Y'){
						//alert('두번째 radio에 있는 refundReasonContent만 읽으면 됨')
					} else{
						self.refundReasonContent = item2[0].reasonText
						//alert('두번째 radio에 있는 value만 읽으면 됨')
					}
				}
			},
            fnGetList(){
				var self = this;
				var nparmap = {
					orderId : self.orderId
				};
				$.ajax({
					url:"/orderListForRefund.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						data.refundReasonList.forEach((item) => {
							if(item.reasonId.length === 1){
								self.refundReasonList1.push(item);
							} else if(item.reasonId.length === 2){
								self.refundReasonList2.push(item);							
							} else {
								self.refundReasonList3.push(item);
							}

						});
						data.orderList.forEach(item => {
							self.orderMaxList.push({
								bookId : item.bookId,
								quantity : item.quantity 
							})
						});
						console.log('orderMaxList')
						console.log(self.orderMaxList)
						self.orderList = data.orderList;
					}
				});
            },
			fnChangeProgress(value){
				var self = this;

				if(self.selectedBooks.length == 0 && self.progress == 1){
					alert('상품을 선택해주세요');
					return;
				}
				
				if(self.progress == 2){
					var end = false; 
					if(self.selectedRadio1 === ''){
						end = true;
					} else{
						self.refundReasonList3.forEach((item) => {
							if(item.reasonId.startsWith(self.selectedRadio1) && self.selectedRadio2===''){
								end = true
							}
						})
						self.refundReasonList3.forEach((item) => {
							if(item.reasonId == self.selectedRadio2 && item.textarea ==='Y' && self.refundReasonContent ===''){
								end = true
							}
						})
					}					
					if(end){
						alert('사유를 선택해주세요');
						end = false; 
						return;	
					}
				}
				
				self.progress += value;
				
				if(self.progress == 0 ){
					self.progress = 1;
				} else if(self.progress == 4){
					self.progress = 3;
				}
			},
			startsWith(prefix, str) {
			  return str.startsWith(prefix);
			},
			fnChangeReason(flg, reasonId){
				var self = this;
				if(flg!=3){
					self.selectedRadio2='';	
				}
				
				self.refundReasonContent='';
				document.querySelectorAll(".refund-textarea").innerHTML ='';
				self.reasonSelectLogic(reasonId)
				self.file=null;
			},
			isItemChecked(){
				var self = this;
				self.selectedBooks = [];
				self.orderList.forEach(item => {
					if(document.getElementById(item.bookId).checked === true){
						self.selectedBooks.push({
							bookId : item.bookId,
							bookQuantity : item.quantity,
							bookPrice : item.price
						});
					}
				})
			},
			fnRefund(){
				var self = this;
				var nparmap = {
					orderList : JSON.stringify(self.selectedBooks), // bookId, bookQuantity
					orderId : self.orderId,
					refundReasonContent : self.refundReasonContent,
					imp : self.imp
				};
				$.ajax({
					url:"/refund.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
					}
				});
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