<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
          
        </div>
		<nav class="stu-comm-menu">
        <div>
			<h3 class="study-comm-sidebard-h3">MyInfo</h3>
			<div class="study-comm-sidebard-section">
            <ul>
                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myinfo')">회원정보 수정</a></li>
                <li><a href="javascript:;">내 활동내역</a></li>
            </ul>
        </div>
        <div>
			<h3 class="study-comm-sidebard-h3">MyStudy</h3>
				<div class="study-comm-sidebard-section">
            <ul>
                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myinfo')">스터디 캘린더</a></li>
                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myinfo')">내 스터디 관리</a></li>
            </ul>
        </div>
        <div>
			<h3 class="study-comm-sidebard-h3">MyShop</h3>
			<div class="study-comm-sidebard-section">
            <ul>
                <li><a href="/myshop/orders" @click="checkLoginAndPageChange('/myshop/orders')">내 주문내역</a></li>
                <li><a href="/myshop/refundList" @click="checkLoginAndPageChange('/myshop/refunds')">내 환불내역</a></li>
            </ul>
        </div>
        <div>
			<h3 class="study-comm-sidebard-h3">CSCenter</h3>
			<div class="study-comm-sidebard-section">
            <ul>
                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myinfo')">내 문의내역</a></li>
                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myinfo')">내 환불기록</a></li>
            </ul>
        </div>
        <div>
			<h3 class="study-comm-sidebard-h3">Admin/vif</h3>
			<div class="study-comm-sidebard-section">
            <ul>
				<li><a href="/admin/studyList">스터디 그룹 생성 신청</a></li>
				<li><a href="javascript:;">고객문의 관리</a></li>
                <li><a href="javascript:;">공지사항 관리?</a></li>
            </ul>
        </div>
    </div>
	</nav>

</body>
</html>
<script>
    const sidebarApp  = Vue.createApp({
        data() {
            return {
				isLogin = false,
				isAdmin = false,
                item:{},
				boardTypelist : [],
				boardList : []
            };
        },
        methods: {
			checkLoginAndPageChange(path){
				var self = this;
				if(self.isLogin){
					$.pageChange(path,{boardTypeId : boardTypeId});
				} else{
					alert('로그인 후 이용가능합니다.');	
				}
			}
        },
        mounted() {
            var self = this;
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
    sidebarApp.mount('#sidebar');
</script>