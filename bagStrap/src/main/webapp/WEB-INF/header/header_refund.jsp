s<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<title>첫번째 페이지</title>
	<style>
		body {
		    font-family: 'Noto Sans KR', sans-serif;
		    background-color: #f7f9fc;
		    margin: 0;
		    padding: 20px;
		}

		.content {
		    width: 80%;
		    margin: 0 auto;
		    background-color: #ffffff;
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    padding: 30px;
		}

		.refund-progress {
		    font-size: 18px;
		    margin-bottom: 30px;
		    text-align: center;
		}

		.refund-progress span {
		    font-weight: bold;
		    color: #555;
		    padding: 0 10px;
		}

		.refund-progress span[style*="blue"] {
		    color: #4a90e2;
		}

		.progress h2 {
		    text-align: center;
		    color: #333;
		    font-size: 24px;
		    margin-bottom: 20px;
		}

		.ordered-list-container {
		    padding: 20px;
		    border: 1px solid #ddd;
		    border-radius: 10px;
		    margin-bottom: 30px;
		    background-color: #f9f9f9;
		}

		.ordered-product {
		    display: flex;
		    padding: 15px;
		    border-radius: 10px;
		    background: #ffffff;
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		    margin-bottom: 20px;
		    transition: transform 0.2s;
		}

		.ordered-product:hover {
		    transform: translateY(-2px);
		}

		.ordered-product-image {
		    width: 100px;
		    height: 130px;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		    margin-right: 20px;
		}

		.ordered-product-info {
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		    flex-grow: 1;
		}

		.ordered-product-name {
		    font-size: 18px;
		    margin-bottom: 10px;
		    font-weight: bold;
		}

		.ordered-product-detail-info {
		    display: flex;
		    align-items: center;
		    justify-content: space-between;
		}

		.ordered-product-detail-info input {
		    border: 1px solid #ddd;
		    padding: 5px;
		    width: 50px;
		    text-align: center;
		    margin-right: 10px;
		}

		.relative-right {
		    background-color: #ff6b6b;
		    color: #ffffff;
		    border: none;
		    padding: 8px 12px;
		    border-radius: 5px;
		    cursor: pointer;
		}

		.relative-right:hover {
		    background-color: #ff5252;
		}


		button:hover {
		    background-color: #357ABD;
		}

		button[disabled] {
		    background-color: #c7c7c7;
		    cursor: not-allowed;
		}

		button[disabled]:hover {
		    background-color: #c7c7c7;
		}

		.refundReasonList1,
		.refundReasonList2,
		.refundReasonList3 {
			display: block;
		    margin: 10px 0;
		    padding: 15px;
		    background: #f4f4f4;
		    border-radius: 5px;
		}

		.refundReasonList2:hover,
		.refundReasonList3:hover {
		    background: #e0e0e0;
		}

		.refundReasonList2 {
		    margin-left: 20px;
		}

		.refundReasonList3 {
		    margin-left: 40px;
		}
		.refund-textarea{
			display: flex;
		}
		
		.refund-textarea textarea {
			margin: 0px 60px;
		    width: 100%;
		    height: 100px;
		    border: 1px solid #ddd;
		    padding: 10px;
		    border-radius: 5px;

		    resize: none;
		}

		.refund-file-upload {
		    margin-top: 20px;
		}

		.refund-file-upload input {
		    margin-bottom: 10px;
		}

		.refund-container {
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    padding: 20px;
		    margin-bottom: 20px;
		    background: #f9f9f9;
		}

		.refund-amount-title {
		    font-size: 22px;
		    font-weight: bold;
		    margin-bottom: 10px;
		}

		.refund-amount-details p {
		    font-size: 16px;
		    margin: 8px 0;
		}

		.refund-amount-value {
		    font-weight: bold;
		    color: #4a90e2;
		}

		.stu-comm-insert-image-preview {
		    width: 150px;
		    height: 150px;
			margin: 0px 60px;
		    object-fit: cover;
		    margin-top: 10px;
		}

		.submit-button {
		    background-color: #ff6b6b;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    padding: 10px 20px;
		    cursor: pointer;
		    font-size: 16px;
		    margin-right: 10px;
		}

		.submit-button:hover {
		    background-color: #ff5252;
		}
		.quantity-container {
		    display: flex;
		    align-items: center;
		    justify-content: center; /* 가운데 정렬 */
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
		.refund-price{
			font-weight: bold;
			font-size: 16px;
		}

		.progress-bar {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    font-family: 'Noto Sans KR', sans-serif;
		    margin: 20px 0;
		}

		/* 각 단계의 기본 스타일 */
		.step {
		    display: flex;
		    align-items: center;
		    margin: 0 10px;
		    color: #aaa; /* 비활성화 단계의 기본 텍스트 색상 */
		}

		/* 단계 번호 스타일 */
		.step-number {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    width: 24px;
		    height: 24px;
		    border-radius: 50%;
		    background-color: #ddd;
		    color: #fff;
		    margin-right: 5px;
		    font-weight: bold;
		    transition: all 0.3s ease;
		}

		/* 활성화된 원형의 스타일 */
		.step-number.step-active {
		    background-color: #ff7f50; /* 활성화된 원형의 배경 색상 */
		    color: #fff; /* 활성화된 원형의 텍스트 색상 */
		}

		/* 각 단계 제목 텍스트 스타일 */
		.step-title {
		    font-size: 14px;
		}

		/* 각 단계 사이 구분자 스타일 */
		.separator {
		    font-size: 18px;
		    color: #ddd;
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
	</style>
</head>
<body>
	<main class="main-container">
		
        <aside class="sidebar">
			<jsp:include page="/layout/header_sidebar.jsp"></jsp:include>
        </aside>
		
        <div class="content">
			<div id="app">
				{{lastRefundReasonContent}} {{refundReasonContent}}
					<div class="progress-bar">
					    <div :class="['step', { active: progress > 0 }]">
					        <span class="step-number" :class="{ 'step-active': progress > 0 }">1</span>
					        <span class="step-title" :style="{ color: progress > 0 ? '#ff7f50' : '#aaa' }">상품 선택</span>
					    </div>
					    <span class="separator">—</span>
					    <div :class="['step', { active: progress > 1 }]">
					        <span class="step-number" :class="{ 'step-active': progress > 1 }">2</span>
					        <span class="step-title" :style="{ color: progress > 1 ? '#ff7f50' : '#aaa' }">사유 선택</span>
					    </div>
					    <span class="separator">—</span>
					    <div :class="['step', { active: progress > 2 }]">
					        <span class="step-number" :class="{ 'step-active': progress > 2 }">3</span>
					        <span class="step-title" :style="{ color: progress > 2 ? '#ff7f50' : '#aaa' }">환불 신청</span>
					    </div>
					</div>
					

				<div class="progress" v-if="progress === 1 ">			
					<h2 v-if="checkQuantity != 0">상품을 선택해 주세요</h2>
					<h2 v-if="checkQuantity === 0">환불 가능한 상품이 존재하지 않습니다.</h2>
					<div class="ordered-list-container round"  v-if="checkQuantity != 0">
					    <div class="left-section">
					        <div v-for="item in orderList" :key="item.bookId">
								<div class="ordered-product" v-if="item.quantity != 0">
									<input class="cart-checkbox" type="checkbox" :id="item.bookId" :value="item.quantity" @change="isItemChecked()"/>
									<label :for="item.bookId">
						            	<img class="ordered-product-image" :src="item.image" :alt="item.title">
									</label>
									<div class="ordered-product-info">
										<label :for="item.bookId">
							                <div class="ordered-product-name">{{item.title}}</div>
										</label>
										<div class="ordered-product-detail-info">
											<label :for="item.bookId">{{item.author}}</label>
										    <span class="refund-price">{{item.price}}원</span>
										</div>
										<div class="ordered-product-detail-info">
											<label :for="item.bookId"></label>
	
											<div class="quantity-container">
											    <button class="quantity-button" @click="changeQuantity(item, -1)" id="decrease">-</button>
												<span class="quantity-value">{{item.quantity}}</span>
											    <button class="quantity-button" @click="changeQuantity(item, 1)" id="increase">+</button>
											</div> 
						                </div>
						            </div>
								</div>
					        </div>
							
					    </div>
					</div>
				</div>
				
				
				<div class="progress refundReasonList1" v-if="progress === 2">
				    <div  v-for="item1 in refundReasonList1" :key="item1.reasonId">
				        <span >{{ item1.reasonText }}</span>
				        
						<div v-for="item2 in refundReasonList2" :key="item2.reasonId">
							
							<template v-if="startsWith(item1.reasonId, item2.reasonId)">
					            <label class="refundReasonList2">
					                <input type="radio" name="reason2" :value="item2.reasonId" v-model="selectedRadio1" @change="fnChangeReason(2, item2.reasonId)"> {{ item2.reasonText }}
					            </label>
								<div v-if="selectedRadio1 === item2.reasonId">
									<div class="refund-textarea" v-if="item2.textarea === 'Y'">
										<textarea rows="15" cols="120" placeholder="내용을 입력해주세요" v-model="refundReasonContent"></textarea>
									</div>
									<div class="refund-file-upload" v-if="item2.fileUpload === 'Y'">
										<label for="file">파일 업로드</label>
								        <input type="file" @change="fnFileChange"/>
								        <input type="file" id="file-upload" style="display: none;" @change="fnFileChange"/>
										(50MB 이하)
								        <!-- 이미지 미리보기 -->
								        <div v-if="filePreview">
								            <img :src="filePreview" class="stu-comm-insert-image-preview" />
								        </div>
									</div>
					                
									
									<div v-for="item3 in refundReasonList3" :key="item3.reasonId">
										<template v-if="startsWith(item2.reasonId, item3.reasonId)">
											<label class="refundReasonList3">
					                    		<input type="radio" name="reason3" :value="item3.reasonId" v-model="selectedRadio2" @change="fnChangeReason(3, item3.reasonId)">{{ item3.reasonText }}
											</label>
										</template>
										<div v-if="selectedRadio2 === item3.reasonId">
											<div class="refund-textarea" v-if="item3.textarea === 'Y'">
												<textarea rows="15" cols="120" placeholder="내용을 입력해주세요" v-model="refundReasonContent"></textarea>
											</div>
											<div class="refund-file-upload" v-if="item3.fileUpload === 'Y'">
												<div class="refund-file-upload" v-if="item2.fileUpload === 'Y'">
											        <input type="file" @change="fnFileChange"/>
											        <input type="file" id="file-upload" style="display: none;" @change="fnFileChange"/>
													(50MB 이하)
											        <!-- 이미지 미리보기 -->
											        <div v-if="filePreview">
											            <img :src="filePreview" class="stu-comm-insert-image-preview" />
											        </div>
												</div>											
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
					<button class="add-to-cart" v-if="progress<3 && checkQuantity != 0" @click="fnChangeProgress(1)">다음</button>	
					<button class="add-to-cart" v-if="progress==3" @click="fnRefund()">환불신청</button>
				</div>
				
	        </div>
		</div>

    </main>

	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>
<script>

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
				checkQuantity: 0,

				selectedRadio1: '',
				selectedRadio2: '',
				refundReasonList1: [],
				refundReasonList2: [],
				refundReasonList3: [],
				selectedReason: '',
				refundReasonContent: '',	
				lastRefundReasonContent: '',			
				file: null,
				filePreview: null,
				
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
				var self = this;
				var item1 = self.refundReasonList2.filter(item => item.reasonId.startsWith(reasonId) );
				var item2 = self.refundReasonList3.filter(item => item.reasonId.startsWith(reasonId));
				if(item1.length !=0){
					
					if(item1[0].textarea === 'Y'){
						self.lastRefundReasonContent = item1[0].reasonText;
						//alert('첫번째 radio에 있는 refundReasonContent만 읽으면 됨')
					} else {
						self.lastRefundReasonContent = item1[0].reasonText;
						//alert('첫번째 radio에 있는 value만 읽으면 됨')
					}
				} else if(item2.length !=0){
					if(item2[0].textarea === 'Y'){
						//alert('두번째 radio에 있는 refundReasonContent만 읽으면 됨')
						self.lastRefundReasonContent = item2[0].reasonText;
					} else{
						self.lastRefundReasonContent = item2[0].reasonText;
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
						
						self.refundReasonList1 =[];
						self.refundReasonList2 =[];
						self.refundReasonList3 =[];
												
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
							self.orderMaxList = []
							self.orderMaxList.push({
								bookId : item.bookId,
								quantity : item.quantity 
							})
							self.checkQuantity += item.quantity;
						});
						
						self.orderList = data.orderList;
					}
				});
            },
			fnChangeProgress(value){
				var self = this;

				if(self.selectedBooks.length == 0 && self.progress == 1){
					alert('환불할 상품을 확인해주세요');
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
				
				self.refundReasonContent='';4
				document.querySelectorAll(".refund-textarea").innerHTML ='';
				self.reasonSelectLogic(reasonId)
				self.file=null;
				self.filePreview=null;
				document.querySelectorAll("input[type='file']").forEach(function(input) {
				    input.value = '';
				});
			},
			changeQuantity(book, numb){
				var self = this;
				var max = self.orderMaxList.find(item => item.bookId === book.bookId);
				if (max.quantity === 0 && numb === 1){
					alert('환불 가능한 최대 수량입니다.');
					return;
				} 
				book.quantity += numb;
				if(max.quantity < book.quantity){
					book.quantity = max.quantity;
					alert('환불 가능한 최대 수량입니다.');	
				} else if(book.quantity <= 0){
					book.quantity = 1;
				}
				
				self.isItemChecked();
				
			},
			isItemChecked(){
				var self = this;
				
				self.selectedBooks = [];
				self.orderList.forEach(item => {
					if(document.getElementById(item.bookId) === null || document.getElementById(item.bookId) === undefined){ // null 체크용
					} else if(document.getElementById(item.bookId).checked === true){
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
					refundReasonContent : self.lastRefundReasonContent + ' ' + self.refundReasonContent,
					imp : self.imp
				};
				$.ajax({
					url:"/refund.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						
						if(data.body.code == -1){
							alert(data.body.message);	
						} else {
							var idx = data.body.idx;
							var message = data.body.message;	
						
							if (self.file) {
								  const formData = new FormData();
								  formData.append('file1', self.file);
								  formData.append('idx', idx);
								  $.ajax({
										url: '/fileUpload.dox',
										type: 'POST',
										data: formData,
										processData: false,  
										contentType: false,  
										success: function() {
											alert(message);
										  self.filePreview = "";
										  location.href = "/myshop/refunds";

										},
										error: function(jqXHR, textStatus, errorThrown) {
										  	console.error('업로드 실패!', textStatus, errorThrown);
										}
								  });		
							  } else {
								alert(message);
								location.href = "/myshop/refunds";
							  }		
						}
						
					}
				});
			},
			fnFileChange(event) {
			    const file = event.target.files[0];
			    this.file = file;
			

			    // 파일명이 있으면 표시
			    this.fileName = file.name;

			    // 이미지 파일인 경우 미리보기 표시
			    if (file && file.type.startsWith('image/')) {
			        const reader = new FileReader();
			        reader.onload = (e) => {
			            this.filePreview = e.target.result;
			        };
			        reader.readAsDataURL(file); // 이미지 파일을 읽음
			    } else {
			        this.filePreview = null; // 이미지가 아니면 미리보기 없음
			    }
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
				self.fnGetList();
			});
        }
    });
    app.mount('#app');
</script>