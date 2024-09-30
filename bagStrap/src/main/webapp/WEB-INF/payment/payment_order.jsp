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
	#my-address-container{
		display: flex,
		flex-direction: column
	}
	.address-list-box{
		
	}
	</style>
<body>
	<div id="app">
		<main class="main-container">

	        <div class="content">

				<div id="shipping-information">
					<div>받는 사람 정보</div>
					<hr>
					<label for="user_name">이름:</label>
					<input type="text" id="user_name" name="user_name" v-model="userName" required><br><br>

					<label for="phone">전화번호:</label>
					<input type="text" id="phone" placeholder="01012341234" name="phone" v-model="phone"><br><br>

					<label for="address">배송지 주소:</label>
					<button @click="fnSelectAddress()">주소 선택</button>
					<button @click="fnShowAddress()">나의 배송지 선택</button>
					<input type="text" id="address" placeholder="주소 선택을 통해 선택해주세요" name="address" v-model="address" disabled><br><br>

					<label for="zonecode">우편 번호:</label>
					<input type="number" id="zonecode" name="zonecode" v-model="zonecode" disabled><br><br>

					<label for="address_detail">상세 주소:</label>
					<input type="text" id="address_detail" name="address_detail" v-model="addressDetail"><br><br>
					<label for="defaultYN">기본 배송지로 등록:</label>
					<input type="checkbox" id="defaultYN" name="defaultYN" @change="fnChangeYN('#defaultYN')"><br><br>
					<label for="saveYN">배송지에 추가 하기:</label>
					<input type="checkbox" id="saveYN" name="saveYN" @change="fnChangeYN('#saveYN')"><br><br>

					<label for="reqComment">요청 댓글:</label>
					<textarea id="reqComment" name="reqComment" v-model="reqComment" rows="4" cols="50"></textarea><br><br>

					<label for="entrance_password">공동현관문 비밀번호:</label>
					<input type="text" id="entrance_password" name="entrance_password" v-model="entrancePassword"><br><br>

					<input type="button" @click="fnOrder()" value="주문하기">
			   </div>

				
	        </div>

	    </main>
		
		<dialog id="addressModal" class="headerLoginModal round">
		    <div class="rightCloseBtn" onclick="document.getElementById('addressModal').close()">
				<a href="javascript:;"  class="closeBtn">
		        	<svg class="closeBtn" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="gray"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg>
				</a>
		    </div>     
		    <div id="addressBox">
		     <span id="myAddressTitle">내 주소</span>
					<div id="my-address-container">
						<div class="address-list-box" v-for="(item, index) in myAddressList" :key="index">
							<div id="defaultStatus">
								<div v-if="item.defaultYN==='Y'">
									기본배송지
								</div>
								<div v-else>
									<a href="javascript:;" @click="changeDefaultYN(item.addressNo)">기본 배송지로 변경하기</a>
								</div>
							</div>
							<a href="javascript:;" @click="updateSaveYN(item.addressNo, item.defaultYN)">배송지에서 제외하기</a>
							<a href="javascript:;" @click="fnChoiceAddress(index)">
								<div id="userName">
									받는사람 : {{item.userName}}
								</div>
								<div id="userAddress">
									배송지 주소 : {{item.address}}
								</div>
								<div id="userAddressDetail">
									배송지 주소 : {{item.addressDetail}}
								</div>
							</a>		
						</div>
					</div>
		    </div>
		</dialog>
		
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
				reqComment: '',
				entrancePassword: '',
				addressNo: 0,
				imp : "",
				userName: "",
				phone: "",
				myAddressList: [],
				response : {
				},
				data : {
					storeId: "${store_id}",
					 // 채널 키 설정
					 channelKey: "${CHANNEL_KEY}",
					 paymentId: ``,
					 orderName: "현이의 가방끈",
					 totalAmount: 0,
					 currency: "CURRENCY_KRW",
					 payMethod: "CARD",
					 customer: {
				       fullName: "${FULLNAME}",
				       phoneNumber: "${PHONE_NUMBER}",
				       email: "${EMAIL}",
				     },
					 userEmail: "test@portone.io",
 				    userName: "구매자이름",
 				    phone: "010-1234-5678", //필수 파라미터 입니다.
				}
            };
        },
        methods: {
			fnMyAddress(){
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url:"/selectMyAddress.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if("data.result"){
							self.myAddressList = data.addressList;

						}
						
					}
				});
			},
			fnSelectAddress(){
				var self = this;
				self.addressNo = 0;

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
				if(!self.userName){
					alert("이름을 입력해주세요");
					return;
				} else if(!self.phone){
					alert("휴대폰 번호를 입력해주세요");
					return;
				} else if(self.phoneNumberCheck(self.phone) == false){
					alert("올바른 휴대폰 번호를 입력하세요")
					return;
				} else if(!self.address){
					alert("주소를 선택해주세요");
					return;
				} else if(!self.addressDetail){
					alert("상세주소를 입력해주세요");
					return;
				}
				
				var self = this;
				var nparmap = {
					orderList : JSON.stringify(self.orderList),
					priceSum : self.priceSum, 
					address : self.address,
					zonecode : self.zonecode,
					addressDetail : self.addressDetail,
					addressNo: self.addressNo,
					defaultYN : self.defaultYN,
					saveYN : self.saveYN,
					userName: self.userName,
					phone : self.phone,
					reqComment : self.reqComment,
					entrancePassword : self.entrancePassword
				};
				$.ajax({
					url:"/order.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						
						if(data.result){
							self.data.totalAmount = +data.totalAmount;
							self.data.paymentId = data.userId +'_'+ Date.now();
							self.data.userName = data.userName;
							self.data.userEmail = data.userEmail;
							self.data.phone = data.phone;
							self.addressNo = data.addressNo;
						//	self.fnImp();
							self.imp = 'rsp.imp_uid';
							self.completeOrder();
						} else {
							alert(data.message);
						}
					}
				});
			},
			fnImp(){
				var self = this;
				IMP.request_pay(
				  {
				    pg: "html5_inicis.${IMP_UID}", //테스트 시 html5_inicis.INIpayTest 기재
				    pay_method: "card",
				    merchant_uid: self.data.paymentId, //상점에서 생성한 고유 주문번호
				    name: "현이의 가방끈",
				    amount: self.data.totalAmount,
				    buyer_email: self.data.userEmail,
				    buyer_name: self.data.userName,
				    buyer_tel: self.data.phone, //필수 파라미터 입니다.
				    buyer_addr: self.address + self.address_detail,
				    buyer_postcode: self.zonecode,
				  },
				  function (rsp) {
					console.log(rsp);
					if(rsp.success){
						self.imp = rsp.imp_uid;
						self.completeOrder();
					}
					
				  },
				);
			},
			completeOrder(){
				var self = this;
				$.ajax({
					url:"/completeOrder.dox",
					dataType:"json",	
					type : "POST", 
					data : {
						orderId : self.data.paymentId,
						orderList : JSON.stringify(self.orderList),
						addressNo : self.addressNo,
						imp : self.imp
					},
					success : function(data) { 
						console.log(data);
						alert(data.message);
						$.pageChange("/payment/complete", {orderId: self.data.paymentId, orderList: self.orderList, priceSum: self.priceSum})
					}
				});
			},
			fnRefund(){
				var self = this;
				var nparmap = {
					imp : 'imp_925969653488',
					amount : '21600' 	
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
					if(self.myAddressList.length >= 10){
						document.querySelector(flg).checked = false;
						alert("저장 가능한 배송지의 개수는 최대 10개입니다. 삭제 후 적용해주세요.")
					} else if(flg === '#defaultYN'){
						document.querySelector("#saveYN").checked = true;
					}
				self.defaultYN = document.querySelector("#defaultYN").checked ? 'Y' : 'N'
				self.saveYN = document.querySelector("#saveYN").checked ? 'Y' : 'N'

			},
			fnShowAddress(){
				document.getElementById('addressModal').showModal();				
			},
			phoneNumberCheck(number){
				    let result = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
				    return result.test(number);
			},
			fnChoiceAddress(idx){
				var self=this;
				self.address  = self.myAddressList[idx].address ;
				self.zonecode  = self.myAddressList[idx].zonecode ;
				self.addressDetail  = self.myAddressList[idx].addressDetail ;
				self.addressNo  = self.myAddressList[idx].addressNo ;
				self.phone  = self.myAddressList[idx].phone ;
				self.reqComment  = self.myAddressList[idx].reqComment ;
				self.entrancePassword  = self.myAddressList[idx].entrancePassword ;
				self.userName = self.myAddressList[idx].userName ;

				if(self.myAddressList[idx].defaultYN === 'Y') {
					document.querySelector("#defaultYN").checked = true;
				} else {
					document.querySelector("#defaultYN").checked = false;
				}
				document.querySelector("#saveYN").checked = true;
				self.defaultYN = document.querySelector("#defaultYN").checked ? 'Y' : 'N'
				self.saveYN = document.querySelector("#saveYN").checked ? 'Y' : 'N'				
				document.getElementById('addressModal').close();
			},			
			changeDefaultYN(addressNo){
				var self = this;
				var nparmap = {
					addressNo : addressNo 	
				};
				$.ajax({
					url:"/changeDefaultYN.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.fnMyAddress();
						alert(data.message);
						
					}
				});
			},
			updateSaveYN(addressNo, defaultYN){
				var self = this;
				alert(typeof defaultYN)
				if(defaultYN === 'Y'){
					alert('기본 배송지는 제거할 수 없습니다.');
					return;
				}
				var nparmap = {
					addressNo : addressNo 	
				};
				$.ajax({
					url:"/updateSaveYN.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.fnMyAddress();
						alert(data.message);
					}
				});
			}
			
			
			
        },
        mounted() {
            var self = this;
			self.fnMyAddress();
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