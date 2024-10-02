<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
	<div id="sidebar">
        <div class="stu_comm_profile">
            <div class="stu_comm_profile-info">
                <p><strong>하유성 님</strong></p>
            </div>
        </div>
        <div>
            <p><strong>MyInfo</strong></p>
            <ul>
                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myinfo')">회원정보 수정</a></li>
                <li><a href="javascript:;">내 활동내역</a></li>
            </ul>
        </div>
        <div>
            <hr>
            <p><strong>MyStudy</strong></p>
            <ul>
                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myinfo')">스터디 캘린더</a></li>
                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myinfo')">내 스터디 관리</a></li>
            </ul>
        </div>
        <div>
            <hr>
            <p><strong>MyShop</strong></p>
            <ul>
                <li><a href="/myshop/orders" @click="checkLoginAndPageChange('/myshop/orders')">내 주문내역</a></li>
                <li><a href="/myshop/refundList" @click="checkLoginAndPageChange('/myshop/refunds')">내 환불내역</a></li>
            </ul>
        </div>
        <div>
            <hr>
            <p><strong>CSCenter</strong></p>
            <ul>
                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myinfo')">내 문의내역</a></li>
                <li><a href="javascript:;" @click="checkLoginAndPageChange('/myinfo')">내 환불기록</a></li>
            </ul>
        </div>
        <div>
            <hr>
            <p><strong>Admin/vif</strong></p>
            <ul>
				<li><a href="/admin/studyList">스터디 그룹 생성 신청</a></li>
				<li><a href="javascript:;">고객문의 관리</a></li>
                <li><a href="javascript:;">공지사항 관리?</a></li>
            </ul>
        </div>
    </div>

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