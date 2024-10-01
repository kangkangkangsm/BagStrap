<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
</style>
</head>
<body>
		<main class="main-container">
		
	        <aside class="sidebar">
				<jsp:include page="/layout/header_sidebar.jsp"></jsp:include>				
	        </aside>
			<div class="content">
				<div id="app">
					<div>리뷰 작성</div>
					<div v-if="isLogin">
						<div class="ehyo...">
							<div class="ordered-list-container round">
							    <div class="left-section">
							        <div class="ordered-product">
							            <img class="ordered-product-image" :src="book.image" :alt="book.title">
										<div class="ordered-product-info">
							                <div class="ordered-product-name">{{book.title}}</div>											
							                <div class="ordered-product-detail-info">
												<svg v-for="number in 5" @click="fnChangeStar(number)" :fill="star >= number ? 'orange' : 'gray'" baseProfile="tiny" height="24px" id="Layer_1" version="1.2" viewBox="0 0 24 24" width="24px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><g><path d="M9.362,9.158c0,0-3.16,0.35-5.268,0.584c-0.19,0.023-0.358,0.15-0.421,0.343s0,0.394,0.14,0.521    c1.566,1.429,3.919,3.569,3.919,3.569c-0.002,0-0.646,3.113-1.074,5.19c-0.036,0.188,0.032,0.387,0.196,0.506    c0.163,0.119,0.373,0.121,0.538,0.028c1.844-1.048,4.606-2.624,4.606-2.624s2.763,1.576,4.604,2.625    c0.168,0.092,0.378,0.09,0.541-0.029c0.164-0.119,0.232-0.318,0.195-0.505c-0.428-2.078-1.071-5.191-1.071-5.191    s2.353-2.14,3.919-3.566c0.14-0.131,0.202-0.332,0.14-0.524s-0.23-0.319-0.42-0.341c-2.108-0.236-5.269-0.586-5.269-0.586    s-1.31-2.898-2.183-4.83c-0.082-0.173-0.254-0.294-0.456-0.294s-0.375,0.122-0.453,0.294C10.671,6.26,9.362,9.158,9.362,9.158z"/></g></g></svg>
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
						</div>
						<div>
							<!-- Left Section -->
						    <div class="left-section">
						        <div class="ordered-product">
						            <div>
										상세 리뷰
									</div>
						        </div>
						    </div>
						    <!-- Right Section -->
						    <div class="right-section">
								<textarea style="width:100%;height:400px" placeholder="다른 고객님에게 도움이 되도록 상품에 대한 솔직한 평가를 남겨주세요" v-model="reviewComment"></textarea>
						    </div>
						</div>
						<button type="button" v-if="isFirst" @click="insertReview">리뷰 작성하기</button>
						<button type="button" v-if="!isFirst" @click="updateReview">리뷰 수정하기</button>
						<button type="button" v-if="!isFirst" @click="deleteReview">리뷰 삭제하기</button>
						
					</div>
			    </div>
			</div>


		</main>

	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script>
		const app = Vue.createApp({
		    data() {
		        return {
					star: 0,
					book: JSON.parse('${book}'),
					isFirst: true,
					isLogin: false,
					reviewComment: ''
		        };
		    },
		    methods: {
		        fnGetList() {
		            const self = this;
		            const nparmap = {
		                bookId: self.book.bookId
		            };
		            
		            $.ajax({
		                url: "/selectMyReview.dox", 
		                dataType: "json",
		                type: "POST",
		                data: nparmap,
		                success: function(data) {
							console.log(data);
							if(data.result){
								self.isFirst = false;
								self.star = data.myReview.rating;
								self.reviewComment = data.myReview.reviewComment;
							}
						}
		            });
		        },
				updateReview() {
		            const self = this;
		            const nparmap = {
		                bookId: self.book.bookId,
						rating: self.star,
						reviewComment: self.reviewComment
		            };
		            $.ajax({
		                url: "/updateMyReview.dox", 
		                dataType: "json",
		                type: "POST",
		                data: nparmap,
		                success: function(data) {
							console.log(data);
							if(data.result){
								alert(data.message);
								location.href="/myshop/orders";
							}
						}
		            });
		        },
				insertReview() {
		            const self = this;
		            const nparmap = {
		                bookId: self.book.bookId,
						rating: self.star,
						reviewComment: self.reviewComment
		            };
		            $.ajax({
		                url: "/insertMyReview.dox", 
		                dataType: "json",
		                type: "POST",
		                data: nparmap,
		                success: function(data) {
							console.log(data);
							if(data.result){
								alert(data.message);
								location.href="/myshop/orders";
							}
						}
		            });
		        },
				deleteReview() {
		            const self = this;
		            const nparmap = {
		                bookId: self.book.bookId,
		            };
		            $.ajax({
		                url: "/deleteMyReview.dox", 
		                dataType: "json",
		                type: "POST",
		                data: nparmap,
		                success: function(data) {
							console.log(data);
							if(data.result){
								alert(data.message);
								location.href="/myshop/orders";
							}
						}
		            });
		        },
				fnChangeStar(numb){
					var self = this;
					if (self.star === numb){
						self.star = 0;
					} else {
						self.star = numb;
					}
				}
		    },
		    mounted() {
				var self = this;
		        this.fnGetList(); 
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
</body>
</html>