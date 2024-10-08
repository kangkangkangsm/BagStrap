<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

	<title>첫번째 페이지</title>
</head>
<style>
	
	</style>
<body>
	<div id="app">
		<main class="main-container">
			
	        <aside class="sidebar">
	            
				
				
				
	        </aside>
			
	        <div class="content">
				<button @click="fnImp()"> 결제하기 </button>
				<button @click="fnRefund()"> 환불하기 </button>
	        </div>
			


	    </main>

	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>
<script>
	

    const app = Vue.createApp({
        data() {
            return {
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
			fnOrder(){
				var self = this;
				var nparmap = {
					bookList : [], 
					// paymentId : orderId,
					// totalAmount: PriceSum,
					// merchang_uid : orderId
					// buyer_email: userEmail,
					// buyer_name: userId,
					// buyer_tel: userInfo,
					// buyer_addr: userAddr,
					// buyer_postcode: "123-456",
				};
				$.ajax({
					url:"itemList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						
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
						
					}
				});
			}
        },
        mounted() {
            var self = this;
			IMP.init("imp11730175"); 
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					self.isLogin = false;
				};
				self.fnGetList();	
			})
        }
    });
    app.mount('#app');
</script>