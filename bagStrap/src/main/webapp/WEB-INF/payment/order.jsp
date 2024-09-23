<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<title>첫번째 페이지</title>
</head>
<style>
	
	</style>
<body>
	<div id="app">
		<main class="main-container">

			
			   
			
	        <div class="content">
				{{priceSum}}
				{{orderList}}
				{{defaultYN}}
				<div id="shipping-information">
					<div>받는 사람 정보</div>
					<hr>
					<label for="user_name">이름:</label>
					<input type="text" id="user_name" name="user_name" v-model="name" required><br><br>

					<label for="phone">전화번호:</label>
					<input type="text" id="phone" name="phone" v-model="phone"><br><br>

					<label for="address">배송지 주소:</label>
					<button @click="fnSelectAddress()">주소 선택</button>
					<input type="text" id="address" name="address" v-model="address" disabled><br><br>

					<label for="zonecode">우편 번호:</label>
					<input type="number" id="zonecode" name="zonecode" v-model="zonecode" disabled><br><br>

					<label for="address_detail">상세 주소:</label>
					<input type="text" id="address_detail" name="address_detail" v-model="addressDetail"><br><br>

					<label for="defaultYN">기본 배송지 여부:</label>
					<input type="checkbox" id="defaultYN" name="defaultYN" @change="fnChangeYN('default')"><br><br>
					<label for="saveYN">기본 배송지 여부:</label>
					<input type="checkbox" id="saveYN" name="saveYN" @change="fnChangeYN('save')"><br><br>

					<label for="reqComment">요청 댓글:</label>
					<textarea id="reqComment" name="reqComment" v-model="reqComment" rows="4" cols="50"></textarea><br><br>

					<label for="entrance_password">공동현관문 비밀번호:</label>
					<input type="text" id="entrance_password" name="entrance_password" v-model="entrancePassword"><br><br>

					<input type="button" @click="fnOrder()" value="주문하기">

			   </div>

				
	        </div>
			<aside class="sidebar">
				<button @click="fnImp()"> 결제하기 </button>
				<button @click="fnRefund()"> 환불하기 </button>
	        </aside>


	    </main>

	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>
<script>
	

    const app = Vue.createApp({
        data() {
            return {
				orderList : JSON.parse('${orderList}'),
				priceSum : '${priceSum}',
				address : '',
				address_detail : '',
				zonecode : '', 
				defaultYN: 'N',
				saveYN: 'N',
				response : {
				},
				data : {
					storeId: "${store_id}",
					 // 채널 키 설정
					 channelKey: "${CHANNEL_KEY}",
					 paymentId: `payment-202405231417002`,
					 orderName: "현이의 가방끈",
					 totalAmount: 1000,
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
			fnSelectAddress(){
				var self = this;
				new daum.Postcode({
			        oncomplete: function(data) {
						console.log(data);
						self.address = data.address;
						self.zonecode = data.zonecode;
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			        }
			    }).open();
			},
			fnOrder(){
				//TODO 정규식 체크해야함

				var self = this;
				var nparmap = {
					orderList : JSON.stringify(self.orderList),
					priceSum : self.priceSum, 
					userName : self.name,
					phone: self.phone,
					address : self.address,
					zonecode : self.zonecode,
					addressDetail : self.addressDetail,
					defaultYN : self.defaultYN,
					saveYN : self.saveYN,
					reqComment : self.reqComment,
					entrancePassword : self.entrancePassword

					// orderTable
					// paymentId : orderId,
					// merchang_uid : orderId,

					// bookTable
					// totalAmount: PriceSum,

					// userSession
					// buyer_email: userEmail,
					// buyer_name: userId,
					// buyer_tel: userInfo,

					// addressTable
					// buyer_addr: userAddr,
					// buyer_postcode: "123-456",
					
				};
				$.ajax({
					url:"/order.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
						
						if(data.result){
							self.fnImp();
						}
					}
				});
			},
			fnImp(){
				IMP.request_pay(
				  {
				    pg: "html5_inicis.${IMP_UID}", //테스트 시 html5_inicis.INIpayTest 기재
				    pay_method: "card",
				    merchant_uid: "order_no_0005", //상점에서 생성한 고유 주문번호
				    name: "주문명:결제테스트",
				    amount: 1004,
				    buyer_email: "test@portone.io",
				    buyer_name: "구매자이름",
				    buyer_tel: "010-1234-5678", //필수 파라미터 입니다.
				    buyer_addr: "서울특별시 강남구 삼성동",
				    buyer_postcode: "123-456",
				  },
				  function (rsp) {
					console.log(rsp)
				    // callback 로직
				    //* ...중략... *//
				  },
				);
			}
			,
			fnRefund(){
				var self = this;
				var nparmap = {
					
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
			},
			fnChangeYN(flg){
				var self = this;
				if(flg === 'default'){
					if(self.defaultYN === 'Y'){
						self.defaultYN = 'N'
					} else {
						self.defaultYN = 'Y'
					}	
				} else{
					if(self.saveYN === 'Y'){
						self.saveYN = 'N'
					} else {
						self.saveYN = 'Y'
					}
				}
				
			}
        },
        mounted() {
            var self = this;
			IMP.init("imp11730175"); 
        }
    });
    app.mount('#app');
</script>