<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
<style>

	.review-container {
	    margin: 20px 20px;
	}

	.review-title {
	    font-size: 24px;
	    text-align: center;
	    margin-bottom: 20px;
	}

	.review-header {
	    display: flex;
	    justify-content: space-between;
	    gap: 20px;
	    align-items: center;
	}

	.book-info {
	    display: flex;
	    align-items: center;
	}

	.book-image {
	    width: 100px;
	    height: 150px;
	    object-fit: cover;
	    margin-right: 20px;
	    border: 1px solid #ddd;
	}

	.book-details {
	    display: flex;
	    flex-direction: column;
	}

	.book-title {
	    font-size: 18px;
	    margin-bottom: 10px;
	}

	.star-rating {
	    font-size: 20px;
	    color: #ffcc00;
	}

	.review-text-section {
	    flex-grow: 1;
		display:flex;
		justify-content: center;
	}

	.review-label {
	    font-size: 16px;
	    display: block;
	    margin-bottom: 10px;
	}

	.review-textarea {
	    width: 100%;
	    height: 150px;
	    padding: 10px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    resize: none;
	    font-size: 14px;
	}

	.button-section {
	    text-align: right;
	    margin-top: 20px;
	}

	.submit-button {
	    background-color: #ff6b6b;
	    color: white;
	    padding: 10px 20px;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    font-size: 16px;
	}

	.submit-button:hover {
	    background-color: #ff5252;
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
					
					
					<div class="review-container">
					    <h2 class="review-title">리뷰 작성</h2>
					    <div class="book-info">
					        <img :src="book.image" alt="Book Cover" class="book-image">
					        <div class="book-details">
					            <h3 class="book-title">{{book.shortTitle}}</h3>
								<h3 class="book-title">{{book.author}}</h3>
								<div class="review-rating">
									<a href="javascript:;">
										<svg v-for="number in 5" @click="fnChangeStar(number)" :fill="star >= number ? 'orange' : 'gray'" baseProfile="tiny" height="24px" id="Layer_1" version="1.2" viewBox="0 0 24 24" width="24px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><g><path d="M9.362,9.158c0,0-3.16,0.35-5.268,0.584c-0.19,0.023-0.358,0.15-0.421,0.343s0,0.394,0.14,0.521    c1.566,1.429,3.919,3.569,3.919,3.569c-0.002,0-0.646,3.113-1.074,5.19c-0.036,0.188,0.032,0.387,0.196,0.506    c0.163,0.119,0.373,0.121,0.538,0.028c1.844-1.048,4.606-2.624,4.606-2.624s2.763,1.576,4.604,2.625    c0.168,0.092,0.378,0.09,0.541-0.029c0.164-0.119,0.232-0.318,0.195-0.505c-0.428-2.078-1.071-5.191-1.071-5.191    s2.353-2.14,3.919-3.566c0.14-0.131,0.202-0.332,0.14-0.524s-0.23-0.319-0.42-0.341c-2.108-0.236-5.269-0.586-5.269-0.586    s-1.31-2.898-2.183-4.83c-0.082-0.173-0.254-0.294-0.456-0.294s-0.375,0.122-0.453,0.294C10.671,6.26,9.362,9.158,9.362,9.158z"/></g></g></svg>
									</a>
								</div>
							</div>
					    </div>
						<label for="review-text" class="review-label">상세 리뷰</label>

					    <div class="review-text-section">
					        <textarea id="review-text" class="review-textarea"  placeholder="다른 고객님에게 도움이 되도록 상품에 대한 솔직한 평가를 남겨주세요" v-model="reviewComment"></textarea>
					    </div>
					    <div class="button-section">
						<button class="submit-button" type="button" v-if="isFirst" @click="insertReview">리뷰 작성하기</button>
						<button class="submit-button" type="button" v-if="!isFirst" @click="updateReview">리뷰 수정하기</button>
						<button class="submit-button" type="button" v-if="!isFirst" @click="deleteReview">리뷰 삭제하기</button>
					    </div>
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