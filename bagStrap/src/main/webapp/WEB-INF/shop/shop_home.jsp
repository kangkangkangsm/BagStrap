<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
<style>
	.book-list {
	    display: grid;
	     grid-template-columns: repeat(5, 1fr); /* 5 books per row */
	    gap: 20px;
	    padding: 20px 0;
	}

	.book-item {
	    background-color: #fff;
	    border-radius: 10px;
	    text-align: center;
	    padding: 15px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    position: relative;
	}

	.book-item img {
	    width: 100%;
	    height: 250px;
	    object-fit: cover;
	    border-radius: 10px 10px 0 0;
	}

	.book-item h5 {
	    margin-top: 10px;
	    font-size: 16px;
	    font-weight: bold;
	    color: #333;
	}

	.book-item .price {
	    font-size: 14px;
	    color: #ff5722;
	    margin-top: 5px;
	}

	.book-item .discount {
	    font-size: 12px;
	    color: #999;
	}

	.book-item .rating {
	    margin-top: 10px;
	    color: #4CAF50;
	}

	.book-item .heart-icon {
	    position: absolute;
	    bottom: 10px;
	    right: 10px;
	    cursor: pointer;
	    width: 20px;
	    height: 20px;
	}

	/* 체크박스 크기와 위치 조정 */
	.book-item input[type="checkbox"] {
	    position: absolute;
	    top: 10px;
	    left: 10px;
	    transform: scale(1.5); /* 체크박스를 더 크게 보이게 조정 */
	    cursor: pointer;
	}

	/* 카테고리 및 검색 영역 */
	.main-chap1 {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    margin-bottom: 20px;
	}

	.main-chap1 h1 {
	    font-size: 28px;
	    font-weight: bold;
	    color: #333;
	}

	.main-chap1 button {
	    margin-left: 10px;
	    padding: 10px 20px;
	    background-color: #f1f1f1;
	    border: 1px solid #ccc;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	}

	.main-chap1 button:hover {
	    background-color: #e0e0e0;
	}

	.main-chap1 button:active {
	    background-color: #d1d1d1;
	    border-color: #999;
	}

	.inputBox {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding: 20px;
	    background-color: #f8f9fa;
	    border-radius: 10px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    margin-bottom: 20px;
	}

	.inputBox input {
	    width: 300px;
	    height: 40px;
	    padding: 0 15px;
	    border: 1px solid #ced4da;
	    border-radius: 5px;
	    font-size: 16px;
	    box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	    transition: border-color 0.3s ease;
	}

	.inputBox input:focus {
	    border-color: #007bff;
	    outline: none;
	}

	.inputBox button {
	    padding: 10px 20px;
	    background-color: #007bff;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    font-size: 16px;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
		margin-left: -65%;
	}

	.inputBox button:hover {
	    background-color: #0056b3;
	}

	.inputBox select {
	    padding: 10px;
	    font-size: 14px;
	    border: 1px solid #ced4da;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: border-color 0.3s ease;
	}

	.inputBox select:focus {
	    border-color: #007bff;
	    outline: none;
	}

	/* 하단 버튼 영역 */
	.button-container {
	    display: flex;
	    justify-content: flex-start;
	    align-items: center;
	    padding: 20px 0;
	}

	.button-container input[type="checkbox"] {
	    margin-right: 10px;
	    transform: scale(1.2);
	}

	.button-container button {
	    margin-left: 10px;
	    padding: 10px 20px;
	    background-color: #ff8000;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	}

	.button-container button:hover {
	    background-color: #e67700;
	}

	hr {
	    width: 100%;
	    height: 1px;
	    border: none;
	    background-color: #ccc;
	    margin: 20px 0;
	}
	/* 페이징 버튼 스타일 */
		.pagination {
		    display: flex;
		    justify-content: center;
		    margin: 20px 0;
		}

		.pagination button {
		    background-color: #f8f9fa;
		    border: 1px solid #dee2e6;
		    color: #007bff;
		    padding: 8px 12px;
		    margin: 0 2px;
		    cursor: pointer;
		    transition: background-color 0.3s, color 0.3s;
		    border-radius: 4px;
		}

		.pagination button.active {
		    background-color: #007bff;
		    color: white;
		    cursor: default;
		}

		.pagination button:disabled {
		    background-color: #e9ecef;
		    color: #6c757d;
		    cursor: not-allowed;
		}

		.pagination button:not(.active):not(:disabled):hover {
		    background-color: #0056b3;
		    color: white;
		}
		
</style>
</head>
<body>
	<div id="app">
		<main class="main-container">
		
	        <aside class="sidebar">
				
				
				
	        </aside>
			
			
			<div>
				<!-- 메인 제목과 버튼 -->
				<div class="main-chap1">
					<h1>온라인 일간 베스트</h1>
				</div>
	
				<!-- 검색 및 필터 -->
				<div class="inputBox">
					<input type="text" placeholder="책 제목을 입력하세요" v-model="keyword">
					<button @click="fnGetList()">검색</button>
					
					<select v-model="itemsPerPage" @change="fnGetList()">
						<option :value="20">20개씩</option>
						<option :value="50">50개씩</option>
					</select>
				</div>
	
				<!-- 체크박스 및 장바구니 버튼 -->
				<div class="button-container">
					<input type="checkbox" v-model="isAllSelected" @change="selectAllBooks"> 전체선택
					<button @click="addToCart()">장바구니</button>
				</div>
	
				<hr>
	
				<div class="book-list">
					<a v-for="(book, index) in paginatedBooks" :key="book.BOOK_ID" :href="'/bookDetail/' + book.BOOK_ID" class="book-item" style="text-decoration: none; color: inherit;">
						<input type="checkbox" v-model="book.selected">
						<img :src="book.image" alt="책 이미지">
						<h5>{{ book.title }}</h5>
						<div class="price">{{ book.price }}원</div>
						<div class="discount">{{ book.discount }}% 할인</div>
						<div class="rating">평점: {{ book.rating }}</div>
						<img class="heart-icon" src="/src/heart.png" alt="좋아요">
					</a>
				</div>
				
				<!--페이징네이션 버튼-->
				<div class="pagination">
					<button @click="prevPage" :disabled="currentPage === 1">이전</button>
					<button v-for="page in totalPages" :key="page" @click="goToPage(page)" :class="{active: page === currentPage}">{{ page }}</button>
					<button @click="nextPage" :disabled="currentPage === totalPages">다음</button>
				</div>
			</div>
		</main>
	</div>

	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script>
			const app = Vue.createApp({
			    data() {
			        return {
			            bookList: [],          // 서버에서 받아올 전체 책 데이터
			            currentPage: 1,        // 현재 페이지
			            itemsPerPage: 20,      // 한 페이지에 보여줄 책 수 (기본값 추가)
			            totalPages: 0,         // 총 페이지 수
						keyword: "",           // 검색 키워드
						isAllSelected: false    // 전체선택 체크박스 상태
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
			        this.fnGetList(); // 컴포넌트가 로드될 때 책 리스트를 불러옴
			    }
			});
			
			app.mount('#app');
		</script>
</body>
</html>