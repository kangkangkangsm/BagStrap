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
									<template v-if="item.groupstatus === 'Y'">
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
				studyList: []
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url:"/selectStudyGroupForAdmin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.studyList = data.studyList;

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

					}
				});
			},
			goToDetail(id){
					$.pageChange("/study-group-detail", {boardNo:id})
			}
        },
        mounted() {
            var self = this;
			//self.fnGetList();
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					self.isLogin = false;
				};
				self.fnGetList();	
			});
			window.addEventListener('adminStatusChanged', function(){
				if(window.sessionStorage.getItem("isAdmin") === 'true'){
					self.isAdmin = true;	
				} else{
					self.isAdmin = false;
				};
				self.fnGetList();	
			})
        }
    });
    app.mount('#app');
</script>