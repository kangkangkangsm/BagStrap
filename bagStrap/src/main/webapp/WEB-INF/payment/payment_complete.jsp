<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<style>

		.payment-complete-left-container, .payment-complete-right-container {
		    flex: 1;
		    padding: 20px;
		    box-sizing: border-box;
		}

		.payment-complete-left-container {
		    border-right: 1px solid #ddd;
		}

		.payment-complete-thank-you-message {
		    text-align: center;
		    font-size: 24px;
		    font-weight: bold;
		    margin-bottom: 20px;
		    color: #333;
		}

		.payment-complete-order-summary {
		    border: 1px solid #ddd;
		    border-radius: 5px;
		    background-color: #fff;
		    padding: 20px;
		    margin-bottom: 20px;
		}

		.payment-complete-ordered-list {
		    list-style-type: none;
		    padding: 0;
		}

		.payment-complete-ordered-list-item {
		    display: flex;
		    justify-content: space-between;
		    margin-bottom: 15px;
		    border-bottom: 1px solid #eee;
		    padding-bottom: 10px;
		}

		.payment-complete-ordered-list-item img {
		    width: 60px;
		    height: 80px;
		    margin-right: 10px;
		}

		.payment-complete-recommended-study {
		    border: 1px solid #ddd;
		    border-radius: 5px;
		    background-color: #fff;
		    padding: 20px;
		}

		.payment-complete-recommended-study-title {
		    font-size: 20px;
		    font-weight: bold;
		    margin-bottom: 15px;
		    color: #333;
		}

		.payment-complete-study-list {
		    list-style-type: none;
		    padding: 0;
		}

		.payment-complete-study-list-item {
		    margin-bottom: 10px;
		}

		.payment-complete-study-list-item a {
		    text-decoration: none;
		    color: #007bff;
		}

		.payment-complete-study-list-item a:hover {
		    text-decoration: underline;
		}

		.payment-complete-study-description {
		    font-size: 14px;
		    color: #666;
		}

		.payment-complete-study-date {
		    font-size: 12px;
		    color: #999;
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
					
					
					<div class="payment-complete-left-container">
					          <div class="payment-complete-thank-you-message">구매해주셔서 감사합니다!</div>

					          <div class="payment-complete-order-summary" >
								<h2>주문 번호 : {{orderId}}</h2>
								<h2>구매 가격 : {{priceSum}}</h2>
					              <ul class="payment-complete-ordered-list" v-for="item in orderList">
					                  <li class="payment-complete-ordered-list-item">
										<a href="javascript:;" @click="goToDetail('book', item.bookId)">
					                      <img :src="item.image" :alt="item.title">
					                      <div>
					                          <strong>{{item.title}}</strong>
					                          <div>가격: {{item.price}}원</div>
					                          <div>수량: {{item.quantity}}</div>
					                      </div>
									    </a>
					                  </li>
					                  <!-- 추가 주문 항목이 있다면 여기에 추가 -->
					              </ul>
					          </div>
					      </div>

					      <div class="payment-complete-right-container">
					          <div class="payment-complete-recommended-study">
					              <h2 class="payment-complete-recommended-study-title">이런 스터디에 가입해보세요!</h2>
					              <ul class="payment-complete-study-list">
					                  <li class="payment-complete-study-list-item" v-for="item in studyList">
										<a href="javascript:;" @click="goToDetail('study', item.studyGroupId)">
											<div>
												<template v-if="item.filePath">
													<img style="width: 100px; height: 100px" :src="item.filePath" alt="Product Image" class="">
												</template>
												<template v-else>
													<img style="width: 100px; height: 100px" src="../src/profile.png" alt="Product Image" class="">
												</template>					                      <a href="#">{{item.studyName}}</a>
						                        <div class="payment-complete-study-description">{{item.description}}</div>
										  <div>
									  	</a>
					                  </li>
					                  <!-- 추가 스터디 항목이 있다면 여기에 추가 -->
									  <a href="javascript:;" @click="goToDetail('','')">
										더 많은 스터디를 보고싶다면?
										</a>
					              </ul>
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
				isLogin : false,
				orderList: [],
				studyList: [],
				priceSum: '${priceSum}',
				orderId: '${orderId}',
				
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url:"/selectOrderComplete.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.selectOrderComplete){
						self.orderList = data.selectOrderComplete;
						self.studyList = data.selectOrderCompleteStudy;

							
						}

					}
				});
            },
			goToDetail(str, id){
				if(str === 'book'){
					$.pageChange("/shop/detail", {bookId:id})
				} else if(str === 'study'){
					$.pageChange("/study-group-detail", {boardNo:id})
				} else {
					$.pageChange("/study-group-list", {subjectTypeId: 2000})
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
					self.isLogin = false;
				};
				self.fnGetList();	
			});
			window.addEventListener('adminStatusChanged', function(){
				if(window.sessionStorage.getItem("isAdmin") === 'true'){
					self.isAdmin = true;	
				} else{
					self.isAdmin = false;
				};
				self.fnGetList();	
			})
        }
    });
    app.mount('#app');
</script>