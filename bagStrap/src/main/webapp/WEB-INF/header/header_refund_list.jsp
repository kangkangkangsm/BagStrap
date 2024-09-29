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
		/* 다이얼로그 콘텐츠 - Flexbox 레이아웃으로 변경 */
		.refund-dialog-content {
		  background: #ffffff;
		  padding: 20px;
		  border-radius: 10px;
		  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
		  max-width: 800px; /* 다이얼로그의 가로 크기를 늘려서 한 줄 배치 */
		  margin: 0 auto;
		  display: flex; /* Flexbox 레이아웃으로 설정 */
		  align-items: center; /* 세로 가운데 정렬 */
		  gap: 20px; /* 각 섹션 간격 */
		}

		/* 책 이미지 및 정보 배치 */
		.refund-dialog-book-info {
		  display: flex;
		  align-items: center;
		  gap: 20px; /* 이미지와 텍스트 사이 간격 */
		  flex: 2;
		}

		/* 책 이미지 */
		.refund-dialog-book-image {
		  width: 120px;
		  height: 160px;
		  border-radius: 5px;
		  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		}

		/* 책 상세 정보 */
		.refund-dialog-book-details {
		  display: flex;
		  flex-direction: column;
		  justify-content: space-between;
		}

		.refund-dialog-book-details h3 {
		  margin: 0 0 5px 0;
		  font-size: 18px;
		}

		.refund-dialog-book-details p {
		  margin: 2px 0;
		  font-size: 14px;
		  color: #555;
		}

		/* 환불 상태 스타일 */
		.refund-dialog-status {
		  border-left: 1px solid #ddd; /* 구분선 추가 */
		  padding-left: 15px; /* 왼쪽 여백 추가 */
		  flex: 1;
		}

		.refund-dialog-status h4 {
		  margin: 0;
		  font-size: 16px;
		  color: #333;
		}

		.refund-dialog-status p {
		  margin: 5px 0;
		  font-size: 14px;
		  color: #666;
		}

		/* 닫기 버튼 스타일 */
		.refund-dialog-close-button {
		  background-color: #007bff;
		  color: white;
		  border: none;
		  padding: 10px 15px;
		  border-radius: 5px;
		  cursor: pointer;
		  margin-top: 10px;
		  transition: background-color 0.3s;
		}

		.refund-dialog-close-button:hover {
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
				<div class="refund-list-container" v-for="(items, key) in groupedByRefundId" :key="key">
					<div class="refund-list-dates">
				        <span>취소접수일: {{ items[0].createdDate }}</span> |
						<span>주문일: {{ items[0].orderDate }}</span>
						<div>주문번호: {{ items[0].refundId }}</div>
				    </div>
				  <div class="refund-list-item">

					 <div class="refund-list-info">
				     
				      <div class="refund-list-description" v-for="item in items">
				        <p>{{ item.title }}</p>
				      </div>
				    </div>
				    <div class="refund-list-quantity" v-for="item in items">
				      <p>{{ item.quantity }}개</p>
				      <p>{{ item.price }}원</p>
				    </div>
				    <div class="refund-list-status">
				      <p>{{ items[0].status }}</p>
				      <!--<p>{{ item.refundMethod }}</p>-->
					  <button class="refund-list-details-button" @click="openDialog(items)">취소상세</button>
				    </div>
				  
				</div>
				</div>


				<!-- 다이얼로그 태그 -->
				<dialog class="refund-dialog round" ref="refundDialog">
					<div class="rightCloseBtn" @click="closeDialog">
						<a href="javascript:;"  class="closeBtn">
				        	<svg class="closeBtn" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="gray"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg>
						</a>
				    </div> 
				  <div class="refund-dialog-content" v-for="item in selectedItem">
				    <!-- 책 이미지 및 정보 -->
				    <div class="refund-dialog-book-info">
				      <img :src="item.image" alt="책 이미지" class="refund-dialog-book-image">
				      <div class="refund-dialog-book-details">
				        <h3>{{ item.title }}</h3>
						<p>{{ item.description }}</p>
				        <p class="refund-dialog-author">저자: {{ item.author }}</p>
				        <p class="refund-dialog-cancel-reason">취소 사유: {{ item.refundReason }}</p>
				        <p class="refund-dialog-cancel-date">취소 일자: {{ item.refundDate }}</p>
				      </div>
				    </div>
				    
				    <!-- 환불 상태 -->
				    <div class="refund-dialog-status">
				      <h4>환불 정보</h4>
				      <p>환불 상태: {{ selectedItem.status }}</p>
<!--				      <p>환불 완료 예정일: {{ selectedItem.refundMethod }}</p>
-->				    </div>

				  </div>
				  <!-- 닫기 버튼 -->
			    	<button @click="closeDialog" class="refund-dialog-close-button">닫기</button>
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
				isLogin : true,
				refundList: [],
				selectedItem: [],
				currentPage: 1,
				totalPages: 1,
				pageSize: 10,
				maxPageDisplay: 10
				
				}
				
        },
		computed: {
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
			  },
			groupedByRefundId() {
				var self = this;
		        return self.refundList.reduce((acc, item) => {
		            if (!acc[item.refundId]) {
		                acc[item.refundId] = [];
		            }
		            acc[item.refundId].push(item);
		            return acc;
		        }, {});
		    }
		},
        methods: {
            fnGetList(currentPage){
				var self = this;
				var nparmap = {
					orderId : self.orderId,
					currentPage: currentPage, 
					pageSize: self.pageSize
				};
				$.ajax({
					url:"/refundList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.refundList){
							self.refundList = data.refundList;	
							self.currentPage = currentPage;
							self.totalPages = data.totalPages;
						}
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
			self.fnGetList(self.currentPage);
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					alert('로그인하쇼');
					self.isLogin = false;
				};
				self.fnGetList(currentPage);
			});
        }
    });
    app.mount('#app');
</script>