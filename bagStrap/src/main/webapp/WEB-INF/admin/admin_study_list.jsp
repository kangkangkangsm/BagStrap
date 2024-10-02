<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<style>

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
									{{item.studyName}}
			                        <div class="admin-study-description">{{item.description}}</div>
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