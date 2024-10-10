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
		/* 제목 스타일 */
		.shop-list-title-bar {
		    display: flex;
		    margin: 20px auto;
		}

		.shop-list-title {
		    font-size: 30px; /* 원래 크기 30px로 조정 */
		    font-weight: bold;
		    margin: 0px 20px 0px 0px; /* 상단 여백 제거 */
		}

		.study-group-list-search-bar {
			width: 100%;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    margin-bottom: 30px;
		    gap: 15px;
		}

		.study-group-list-search-bar input[type="text"] {
			flex: 1;
			padding: 12px 16px;
			border: 1px solid #ddd;
			border-radius: 10px;
			font-size: 16px;
			transition: border 0.3s;
		}

		.study-group-list-search-bar input[type="text"]:focus {
			border-color: #007bff;
			outline: none;
		}

		.study-group-list-search-bar button {
			background:#343A40;
		   color: #fff;
		   border: none;
		   cursor: pointer;
		   transition: background-color 0.3s;
		   font-size: 1em; /* 글자 크기 조정 */
		}
		.shop-list-search-select {			
		    background: #343A40; /* 색상 통일 */
		    color: #fff;
		    border: none;
		    cursor: pointer;
		    transition: background-color 0.3s;
		    font-size: 1em;
		    padding: 10px;
		    border-radius: 5px;
		}

		.shop-list-search-btn {
		    width: 80px;
		    background: #343A40;
		    color: #fff;
		    border: none;
		    cursor: pointer;
		    transition: background-color 0.3s;
		    font-size: 1em;
		}

		.shop-list-search-btn:hover {
		    background: #2c3237; /* hover 시 색상 변경 */
		}

		/* 환불 내역 스타일 */
		.refund-list-container {
		    width: 100%;
			padding: 10px;
		    margin: 10px 0;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		    background: #f9f9f9;
		}

		/* 리스트 아이템 */
		.refund-list-item {
		    display: flex;
		    justify-content: space-between;
		    padding: 20px;
		    border-bottom: 1px solid #ddd;
		}
		.refund-list-info{
			flex: 3
		}
		.refund-list-description p {
		    margin: 0;
		    font-weight: 500;
		    font-size: 16px;
		}

		.refund-list-quantity,
		.refund-list-status {
		    flex: 1;
		    text-align: center;
		}

		.refund-list-status p {
		    margin: 5px 0;
		}

		.refund-list-details-button {
		    padding: 8px 12px;
		    background-color: #ff7f50;
		    color: white;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    transition: background 0.3s ease;
		}

		.refund-list-details-button:hover {
		    background-color: #e74c3c;
		}

		/* Dialog 스타일 */
		.refund-dialog {
			top: 200px;
		    width: 60%; /* 다이얼로그 너비 설정 */
		    max-width: 900px; /* 최대 너비 제한 */
		    border: 1px solid #ddd; /* 리스트와 같은 테두리 색상 */
		    border-radius: 12px; /* 기존 리스트와 일관된 라운드 */
		    background: #f9f9f9; /* 리스트와 유사한 밝은 배경색 */
		    padding: 30px; /* 여백 조정 */
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15); /* 기존 리스트의 그림자와 유사한 스타일 */
		    overflow: hidden; /* 내용이 다이얼로그 밖으로 넘치지 않도록 설정 */
		    margin: 50px auto; /* 화면 중앙에 위치하도록 설정 */
		}
		.refund-dialog-content {
		    display: flex;
		    align-items: center;
		    gap: 20px;
		}

		.refund-dialog-book-info {
		    display: flex;
		    gap: 20px;
		}

		.refund-dialog-book-image {
		    width: 120px;
		    height: 160px;
		}

		.refund-dialog-status h4 {
		    margin: 0 0 5px 0;
		    font-size: 18px;
		}

		.status {
			display: flex;
		    font-weight: bold;
		    margin-bottom: 5px;
		}
		.status div{
			flex:1;
			margin-bottom:15px;
		}
		.status h1{
		    font-size:20px;
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
				<div class="shop-list-title-bar">
					<div class="study-group-list-search-bar shop-list-search-bar">
						<h1 class="shop-list-title">환불 내역</h1>
						<input type="text" placeholder="검색어를 입력하세요" v-model="keyword" @keyup.enter="fnGetList(1)">
						<button class="shop-list-search-btn" @click="fnGetList(1)">검색</button>
						<select class="shop-list-search-select" v-model="pageSize" @change="fnGetList(1)">
							<option value="5">5개씩</option>	
							<option value="10">10개씩</option>	
							<option value="20">20개씩</option>	
						</select>
					</div>
				</div>
				<div v-if="groupedByRefundId.length === 0">해당하는 상품이 존재하지 않습니다.</div>				
				

	            <!-- 환불 리스트 -->
	            <div class="refund-list-container" v-for="(items, key) in groupedByRefundId" :key="key">

					<div class="status">
						<div>
							<h1>주문 번호: {{items[0].refundId}}</h1>
							주문일: {{ items[0].orderDate }}
						</div>
						<h2 class="ordered-text">취소접수일: {{ items[0].createdDate }} </h2>	
					</div>
	                <div class="refund-list-item">
	                    <div class="refund-list-info">
	                        <div class="refund-list-description" v-for="item in items">
	                            <p>{{ item.shortTitle }}</p>
	                        </div>
	                    </div>
	                    <div class="refund-list-quantity">
	                        <p>{{ items[0].quantity }}개</p>
	                        <p>{{ items[0].price }}원</p>
	                    </div>
	                    <div class="refund-list-status">
	                        <p>{{ items[0].status }}</p>
	                        <button class="refund-list-details-button" @click="openDialog(items)">취소상세</button>
	                    </div>
	                </div>
	            </div>

	            <!-- Dialog -->
	            <dialog class="refund-dialog round" ref="refundDialog">
					<div class="rightCloseBtn">
						<a href="javascript:;" @click="closeDialog" class="closeBtn">
				        	<svg class="closeBtn" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="gray"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg>
						</a>
					</div>
	                <div class="refund-dialog-content" v-for="item in selectedItem">
	                    <div class="refund-dialog-book-info">
	                        <img :src="item.image" alt="책 이미지" class="refund-dialog-book-image">
	                        <div class="refund-dialog-book-details">
	                            <h3>{{ item.shortTitle }}</h3>
	                            <p class="refund-dialog-author">저자: {{ item.author }}</p>
	                            <p class="refund-dialog-cancel-reason">취소 사유: {{ item.refundReason }}</p>
	                            <p class="refund-dialog-cancel-date">취소 일자: {{ item.refundDate }}</p>
	                        </div>
	                    </div>
	                    <div class="refund-dialog-status">
	                        <h4>환불 정보</h4>
	                        <p>환불 상태: {{ selectedItem[0].status }}</p>
	                    </div>
	                </div>
	            </dialog>

	            <!-- Pagination -->
	            <div class="pagination">
	                <button v-if="currentPage > 1" @click="fnGetList(currentPage - 1)">이전</button>
	                <button v-for="page in pagesToShow" :class="{active: page == currentPage}" @click="fnGetList(page)">
	                    {{ page }}
	                </button>
	                <button v-if="currentPage < totalPages" @click="fnGetList(currentPage + 1)">다음</button>
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
				isLogin : true,
				refundList: [],
				selectedItem: [],
				currentPage: 1,
				totalPages: 1,
				pageSize: 5,
				maxPageDisplay: 10,
				keyword: ''
				
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
					pageSize: self.pageSize,
					keyword: self.keyword
				};
				$.ajax({
					url:"/refundList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						
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
				self.fnGetList(self.currentPage);
			});
        }
    });
    app.mount('#app');
</script>