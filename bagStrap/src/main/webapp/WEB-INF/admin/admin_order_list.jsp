<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<style>
		.admin-order-list {
		    width: 100%;
		    max-width: 1200px;
		    margin: 0 auto;
		}
		.admin-order-item {
		    background: #fff;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		    margin-bottom: 10px;
		    padding: 10px 15px;
		}
		.admin-order-header {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    width: 100%;
		}
		.admin-order-id {
		    font-size: 16px;
		    font-weight: bold;
		    margin-right: 15px;
		}
		.admin-order-info {
		    font-size: 14px;
		    color: #555;
		}
		.admin-order-status {
		    text-align: right;
		    font-size: 14px;
		    color: #333;
		}
		.admin-refund-indicator {
		    color: #dc3545;
		    font-weight: bold;
		    margin-left: 15px;
		}
		.admin-item-list {
		    display: flex;
		    justify-content: space-between;
		    padding: 10px 0;
		    border-bottom: 1px solid #ddd;
		}
		.admin-item-info {
		    display: flex;
		    align-items: center;
		    width: 60%;
		}
		.admin-item-info img {
		    width: 50px;
		    height: 75px;
		    margin-right: 10px;
		    border: 1px solid #ddd;
		    border-radius: 3px;
		}
		.admin-item-title {
		    font-weight: bold;
		    font-size: 14px;
		}
		.admin-refund-status {
		    width: 15%;
		    text-align: center;
		    font-weight: bold;
		}
		.admin-radio-group {
		    width: 25%;
		    display: flex;
		    justify-content: space-around;
		    align-items: center;
		}
		.admin-radio-label {
		    display: flex;
		    align-items: center;
		    cursor: pointer;
		    margin-right: 10px;
		}
		.admin-radio-label input[type="radio"] {
		    display: none;
		}
		.admin-radio-custom {
		    width: 18px;
		    height: 18px;
		    border: 2px solid #007bff;
		    border-radius: 50%;
		    margin-right: 5px;
		    transition: background 0.3s ease;
		}
		.admin-radio-label input[type="radio"]:checked + .admin-radio-custom {
		    background: #007bff;
		}
		.admin-submit-btn {
		    background-color: #28a745;
		    color: white;
		    border: none;
		    padding: 8px 16px;
		    cursor: pointer;
		    border-radius: 4px;
		    font-weight: bold;
		}
		.admin-submit-btn:hover {
		    background-color: #218838;
		}
		.order-summary {
		    cursor: pointer;
		    font-weight: bold;
		    font-size: 14px;
		    color: #007bff;
		    display: block;
		}
		.order-summary::-webkit-details-marker {
		    display: none;
		}
		.details-content {
		    padding: 15px;
		    background-color: #f7f7f7;
		    border-left: 4px solid #007bff;
		    margin-top: 10px;
		}
		.admin-order-status-wrapper {
		    display: flex;
		    align-items: center;
		    justify-content: flex-end;
		    width: 40%;
		}
		/* Reject Comment 영역 */
		.admin-reject-comment {
		    width: 60%;
		    font-size: 12px;
		    color: #dc3545;
		    margin-top: 5px;
		}
		/* Modal Dialog */
		.admin-dialog-overlay {            
		    width: 100%;
		    height: 100%;
		    background: rgba(0, 0, 0, 0.5);
		    justify-content: center;
		    align-items: center;
		}
		.admin-dialog {
		    margin:  auto;
		    background: white;
		    padding: 20px;
		    border-radius: 5px;
		    width: 400px;
		    max-width: 80%;
		}
		.admin-dialog h3 {
		    margin-top: 0;
		}
		.admin-dialog textarea {
		    width: 100%;
		    height: 80px;
		    margin-bottom: 20px;
		}
		.admin-dialog-btn {
		    background-color: #007bff;
		    color: white;
		    border: none;
		    padding: 8px 16px;
		    cursor: pointer;
		    border-radius: 4px;
		    font-weight: bold;
		}
		.admin-dialog-btn:hover {
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

					<select v-model="pageSize" @change="fnGetList(1)">
						<option value="5">5개씩</option>	
						<option value="10">10개씩</option>	
						<option value="20">20개씩</option>	
					</select>

					<div class="admin-order-list">

					    <!-- 주문 1: 환불 신청된 주문 -->
					    <details class="admin-order-item" v-for="(items,orderId) in groupedByDate" :key="orderId">
					        <summary class="order-summary">
					            <div class="admin-order-header">
					                <span class="admin-order-id">Order ID: {{orderId}}</span>
					                <span class="admin-order-info">총 금액: {{priceSum[orderId]}}</span>
					                <div class="admin-order-status-wrapper">
					                    <span class="admin-order-status">
											<a href="javascript:;" @click="updateStatus(items[0].orderId)"> {{items[0].status}}</a>
											 | {{items[0].orderDate}}
										 </span>
					                    <div class="admin-refund-indicator" v-if="items[0].refundId != null && items[0].refundId != undefined && items[0].refundStatus === '환불 대기'">환불 신청 있음</div>
					                </div>
					            </div>
					        </summary>
							<div class="admin-item-list">
								환불 사유 : 
								<template v-if="items[0].reason">
								    <div>{{items[0].reason}}</div>
								</template>
								<template v-if="items[0].filePath">
								    <img style="width:300px; height:300px;" :src="items[0].filePath">
								</template>			                
							</div>
					        <div class="details-content" v-for="(item,index) in items" :key="item.bookId">
								
					            <div class="admin-item-list">
					                <div class="admin-item-info">
					                    <img :src="item.image" :alt="item.title">
					                    <div>
					                        <div class="admin-item-title">{{item.title}}</div>
					                        <div>수량: {{item.quantity}} | 가격: {{item.price}}원</div>

					                    </div>
					                </div>
					                
					            <!-- Reject Comment 표시 공간 -->
					            <div class="admin-reject-comment" id="reject-comment-item-1" v-model="item.rejectComment">{{item.rejectComment}}</div>
								<div  v-if="items[0].refundId != null && items[0].refundId != undefined">환불 수량: {{item.refundQuantity}}</div>
				                <div class="admin-refund-status"  v-if="items[0].refundId != null && items[0].refundId != undefined">{{item.refundStatus}}</div>
				                <div class="admin-radio-group"  v-if="items[0].refundId != null && items[0].refundId != undefined">
				                    <label class="admin-radio-label">
				                        <input type="radio" :name="index" v-model="item.refundStatus" value="승인됨"@click="acceptRefund(item.bookId, items[0].orderId)">
				                        <div class="admin-radio-custom"></div>Accept
				                    </label>
				                    <label class="admin-radio-label">
				                        <input type="radio" :name="index" v-model="item.refundStatus" value="거절됨" @click="openRejectDialog(item.bookId, items[0].orderId)">
				                        <div class="admin-radio-custom"></div>Reject
				                    </label>
				                </div>
				            </div>

					        </div>
							<!-- 일괄 제출 버튼 -->
				            <div style="text-align: center; margin-top: 20px;"  v-if="items[0].refundId != null && items[0].refundId != undefined">
				                <button type="button" class="admin-submit-btn" @click="finishRefundApplication(items[0].orderId)">환불 처리</button>
				            </div>
					    </details>

					</div>

					<!-- Reject Reason Modal -->
					<dialog class="admin-dialog-overlay" id="admin-dialog-overlay">
					    <div class="admin-dialog">
					        <h3>Reject Reason</h3>
					        <textarea id="reject-reason" v-model="comment" placeholder="Write your reason for rejecting the item..."></textarea>
					        <button class="admin-dialog-btn" @click="submitRejectReason()">Submit</button>
					    </div>
					</dialog>
					<button v-if="currentPage > 1" @click="fnGetList(currentPage - 1)">이전</button>
				    <button v-for="page in pagesToShow" :class="{active: page == currentPage}" @click="fnGetList(page)">
				        {{ page }}
				    </button>
				    <button v-if="currentPage < totalPages" @click="fnGetList(currentPage + 1)">다음</button>
				
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
				isLogin : false,
                isAdmin : false,
				orderList: [],
				comment: '',
				svaedBookId:0,
				orderId:'',
				priceSum: {},
				maxPageDisplay: 10,
				currentPage: 1,
				totalPages: 10,
				pageSize: 10
				
            };
        },
		computed: {
		    groupedByDate() {
				var self = this;
				self.priceSum = {};

		        return self.orderList.reduce((acc, item) => {
		            if (!acc[item.orderId]) {
		                acc[item.orderId] = [];
						self.priceSum[item.orderId] = 0;		            }
					var price = +item.price;
					self.priceSum[item.orderId] += price;
					  
		            acc[item.orderId].push(item);
		            return acc;
		        }, {});
		    },
		  startPage() {
		    // 현재 페이지 기준으로 시작 페이지 계산
		    return Math.floor((this.currentPage - 1) / this.maxPageDisplay) * this.maxPageDisplay + 1;
		  },
		  endPage() {
		    // 끝 페이지 계산 (총 페이지 수를 넘지 않도록 제한)
		    return Math.min(this.startPage + this.maxPageDisplay - 1, this.totalPages);
		  },
		  pagesToShow() {
		    // 시작 페이지부터 끝 페이지까지 배열 생성
		    let pages = [];
		    for (let i = this.startPage; i <= this.endPage; i++) {
		      pages.push(i);
		    }
		    return pages;
		  }
		},
        methods: {
			fnGetList(currentPage){
				var self = this;
				var nparmap = {
				currentPage: currentPage, 
				pageSize: self.pageSize
				};
				$.ajax({
					url:"/adminOrderList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.orderList){
							self.orderList = data.orderList;
							self.currentPage = currentPage;
							self.totalPages = data.totalPages;
							
						}
					}
				});
			},
			updateStatus(orderId){
				var self = this;
				var nparmap = {
					orderId : orderId
				};
				$.ajax({
					url:"/updateOrderStatus.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.fnGetList(self.currentPage);
					}
				});
			},
			finishRefundApplication(orderId){
				var self = this;
				const allChecked = this.groupedByDate[orderId].every(item => item.refundStatus !== "환불 대기");
				if (!allChecked) {
				           alert("모든 항목에 대해 환불 상태를 선택해야 합니다."); // 체크되지 않은 경우 경고
				           return;
				       }
				var list = self.orderList.filter(item => {
					return item.orderId === orderId;
				})
				var nparmap = {
					refundId : list[0].refundId,
					imp : list[0].imp,
					orderList: JSON.stringify(list)
				};
				$.ajax({
					url:"/finishRefundApplication.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.body.message);
					}
				});
			},
			openRejectDialog(bookId,orderId) {
			    // 모달 열기
				var self = this;

			    document.getElementById('admin-dialog-overlay').showModal() ;
				self.svaedBookId = bookId;
				self.orderId = orderId;
			},
			submitRejectReason(itemId) {
				var self = this;
				const item = self.orderList.find(orderItem => orderItem.bookId === self.svaedBookId && orderItem.orderId === self.orderId);
				item.rejectComment = self.comment;

			    // 모달 닫기 및 입력 필드 초기화
				self.comment = ''
				self.svaedBookId = '';
			    document.getElementById('admin-dialog-overlay').close();
			},
			acceptRefund(bookId,orderId){
				var self = this;
				self.svaedBookId = bookId;
				self.orderId = orderId;
				
				const item = self.orderList.find(orderItem => orderItem.bookId === self.svaedBookId && orderItem.orderId === self.orderId);

				item.rejectComment = '';
			    // 모달 닫기 및 입력 필드 초기화
				self.comment = ''
			}
        },
        mounted() {
            var self = this;
			self.fnGetList(self.currentPage);
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					self.isLogin = false;
				};
				self.fnGetList(self.currentPage);	
			});
			window.addEventListener('adminStatusChanged', function(){
				if(window.sessionStorage.getItem("isAdmin") === 'true'){
					self.isAdmin = true;	
				} else{
					self.isAdmin = false;
				};
				self.fnGetList(self.currentPage);	
			})
        }
    });
    app.mount('#app');
</script>