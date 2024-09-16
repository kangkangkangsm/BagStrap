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
	<div id="app">

        <div class="stu_comm_profile">
            <img src="../src/profile.png" alt="프로필 사진" class="stu_comm_profile-img">
            <div class="stu_comm_profile-info">
                <p><strong>하유성 님</strong></p>
            </div>
        </div>

        <!-- 내가 쓴 게시글, 댓글 -->
        <div class="stu_comm_user-activity">
            <div class="stu_comm_activity-item">
                <span class="stu_comm_activity-icon">💬</span>
                <a href="#">내가 쓴 게시글</a>
                <span class="stu_comm_activity-count">0개</span>
            </div>
            <div class="stu_comm_activity-item">
                <span class="stu_comm_activity-icon">💬</span>
                <a href="#">내가 쓴 댓글</a>
                <span class="stu_comm_activity-count">2개</span>
            </div>
        </div>

        <nav class="stu_comm_menu">
            <button>커뮤니티 글쓰기</button>
            <ul v-for="item in boardTypelist">
				<template v-if="item.boardTypeId >= 1000 && item.boardTypeId <= 1999 ">
                <li><a href="#">{{item.name}}</a></li>
				</template>
			</ul>
			<hr>
			<ul v-for="item in boardTypelist">
				<template v-if="item.boardTypeId >= 2000 && item.boardTypeId <= 2999 ">
                <li><a href="#">{{item.name}}</a></li>
				</template>
			</ul>
			<hr>	
			<ul v-for="item in boardTypelist">
				<template v-if="item.boardTypeId >= 3000 && item.boardTypeId <= 3999 ">
                <li><a href="#">{{item.name}}</a></li>
				</template>
            </ul>
        </nav>
		<hr>
		<div class="stu_comm_recent-comments">
              <h3>최근 게시글 · 댓글</h3>
              <ul v-for = "item in boardList">
                  <li><a href="#">{{item.title}}</a></li>
              </ul>
              <div class="stu_comm_pagination">
                  <a href="#">이전</a>
                  <a href="#">다음</a>
              </div>
        </div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "",
				codeList : {},
				selectedCodes : [],
				boardTypelist : [],
				boardList : []
            };
        },
        methods: {
            fnboardtypeList(){
				var self = this;
				var nparmap = {
					selectedCodes: JSON.stringify(self.selectedCodes)
				};
				$.ajax({
					url:"selectStuCommType.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						self.boardTypelist = data.boardTypelist; 
						self.boardList = data.boardList;
						console.log(data);

					}
				});
            }
        },
        mounted() {
            var self = this;
			self.fnboardtypeList();
        }
    });
    app.mount('#app');
</script>