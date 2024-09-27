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
												<svg v-for="number in 5" @click="star=number" :fill="star >= number ? 'orange' : 'gray'" baseProfile="tiny" height="24px" id="Layer_1" version="1.2" viewBox="0 0 24 24" width="24px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><g><path d="M9.362,9.158c0,0-3.16,0.35-5.268,0.584c-0.19,0.023-0.358,0.15-0.421,0.343s0,0.394,0.14,0.521    c1.566,1.429,3.919,3.569,3.919,3.569c-0.002,0-0.646,3.113-1.074,5.19c-0.036,0.188,0.032,0.387,0.196,0.506    c0.163,0.119,0.373,0.121,0.538,0.028c1.844-1.048,4.606-2.624,4.606-2.624s2.763,1.576,4.604,2.625    c0.168,0.092,0.378,0.09,0.541-0.029c0.164-0.119,0.232-0.318,0.195-0.505c-0.428-2.078-1.071-5.191-1.071-5.191    s2.353-2.14,3.919-3.566c0.14-0.131,0.202-0.332,0.14-0.524s-0.23-0.319-0.42-0.341c-2.108-0.236-5.269-0.586-5.269-0.586    s-1.31-2.898-2.183-4.83c-0.082-0.173-0.254-0.294-0.456-0.294s-0.375,0.122-0.453,0.294C10.671,6.26,9.362,9.158,9.362,9.158z"/></g></g></svg>
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
								{{reviewComment}}
						    </div>
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
					isLogin: false,
					reviewComment: '',
		            currentPage: 1,        // 현재 페이지
		            itemsPerPage: 20,      // 한 페이지에 보여줄 책 수 (기본값 추가)
		            totalPages: 0,         // 총 페이지 수
					keyword: "",           // 검색 키워드
					isAllSelected: false,    // 전체선택 체크박스 상태
					selectedBooks: []
		        };
		    },
		    computed: {
		        // 현재 페이지에 해당하는 책 목록만 보여줌
		        paginatedBooks() {
		            const start = (this.currentPage - 1) * this.itemsPerPage;
		            const end = start + this.itemsPerPage;
		            return this.bookList.slice(start, end);
		        }
		    },
		    methods: {
		        // 책 리스트 가져오기 (검색어에 따라 달라짐)
		        fnGetList() {
		            const self = this;
		            const nparmap = {
		                keyword: self.keyword // 검색어를 서버로 전송
		            };
		            
		            $.ajax({
		                url: "bookList.dox", // 서버의 URL
		                dataType: "json",
		                type: "POST",
		                data: nparmap, // 검색어 데이터를 함께 전송
		                success: function(data) {
							console.log(data);
		                    self.bookList = data.bookList.map(book => ({
		                        ...book,
		                        selected: false // 각 책에 대해 selected 상태를 추가
		                    })); // 서버에서 받은 책 목록 데이터
		                    self.totalPages = Math.ceil(self.bookList.length / self.itemsPerPage); // 총 페이지 수 계산
		                },
		                error: function(error) {
		                    console.error("데이터를 불러오는 중 오류 발생", error);
		                }
		            });
		        },
				
		        // 페이지 전환
		        goToPage(page) {
		            this.currentPage = page;
		        },
		        // 이전 페이지로 이동
		        prevPage() {
		            if (this.currentPage > 1) {
		                this.currentPage--;
		            }
		        },
		        // 다음 페이지로 이동
		        nextPage() {
		            if (this.currentPage < this.totalPages) {
		                this.currentPage++;
		            }
		        },
				isItemChecked(bookId){
					var self = this;
					let bookExists = false;
					
					const quantity = +bookQuantity
					self.selectedBooks.forEach(item => {
						if(item.bookId === bookId){
							self.selectedBooks = self.selectedBooks.filter(item => item.bookId !== bookId);
							bookExists = true;
						}
					})
					if(!bookExists){
						self.selectedBooks.push({
							bookId : bookId
						});
					}
					
				},
				// 전체 선택/해제 처리
		        selectAllBooks() {
		            const self = this;
		            self.paginatedBooks.forEach(book => {
		                book.selected = self.isAllSelected;
		            });
		        },
		        // 선택된 책을 장바구니로 추가
		        addToCart() {
		            const selectedBooks = this.bookList.filter(book => book.selected);
		            if (selectedBooks.length === 0) {
		                alert("책을 선택해주세요.");
		                return;
		            }

		            const bookIds = selectedBooks.map(book => book.BOOK_ID);
		            
		            // 선택된 책들의 ID를 서버로 전송
		            $.ajax({
		                url: "shop_cart", // 서버의 URL
		                type: "GET", // GET 방식으로 전송
		                data: { bookIds: bookIds.join(',') }, // bookIds를 전송
		                success: function(response) {
		                    alert("선택된 책이 장바구니에 추가되었습니다.");
		                },
		                error: function(error) {
		                    console.error("장바구니 추가 중 오류 발생", error);
		                }
		            });
		        }
		    },
		    mounted() {
				var self = this;
		       // this.fnGetList(); // 컴포넌트가 로드될 때 책 리스트를 불러옴
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
</body>
</html>