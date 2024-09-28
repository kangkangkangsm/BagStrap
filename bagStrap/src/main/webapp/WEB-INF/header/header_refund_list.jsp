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
		.refund-list-container {
		  width: 80%;
		  margin: 20px auto;
		  border: 1px solid #ddd;
		  border-radius: 8px;
		}

		.refund-list-item {
		  display: flex;
		  justify-content: space-between;
		  padding: 15px;
		  border-bottom: 1px solid #ddd;
		}

		.refund-list-item:last-child {
		  border-bottom: none;
		}

		.refund-list-info {
		  flex: 2;
		}

		.refund-list-dates {
		  font-size: 14px;
		  color: #777;
		}

		.refund-list-description {
		  margin-top: 8px;
		}

		.refund-list-description p {
		  margin: 0;
		  font-weight: 500;
		  line-height: 1.5;
		}

		.refund-list-quantity,
		.refund-list-status {
		  flex: 1;
		  text-align: center;
		}

		.refund-list-quantity p,
		.refund-list-status p {
		  margin: 5px 0;
		}

		.refund-list-details-button {
		  padding: 6px 10px;
		  background-color: #007bff;
		  color: white;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		  transition: background 0.3s ease;
		}

		.refund-list-details-button:hover {
		  background-color: #0056b3;
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


				<div class="refund-list-container">
				  <div class="refund-list-item" v-for="(item, index) in refundList" :key="index">
				    <div class="refund-list-info">
				      <div class="refund-list-dates">
				        <span>취소접수일: {{ item.createdDate }}</span> |
				        <span>주문일: {{ item.orderDate }}</span>
				      </div>
				      <div class="refund-list-description">
				        <p>{{ item.bookId }}</p>
				        <!--<p>{{ item.productDetail }}</p>-->
				      </div>
				    </div>
				    <div class="refund-list-quantity">
				      <p>{{ item.quantity }}개</p>
<!--				      <p>{{ item.price }}원</p>
-->				    </div>
				    <div class="refund-list-status">
				      <p>{{ item.status }}</p>
				      <!--<p>{{ item.refundMethod }}</p>-->
					  <button class="refund-list-details-button" @click="openDialog(item)">취소상세</button>
				    </div>
				  </div>
				</div>


				<!-- 다이얼로그 태그 -->
				<dialog class="refund-dialog" ref="refundDialog">
				  <div class="refund-dialog-content">
				    <!-- 책 이미지 및 정보 -->
				    <div class="refund-dialog-book-info">
				      <img :src="selectedItem.img" alt="책 이미지" class="refund-dialog-book-image">
				      <div class="refund-dialog-book-details">
				        <h3>{{ selectedItem.productName }}</h3>
				        <p class="refund-dialog-author">저자: {{ selectedItem.author }}</p>
				        <p class="refund-dialog-cancel-reason">취소 사유: {{ selectedItem.cancelReason }}</p>
				        <p class="refund-dialog-cancel-date">취소 일자: {{ selectedItem.cancelDate }}</p>
				      </div>
				    </div>
				    
				    <!-- 환불 상태 -->
				    <div class="refund-dialog-status">
				      <h4>환불 정보</h4>
				      <p>환불 상태: {{ selectedItem.status }}</p>
				      <p>환불 완료 예정일: {{ selectedItem.refundMethod }}</p>
				    </div>

				    <!-- 닫기 버튼 -->
				    <button @click="closeDialog" class="refund-dialog-close-button">닫기</button>
				  </div>
				</dialog>
			
			
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
				isLogin : true,
				refundList: []
				
				}
				
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					orderId : self.orderId
				};
				$.ajax({
					url:"/refundList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.refundList = data.refundList;
						console.log(data);
					}
				});
            },
			openDialog(item) {
			  this.selectedItem = item;
			  this.$refs.refundDialog.showModal();
			},
			closeDialog() {
			  this.$refs.refundDialog.close();
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