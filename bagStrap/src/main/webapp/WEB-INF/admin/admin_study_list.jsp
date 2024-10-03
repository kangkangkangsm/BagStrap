<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<style>

		.admin-study-container {
		    width: 100%;
		    max-width: 1200px;
		    margin: 0 auto;
		}

		.shop-list-title-bar {
		    display: flex;
		    margin: 20px auto;
		}

		.shop-list-title {
		    font-size: 30px;
		    font-weight: bold;
		    margin: 0px 20px 0px 0px;
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
		    background: #343A40;
		    color: #fff;
		    border: none;
		    cursor: pointer;
		    transition: background-color 0.3s;
		    font-size: 1em;
		}

		.shop-list-search-select {			
		    background: #343A40;
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
		    background: #2c3237;
		}

		/* 스터디 리스트 스타일 */
		.admin-study {
		    margin: 20px 0;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		    background: #f9f9f9;
		    padding: 20px;
		}

		.admin-study-list {
		    list-style: none;
		    padding: 0;
		    margin: 0;
		}

		.admin-study-list-item {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 15px 20px;
		    border-bottom: 1px solid #ddd;
		    transition: background-color 0.2s ease-in-out;
		}

		.admin-study-list-item:hover {
		    background: #f1f1f1;
		}

		/* 스터디 리스트 아이템 이미지 및 텍스트 */
		.admin-study-left {
		    display: flex;
		    align-items: center;
		    cursor: pointer;
		    flex: 3;
		}

		.admin-study-left img {
		    width: 100px;
		    height: 100px;
		    border-radius: 8px;
		    margin-right: 20px;
		    border: 1px solid #ddd;
		}

		.admin-study-description {
		    font-size: 14px;
		    color: #555;
		}

		.admin-study-right {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    gap: 10px;
		}

		/* 스터디 승인 및 거절 버튼 스타일 */
		.admin-study-right button {
		    background-color: #ff7f50;
		    color: white;
		    border: none;
		    padding: 8px 12px;
		    border-radius: 4px;
		    cursor: pointer;
		    transition: background 0.3s ease;
		}

		.admin-study-right button:hover {
		    background-color: #e74c3c;
		}

		/* 승인됨, 거절됨 상태 스타일 */
		.admin-study-right .approved {
		    background-color: #28a745;
		    color: white;
		    border-radius: 4px;
		    padding: 5px 10px;
		    font-weight: bold;
		}

		.admin-study-right .denied {
		    background-color: #dc3545;
		    color: white;
		    border-radius: 4px;
		    padding: 5px 10px;
		    font-weight: bold;
		}

		/* Pagination 스타일 */
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

		/* Modal 다이얼로그 스타일 */
		.admin-dialog {
		    top: 200px;
		    width: 60%;
		    max-width: 800px;
		    border: 1px solid #ddd;
		    border-radius: 12px;
		    background: #f9f9f9;
		    padding: 30px;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
		    overflow: hidden;
		    margin: 50px auto;
		}

		.admin-dialog-content {
		    display: flex;
		    align-items: center;
		    gap: 20px;
		}

		.admin-dialog-book-info {
		    display: flex;
		    gap: 20px;
		}

		.admin-dialog-book-image {
		    width: 120px;
		    height: 160px;
		}

		.admin-dialog-status h4 {
		    margin: 0 0 5px 0;
		    font-size: 18px;
		}

		.admin-dialog-btn {
		    background-color: #007bff;
		    color: white;
		    border: none;
		    padding: 10px 15px;
		    border-radius: 5px;
		    cursor: pointer;
		    margin-top: 20px;
		}

		.admin-dialog-btn:hover {
		    background-color: #0056b3;
		}
		.admin-study-left-flex{
			display: flex;
			flex-direction: column;
		}
		.admin-study-left-flex h1{
			font-size: 24px;
			font-weight: bold;
			margin-bottom: 5px;
		}
		.admin-study-left-flex h2{
			font-size: 16px;

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

					
			          <div class="admin-study">
			              <ul class="admin-study-list">
			                  <li class="admin-study-list-item" v-for="item in studyList">
								<a class="admin-study-left" href="javascript:;" @click="goToDetail(item.boardNo)">
									<template v-if="item.filePath">
										<img style="width: 100px; height: 100px" :src="item.filePath" alt=" Image" class="">
									</template>
									<template v-else>
										<img style="width: 100px; height: 100px" src="../src/profile.png" alt=" Image" class="">
									</template>		
									<div class="admin-study-left-flex">			                      
										<h1>{{item.studyName}}<h2>
				                        <h2 class="admin-study-description">{{item.description}}</h2>
									</div>
							  	</a>
								<div class="admin-study-right">
									<template v-if="item.groupStatus === 'Y'">
										승인됨
									</template>
									<template v-else>
										<button type="button" @click="permitStudy(item.boardNo)">승인</button>
										<button type="button" @click="denyStudy(item.boardNo)">거절</button>
									</template>
								</div>
			                  </li>
			              </ul>
			          </div>

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

    const app = Vue.createApp({
        data() {
            return {
				isLogin : false,
				isAdmin : false,
				studyList: [],
				currentPage: 1,
				totalPages: 1,
				pageSize: 10,
				maxPageDisplay: 10
            };
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
			}
		},
        methods: {
            fnGetList(currentPage){
				var self = this;
				var nparmap = {
				pageSize: self.pageSize,  // 페이지 사이즈 추가
				currentPage: currentPage
				};
				$.ajax({
					url:"/selectStudyGroupForAdmin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.studyList = data.studyList;
						self.currentPage = currentPage;
						self.totalPages = data.totalPages;

					}
				});
            },
			permitStudy(studyGroupId){
				var self = this;
				var nparmap = {
					studyGroupId: studyGroupId
				};
				$.ajax({
					url:"/updateStudyGroupForAdmin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
						self.fnGetList(self.currentPage);

					}
				});
			},
			denyStudy(studyGroupId){
				var self = this;
				var nparmap = {
					studyGroupId: studyGroupId
				};
				$.ajax({
					url:"/deleteStudyGroupForAdmin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
						self.fnGetList(self.currentPage);
					}
				});
			},
			goToDetail(id){
					$.pageChange("/study-group-detail", {boardNo:id})
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