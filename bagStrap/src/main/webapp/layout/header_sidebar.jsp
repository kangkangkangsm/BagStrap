<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="http://localhost:8080/js/jquery.js"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <title>Document</title>
</head>
<style>
	.study-comm-sidebard-h3 {
			    margin: 10px 0;
			    font-size: 15px;
			    color: #333333;
			    background-color: #E0E0E0;
			    padding: 8px 12px;
			    text-align: left;
			    border-radius: 5px;
		}
		.study-comm-sidebard-section {
			    margin-bottom: 10px;
			    padding: 10px;
			    background-color: #F9F9F9;
			   
			    border-radius: 5px;
		}
		.study-group-sidebard :hover {
			    background-color: #007bff;
			    color: white;
			    border-color: #007bff;
			}	
		/* 메뉴 항목 스타일 */
			.stu-comm-menu ul {
			    list-style: none;
			    padding: 0;
			    margin: 0;
			}

			.stu-comm-menu li {
			    margin-bottom: 10px;
			}

			.stu-comm-menu li a {
			    display: block;
			    font-size: 15px;
			    color: #333;
			    text-decoration: none;
			    padding: 8px 10px;
			    border-radius: 5px;
			    transition: background 0.3s, color 0.3s;
			}

			.stu-comm-menu li a:hover {
			    background-color: #E0E0E0; /* 호버 시 배경색 변경 */
				width:280px;
			}
</style>
<body>
	<div id="sidebar">
        <div class="stu_comm_profile">
          {{isLogin}}
        </div>
		<nav class="stu-comm-menu">
        <div>
			<h3 class="study-comm-sidebard-h3">MyInfo</h3>
			<div class="study-comm-sidebard-section">
	            <ul>
	                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myinfo')">회원정보 수정</a></li>
<!--	                <li><a href="javascript:;">내 활동내역</a></li>
-->	            </ul>
			</div>
        </div>
        <div>
			<h3 class="study-comm-sidebard-h3">MyStudy</h3>
			<div class="study-comm-sidebard-section">
	            <ul>
	                <li><a href="javascript:;" @click="fnPageChangeStudy()">내 스터디 관리</a></li>
	            </ul>
				</div>
        </div>
        <div>
			<h3 class="study-comm-sidebard-h3">MyShop</h3>
			<div class="study-comm-sidebard-section">
	            <ul>
	                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myshop/orders')">내 주문내역</a></li>
	                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myshop/refunds')">내 환불내역</a></li>
	            </ul>
			</div>
        </div>
        <div>
			<h3 class="study-comm-sidebard-h3">CSCenter</h3>
			<div class="study-comm-sidebard-section">
	            <ul>
					<li><a href="/noticelist">공지사항</a></li>
					<li><a href="javascript:;" @click="checkLoginAndPageChange('/inquiry')">문의하기</a></li>
					<li><a href="javascript:;" @click="checkLoginAndPageChange('/myinquiry')">내 문의내역</a></li>
	            </ul>
			</div>
        </div>
        <div v-if="isAdmin">
			<h3 class="study-comm-sidebard-h3">Admin</h3>
			<div class="study-comm-sidebard-section">
	            <ul>
					<li><a href="/admin/orders">주문 관리</a></li>
					<li><a href="/admin/studyList">스터디 신청</a></li>
	            </ul>
			</div>
        </div>
    </div>
	</nav>
	<script>
	    const sidebarApp  = Vue.createApp({
	        data() {
	            return {
					isLogin : false,
					isAdmin : false,
	                item:{},
					boardTypelist : [],
					boardList : []
	            };
	        },
	        methods: {
				fnPageChangeStudy(){
					var self = this;
					$.pageChange("/study-comm-myboard", {itemMode : "board", author : self.sessionUserId});
				},
				checkLoginAndPageChange(path){
					var self = this;
					if(self.isLogin){
						$.pageChange(path,{});
					} else{
						alert('로그인 후 이용가능합니다.');	
					}
				},
				fnSession() {
					var self = this;
					$.ajax({
						url: "sharedHeader.dox",
						dataType: "json",	
						type: "POST", 
						success: function(data) {
							self.isLogin = data.isLogin;
							if (data.isLogin) {
								self.sessionUserId = data.userId;
								self.sessionUserNickName = data.userNickName;
								self.isAdmin = data.isAdmin;
							} else {
								self.sessionUserId = '';
								self.sessionUserNickName = '';
							}
						}
					});
				},
	        },
	        mounted() {
	            var self = this;
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				}
				if(window.sessionStorage.getItem("isAdmin") === 'true'){
					self.isAdmin = true;	
				}
				
		        window.addEventListener('loginStatusChanged', function () {
		            self.fnSession();  
		        });
				window.addEventListener('loginStatusChanged', function(){
					if(window.sessionStorage.getItem("isLogin") === 'true'){
						self.isLogin = true;	
					} else{
						self.isLogin = false;
					};
				});
				window.addEventListener('adminStatusChanged', function(){
					if(window.sessionStorage.getItem("isAdmin") === 'true'){
						self.isAdmin = true;	
					} else{
						self.isAdmin = false;
					};
				})
	        }
	    });
	    sidebarApp.mount('#sidebar');
	</script>

</body>
</html>