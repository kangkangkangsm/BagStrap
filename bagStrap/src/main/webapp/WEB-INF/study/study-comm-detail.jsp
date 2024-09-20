<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    .stu-comm-detail-content {
        width: 100%;
        max-width: none; /* 최대 너비 제한 해제 */
        margin: 0; /* 중앙 정렬 제거ㅎ */
        padding: 20px;
    }

    .stu-comm-detail-board-container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .stu-comm-detail-board-header {
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }

    .stu-comm-detail-board-type {
        color: #888;
        font-size: 18px;
        margin: 0;
    }

    .stu-comm-detail-board-title {
        color: #333;
        font-size: 24px;
        margin: 5px 0 0 0;
    }

    .stu-comm-detail-board-content {
        font-size: 16px;
        line-height: 1.6;
    }

    .stu-comm-detail-ol {
        padding-left: 20px;
        margin-top: 10px;
    }

    .stu-comm-detail-comments-section {
        margin-top: 30px;
    }

	.stu-comm-detail-comment {
	    display: flex;
	    align-items: flex-start;
	    background-color: #fff;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    padding: 15px;
	    margin-bottom: 20px;
	}
	.comment-input-container {
	    flex-grow: 1;
	    margin-right: 10px;
	}
    .stu-comm-detail-comment textarea {
        padding: 10px;
        margin: 10px 0;
        resize: none;
        border: 1px solid #ddd;
        border-radius: 4px;
        width: 100%;
    }

    .stu-comm-detail-comment-button {
        align-self: flex-end;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .stu-comm-detail-comment-button:hover {
        background-color: #0056b3;
    }

    .stu-comm-detail-comment-list {
        margin-top: 20px;
        padding: 10px;
        background-color: #f9f9f9;
        border-radius: 8px;
        border: 1px solid #ddd;
    }

    .stu-comm-detail-comment-item {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    .stu-comm-detail-comment-item:last-child {
        border-bottom: none;
    }

    .stu-comm-detail-profile {
        display: flex;
        align-items: center;
        margin-bottom: 30px;
    }

    .stu-comm-detail-profile-img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 10px;
    }

    .stu-comm-detail-profile-info {
        flex-grow: 1;
    }

    .stu-comm-detail-profile-info p {
        margin: 0;
        padding: 0;
    }

    /* 댓글 창 스타일 */
	.stu-comm-detail-comment {
	    display: flex;
	    align-items: center; /* 수직 중앙 정렬 */
	    background-color: #fff;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    padding: 15px;
	    margin-bottom: 20px;
	}

	.stu-comm-detail-comment-input-container {
	    flex-grow: 1;
	    margin-right: 10px;
	}

	.stu-comm-detail-comment-textarea {
	    width: 30%;
	    height: 50px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    padding: 10px;
	    font-size: 14px;
	    resize: none;
	}

	.stu-comm-detail-comment-button {
	    padding: 10px 15px;
	    background-color: #007bff;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	}

	.stu-comm-detail-comment-button:hover {
	    background-color: #0056b3;
	}
</style>
<body>
    <div id="app">
        <main class="main-container">

            <aside class="sidebar"></aside>

            <div class="stu-comm-detail-content">
                <div class="stu-comm-detail-board-container">
                    <div class="stu-comm-detail-board-header">
                        <a class="stu-comm-detail-board-type" href="#" @click="fnBoardTypeList(viewList.boardTypeId,viewList.name)">{{viewList.name}}</a>
                        <h1 class="stu-comm-detail-board-title">{{viewList.title}}</h1>
                        <div class="stu-comm-detail-profile">
                            <img src="../src/profile.png" alt="프로필 사진" class="stu-comm-detail-profile-img">
                            <div class="stu-comm-detail-profile-info">
                                <p><strong>{{viewList.userNickName}} 님</strong></p>
                                {{viewList.createdDate}} 조회 : {{viewList.views}}
                            </div>
							<button @click="fnInsertBoard()">글쓰기</button>
							<button @click="fnBack()">목록</button>
							<template v-if="viewList.userId === sessionUserId">
								<button @click="fnDelete()">삭제</button>
								<button @click="fnUpdate()">수정</button>
							</template>
							<template v-if="isAdmin">
								<button @click="fnhide()">숨기기</button>
							</template>
                        </div>
                    </div>

                    <div class="stu-comm-detail-board-content">
                     <div v-html = "viewList.content"></div>   
					 <template v-if="viewList.filePath">
					 <img style="width:400px; height:400px;" :src="viewList.filePath">
                     </template>
				 	</div>
		
					<div class="stu-comm-detail-comments-section">
					    <div class="stu-comm-detail-comment">
					        <div style="flex-grow: 1;">
								<template v-if="isLogin">
					            {{sessionUserNickName}} 님
								</template>
								<template v-if="!isLogin">
									로그인 먼저 하십셔
								</template>
					            <div class="stu-comm-detail-comment-input-container">
					                <textarea placeholder="댓글을 남겨보세요..." v-model="contents" class="stu-comm-detail-comment-textarea" @keyup.enter="fnSave()"></textarea>
					            </div>
					        </div>
					        <button class="stu-comm-detail-comment-button" @click="fnSave()">등록</button>
					    </div>
					</div>
				<template v-if="viewComment.length > 0">
                    <div class="stu-comm-detail-comment-list">
                        <div class="stu-comm-detail-comment-item" v-for="item in viewComment">
                            <strong>{{item.userNickName}}</strong>
                            <p>{{item.comcontents}}</p>
                            <small>{{item.comCreateDay}}</small>
                        </div>
                    </div>
					</template>
                </div>
            </div>

        </main>

    </div>
    <jsp:include page="/layout/footer.jsp"></jsp:include>

</body>

</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                boardId : '${boardId}',
				viewList : {},
				viewComment : [],
				user: '${sessionScope.user}',
				isLogin : false,
				sessionUserId : '',
				contents : ""
            };
        },
        methods: {
			fnhide(){
			var self = this;
			var nparmap = {boardId : self.boardId};
			$.ajax({
				url:"/updateStatusBoard.dox",
				dataType:"json",	
				type : "POST", 
				data : nparmap,
				success : function(data) { 
					console.log(data);
					alert(data.message);
					location.href="/study-comm"
						
						}
					});
			},				
			fnDelete(){
				var self = this;
				var nparmap = {boardId : self.boardId};
				$.ajax({
					url:"/deleteBoard.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
						location.href="/study-comm"
							
						}
					});
			},			
			fnInsertBoard(){
				location.href="/commInsert"
			},
			fnBack(){
				 history.back();
			},
			fnBoardTypeList(boardTypeId,name){
				$.pageChange("/study-comm",{boardTypeId2 : boardTypeId, name : name});
				},		
			fnView(){
				var self = this;
				var nparmap = {boardId : self.boardId};
				$.ajax({
					url:"/selectCommView.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.viewList = data.viewList;
						self.viewComment = data.viewComment;
					
					}
				});
	        },
			fnSession(){
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url:"sharedHeader.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.isLogin = data.isLogin; 
						if(data.isLogin){
							self.sessionUserId = data.userId;
							self.sessionUserNickName = data.userNickName;
							self.isAdmin = data.isAdmin;
							console.log('세션아이디:', self.sessionUserId);  // sessionUserId가 제대로 설정되었는지 확인
						} else {
							self.sessionUserId = '';
							self.sessionUserNickName = '';	
							self.isAdmin = '';			
						}
					
					}
				});
			},
			fnSave(){
				var self = this;
				var nparmap = {boardId : self.boardId,contents : self.contents,userId : self.sessionUserId };
				$.ajax({
					url:"/insertViewComment.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
						self.contents = "";
						self.fnView();
						
					
					}
				});
	        },
        },
        mounted() {
            var self = this;
			self.fnView();
			self.fnSession();
        }
    });
    app.mount('#app');
</script>