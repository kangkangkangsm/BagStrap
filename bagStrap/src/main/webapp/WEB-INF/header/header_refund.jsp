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
					
					<div>
						<span :style="{ color: progress>0 ? 'blue' : 'black' }"> 1 상품 선택</span>
						<span :style="{ color: progress>1 ? 'blue' : 'black' }"> - 2 사유 선택</span>
						<span :style="{ color: progress>2 ? 'blue' : 'black' }"> - 3 해결방법 선택</span>
					</div>		
					<div class="progress" v-if="progress === 1">			
						<h2>상품을 선택해 주세요</h2>
						<div class="ordered-list-container round">
						    <div class="left-section">
						        <div class="ordered-product" v-for="item in orderList">
									<input type="checkbox" :value="item.bookId" v-model="selectedBooks"/>
						            <img class="ordered-product-image" :src="item.image" :alt="item.title">
									<div class="ordered-product-info">
						                <div class="ordered-product-name">{{item.title}}</div>
						                <div class="ordered-product-detail-info">
						                    <span>{{item.price}}</span> / <span>{{item.quantity}}</span> 
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
						            <label>
						                <input type="radio" name="reason2" :value="item2.reasonId"> {{ item2.reasonText }}
						            </label>
						            
					                <div v-for="item3 in refundReasonList3" :key="item3.reasonId">
										<template v-if="startsWith(item2.reasonId, item3.reasonId)">
					                    		<input class="refundReasonList3" type="radio" name="reason3" :value="item3.reasonId">{{ item3.reasonText }}
										</template>
					                </div>
					            </template>
					        </div>
					    </div>
					</div>
					
					<div class="progress" v-if="progress === 3">			

					</div>

					<div>
						<button @click="progress+=1">다음 단계</button>	
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
				progress : 1,
				orderList : [],
				selectedBooks: [],
				
				refundReasonList1: [],
				refundReasonList2: [],
				refundReasonList3: [],
				selectedReason: '',
				
				
				list : {},
				codeList : {},
				selectedCodes : []
            };
        },
        methods: {
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
						data.refundReasonList.forEach((item) => {
							if(item.reasonId.length === 1){
								self.refundReasonList1.push(item);
							} else if(item.reasonId.length === 2){
								self.refundReasonList2.push(item);							
							} else {
								self.refundReasonList3.push(item);
							}

						});
						self.orderList = data.orderList;
					}
				});
            },
			handleToggle(event){
				console.log(event.target.id);
				self.selectedReason = event.target.id;
			},
			startsWith(prefix, str) {
			  return str.startsWith(prefix);
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
			});
        }
    });
    app.mount('#app');
</script>