<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/style.css">
    <title>첫번째 페이지</title>
    <style>
		/* 전체 레이아웃 스타일 */
		.stu-comm-detail-body {
		    font-family: Arial, sans-serif;
		    background-color: #f4f4f4;
		    padding: 20px;
		}

		.stu-comm-detail-container {
		    max-width: 80%;
		    margin: 0 auto;
		    background-color: white;
		    padding: 20px;
		   
		}

		/* 메인 컨테이너 스타일 */
		.stu-comm-detail-main-container {
		    display: flex;
		    flex: 1; /* 메인 컨테이너가 남은 공간을 차지하도록 설정 */
		    background-color: #F5F5F5; /* 메인 컨테이너 배경색 */
		    overflow: auto; /* 내용이 넘칠 경우 스크롤 가능 */
		    box-sizing: border-box;
		    padding: 0px 12vw;
		    min-height: 100vh;
		}

		/* 사이드바 스타일 */
		.stu-comm-detail-sidebar {
		    width: 300px; /* 사이드바의 고정 너비 */
		    background-color: #9E9E9E; /* 사이드바 배경색 */
		    padding: 20px;
		    box-sizing: border-box;
		    
		    margin-right: 20px;
		}

		/* 콘텐츠 영역 스타일 */
		.stu-comm-detail-content {
		    flex: 1; /* 콘텐츠가 사이드바를 제외한 나머지 공간을 차지하도록 설정 */
		    padding: 20px;
		    background-color: #FFFFFF; /* 콘텐츠 배경색 */
		    box-sizing: border-box;
		    border-radius: 8px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		/* 게시판 컨테이너 스타일 */
		.stu-comm-detail-board-container {
		    background-color: white;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		    margin-bottom: 30px;
		}

		/* 게시판 헤더 스타일 */
		.stu-comm-detail-board-header {
		    border-bottom: 1px solid #ddd;
		    padding-bottom: 10px;
		    margin-bottom: 20px;
		}

		/* 게시판 타입 링크 스타일 */
		.stu-comm-detail-board-type {
		    color: #888;
		    font-size: 18px;
		    margin: 0;
		    text-decoration: none;
		    cursor: pointer;
		}

		.stu-comm-detail-board-type:hover {
		    color: #555;
		}

		/* 게시판 제목 스타일 */
		.stu-comm-detail-board-title {
		    color: #333;
		    font-size: 28px;
		    margin: 10px 0;
		}

		/* 프로필 섹션 스타일 */
		.stu-comm-detail-profile {
		    display: flex;
		    align-items: center;
		    margin-top: 15px;
		}

		.stu-comm-detail-profile-img {
		    width: 60px;
		    height: 60px;
		    border-radius: 50%;
		    margin-right: 15px;
		    cursor: pointer;
		    transition: transform 0.3s;
		}

		.stu-comm-detail-profile-img:hover {
		    transform: scale(1.05);
		}

		.stu-comm-detail-profile-info a {
		    color: black;
		    text-decoration: none;
		}

		.stu-comm-detail-profile-info a:hover {
		    text-decoration: underline;
		}

		/* 버튼 스타일 */
		.stu-comm-detail-profile button {
		    margin-left: 10px;
		    padding: 8px 16px;
		    background-color: #007bff;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s, transform 0.3s;
		}

		.stu-comm-detail-profile button:hover {
		    background-color: #0056b3;
		    transform: translateY(-2px);
		}

		.stu-comm-detail-profile button:active {
		    transform: translateY(0);
		}

		/* 게시판 내용 스타일 */
		.stu-comm-detail-board-content {
		    font-size: 16px;
		    line-height: 1.8;
		    margin-top: 20px;
		}

		.stu-comm-detail-board-content img {
		    max-width: 100%;
		    height: auto;
		    border-radius: 5px;
		    margin-top: 10px;
		}

		/* 댓글 섹션 스타일 */
		.stu-comm-detail-comments-section {
		    margin-top: 40px;
		}

		.stu-comm-detail-comments-section span {
		    font-size: 16px;
		    color: #555;
		    margin-right: 20px;
		}

		/* 댓글 입력창 스타일 */
		.stu-comm-detail-comment {
		    display: flex;
		    align-items: flex-start;
		    background-color: #fff;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    padding: 15px;
		    margin-bottom: 20px;
		    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
		}

		.stu-comm-detail-comment textarea {
		    padding: 10px;
		    margin: 10px 0;
		    resize: none;
		    border: 1px solid #ddd;
		    border-radius: 4px;
		    width: 100%;
		    font-size: 14px;
		}

		.stu-comm-detail-comment-button {
		    align-self: flex-end;
		    padding: 10px 20px;
		    background-color: #28a745;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s, transform 0.3s;
		}

		.stu-comm-detail-comment-button:hover {
		    background-color: #218838;
		    transform: translateY(-2px);
		}

		.stu-comm-detail-comment-button:active {
		    transform: translateY(0);
		}

		/* 댓글 리스트 스타일 */
		.stu-comm-detail-comment-list {
		    margin-top: 20px;
		    padding: 15px;
		    background-color: #f9f9f9;
		    border-radius: 8px;
		    border: 1px solid #ddd;
		}

		.stu-comm-detail-comment-item {
		    padding: 15px;
		    border-bottom: 1px solid #ddd;
		    position: relative;
		}

		.stu-comm-detail-comment-item:last-child {
		    border-bottom: none;
		}

		/* 댓글 작성자 링크 스타일 */
		.stu-comm-detail-comment-item a {
		    color: black;
		    text-decoration: none;
		}

		.stu-comm-detail-comment-item a:hover {
		    text-decoration: underline;
		}

		/* 댓글 작성일 및 조회수 스타일 */
		.stu-comm-detail-comment-item div small {
		    color: #999;
		    font-size: 12px;
		}

		/* 댓글 버튼 스타일 */
		.stu-comm-detail-comment-item button {
		    margin-right: 10px;
		    padding: 5px 10px;
		    background-color: #6c757d;
		    color: white;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 12px;
		    transition: background-color 0.3s, transform 0.3s;
		}

		.stu-comm-detail-comment-item button:hover {
		    background-color: #5a6268;
		    transform: translateY(-2px);
		}

		.stu-comm-detail-comment-item button:active {
		    transform: translateY(0);
		}

		/* 대댓글 스타일 */
		.stu-comm-detail-comment-reply {
		    margin-left: 40px;
		    margin-top: 20px;
		    padding: 15px;
		    background-color: #f1f1f1;
		    border-radius: 8px;
		    border: 1px solid #ccc;
		}

		.stu-comm-detail-comment-reply a {
		    font-size: 15px;
		    color: black;
		    text-decoration: none;
		}

		.stu-comm-detail-comment-reply a:hover {
		    text-decoration: underline;
		}

		.stu-comm-detail-comment-reply button {
		    margin-right: 10px;
		    padding: 5px 10px;
		    background-color: #6c757d;
		    color: white;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 12px;
		    transition: background-color 0.3s, transform 0.3s;
		}

		.stu-comm-detail-comment-reply button:hover {
		    background-color: #5a6268;
		    transform: translateY(-2px);
		}

		.stu-comm-detail-comment-reply button:active {
		    transform: translateY(0);
		}

		/* 파일 업로드 섹션 스타일 */
		.stu-comm-detail-comment-input-container {
		    display: flex;
		    align-items: center;
		    margin-top: 10px;
		}

		.stu-comm-detail-comment-input-container img {
		    cursor: pointer;
		    margin-right: 10px;
		}

		.stu-comm-detail-comment-input-container input[type="file"] {
		    display: none;
		}

		.stu-comm-detail-comment-input-container div {
		    display: flex;
		    align-items: center;
		}

		.stu-comm-detail-comment-input-container img {
		    width: 25px;
		    height: 25px;
		}

		.stu-comm-detail-comment-input-container img:hover {
		    opacity: 0.8;
		}

		/* 이미지 미리보기 스타일 */
		.stu-comm-detail-comment-input-container img[src*="첨부이모티콘"] {
		    width: 25px;
		    height: 25px;
		}

		/* 좋아요 카운트 스타일 */
		.stu-comm-detail-like-count {
		    font-size: 14px;
		    color: #555;
		    margin-left: 5px;
		}

		/* 반응형 디자인 */
		@media (max-width: 1200px) {
		    .stu-comm-detail-container {
		        max-width: 90%;
		    }

		    .stu-comm-detail-main-container {
		        padding: 0px 8vw;
		    }
		}

		@media (max-width: 992px) {
		    .stu-comm-detail-container {
		        max-width: 100%;
		    }

		    .stu-comm-detail-main-container {
		        flex-direction: column;
		        padding: 20px;
		    }
		    
		    .stu-comm-detail-sidebar {
		        width: 100%;
		        margin-right: 0;
		        margin-bottom: 20px;
		    }
		}

    </style>
</head>
<body>
    <main class="stu-comm-detail-main-container">
        <aside class="stu-comm-detail-sidebar">
            <jsp:include page="/layout/study_comm_sidebar.jsp"></jsp:include>  
        </aside>
        <div id="app">
            <div class="stu-comm-detail-content">
                <div class="stu-comm-detail-board-container">
                    <div class="stu-comm-detail-board-header">
                        <a class="stu-comm-detail-board-type" href="#" @click="fnBoardTypeList(viewList.boardTypeId,viewList.name)">{{viewList.name}}</a>
                        <h1 class="stu-comm-detail-board-title">{{viewList.title}}</h1>
                        <div class="stu-comm-detail-profile">
						<template v-if="viewList.userFile">
                            <img :src= viewList.userFile alt="프로필 사진" class="stu-comm-detail-profile-img" @click="fnUserboard(viewList.author,viewList.userNickName)">
						</template>
						<template v-if="!viewList.userFile">
                            <img src="../src/profile.png" alt="프로필 사진" class="stu-comm-detail-profile-img" @click="fnUserboard(viewList.author,viewList.userNickName)">
						</template>
	                           <div class="stu-comm-detail-profile-info">
                               <div><a href ="#" @click="fnUserboard(viewList.author,viewList.userNickName)" style="color:black;"><strong>{{viewList.userNickName}} 님</strong></a></div>
                               <div><a href ="#" @click="fnUserboard(viewList.author,viewList.userNickName)" style="color:black;">{{viewList.createdDate}} 조회 : {{viewList.views}}</a></div>
                            </div>
                            <button @click="fnInsertBoard()">글쓰기</button>
                            <button @click="fnBack()">목록</button>
                            <template v-if="viewList.userId === sessionUserId">
                                <button @click="fnDelete()">삭제</button>
                                <button @click="fnUpdate(viewList.boardId)">수정</button>
                            </template>
                            <template v-if="isAdmin && viewList.boardstatus === 'N'">
                                <button @click="fnhide(viewList.boardstatus)">숨기기</button>
                            </template>
                            <template v-if="isAdmin && viewList.boardstatus === 'Y'">
                                <button @click="fnhide(viewList.boardstatus)">숨김해제</button>
                            </template>
                            <button @click="fnLikeCheck(viewList.boardId,'게시글')">좋아요</button>
                        </div>
                    </div>

                    <div class="stu-comm-detail-board-content">
                        <div v-html="viewList.content"></div>   
                        <template v-if="viewList.filePath">
                            <img style="width:400px; height:400px;" :src="viewList.filePath">
                        </template>
                    </div>

                    <div class="stu-comm-detail-comments-section">
                        좋아요 : {{viewList.likeCnt}} 댓글수 : {{viewList.commentCnt}} 
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
                                    <div>
                                        <label for="file-upload" style="cursor: pointer;">
                                            <img src="../src/첨부이모티콘.png" style="width: 25px; height: 25px;">
                                        </label>
                                        <input type="file" id="file-upload" style="display: none;" @change="fnFileChange"/>
                                        <div><img v-if="filePreview" :src="filePreview" style="width: 100px; height: 100px;" /></div> <!-- 이미지 미리보기 -->
                                        <div v-if="fileName">{{ fileName }}</div> <!-- 파일명 표시 -->
                                    </div>
                                </div>
                            </div>
                            <button class="stu-comm-detail-comment-button" @click="fnSave()">등록</button>
                        </div>
                    </div>
                    <template v-if="viewComment.length > 0">
                        <div class="stu-comm-detail-comment-list">
                            <div class="stu-comm-detail-comment-item" v-for="item in viewComment" v-show="!item.parentCommentId">
                                <template v-if="item.upMode === 'N'">
                                    <div><a style="font-size:20px; color:black;" href="#" @click="fnUserboard(item.author,item.userNickName)">{{item.userNickName}}</a></div>
                                    <template v-if="item.commentstatus === 'N'">
                                        <div><a>{{item.comcontents}}</a></div>
                                        <template v-if="item.filePath">
                                            <div><img style="width:200px; height:200px;" :src="item.filePath"></div>
                                        </template>
                                        <template v-if="item.comUpdateDay">
                                            <div><a><small>{{item.comUpdateDay}}(수정됨)</small></a></div>
                                        </template>
                                        <template v-else>
                                            <div><a><small>{{item.comCreateDay}}</small></a></div>
                                        </template>
                                    </template>
                                    <template v-if="item.commentstatus === 'Y' && isAdmin">
                                        <div><a>{{item.comcontents}} <a style="color:red;">( 숨김 처리된 댓글 입니다. 관리자만 보임)</a></a></div>
                                        <template v-if="item.filePath">
                                            <img style="width:200px; height:200px;" :src="item.filePath">
                                        </template>
                                        <div><a><small>{{item.comCreateDay}}</small></a></div>
                                    </template>
                                    <template v-if="item.commentstatus === 'Y' && !isAdmin">
                                        <div><a style="color:red;">관리자에 의해 숨김 처리된 댓글 입니다.</a><div>
                                    </template>    
                                    <template v-if="item.userId === sessionUserId && item.commentstatus === 'N'">
                                        <button @click="fnCommDelete(item.commentId)">삭제</button>
                                        <button @click="fnCommUpdateN(item.commentId)">수정</button>
                                    </template>
                                    <template v-if="isAdmin && item.commentstatus === 'N'">
                                        <button @click="fnCommhide(item.commentId,item.commentstatus)">숨기기</button>
                                    </template>
                                    <template v-if="isAdmin && item.commentstatus === 'Y'">
                                        <button @click="fnCommhide(item.commentId,item.commentstatus)">숨김 해제</button>
                                    </template>
                                    <button @click="fnReChat(item.commentId)">답글</button>
                                    <button @click="fnLikeCheck(item.commentId,'댓글')">좋아요</button> {{item.likeCnt}}
                                    <div style="margin-left : 70px; margin-top:20px;" class="stu-comm-detail-comment-reply" v-for="reply in viewComment" v-show="reply.parentCommentId === item.commentId">
                                        <div><a style="font-size:15px; color:black;" href="#" @click="fnUserboard(reply.author,reply.userNickName)">{{reply.userNickName}}</a></div>
                                        <template v-if="reply.commentstatus === 'N'">
                                            <div><a>{{reply.comcontents}}</a></div>
                                            <template v-if="reply.filePath">
                                                <div><img style="width:200px; height:200px;" :src="reply.filePath"></div>
                                            </template>
                                            <template v-if="reply.comUpdateDay">
                                                <div><a><small>{{reply.comUpdateDay}}(수정됨)</small></a></div>
                                            </template>
                                            <template v-else>
                                                <div><a><small>{{reply.comCreateDay}}</small></a></div>
                                            </template>
                                        </template>
                                        <template v-if="reply.commentstatus === 'Y' && isAdmin">
                                            <div><a>{{reply.comcontents}} <a style="color:red;">( 숨김 처리된 댓글 입니다. 관리자만 보임)</a></a></div>
                                            <template v-if="reply.filePath">
                                                <img style="width:200px; height:200px;" :src="reply.filePath">
                                            </template>
                                            <div><a><small>{{reply.comCreateDay}}</small></a></div>
                                        </template>
                                        <template v-if="reply.commentstatus === 'Y' && !isAdmin">
                                            <div><a style="color:red;">관리자에 의해 숨김 처리된 댓글 입니다.</a><div>
                                        </template>    
                                        <template v-if="reply.userId === sessionUserId && reply.commentstatus === 'N'">
                                            <button @click="fnCommDelete(reply.commentId)">삭제</button>
                                        </template>
                                        <template v-if="isAdmin && reply.commentstatus === 'N'">
                                            <button @click="fnCommhide(reply.commentId,reply.commentstatus)">숨기기</button>
                                        </template>
                                        <template v-if="isAdmin && reply.commentstatus === 'Y'">
                                            <button @click="fnCommhide(reply.commentId,reply.commentstatus)">숨김 해제</button>
                                        </template>
                                        <button @click="fnLikeCheck(reply.commentId,'댓글')">좋아요</button> {{reply.likeCnt}}
                                    </div>
                                    <template v-if="item.reMode === 'Y'">
                                        <div class="stu-comm-detail-comment">
                                            <div style="flex-grow: 1;">
                                                <template v-if="isLogin">
                                                    {{sessionUserNickName}} 님
                                                </template>
                                                <div class="stu-comm-detail-comment-input-container">
                                                    <textarea placeholder="답글을 남겨보세요..." v-model="comcontents" class="stu-comm-detail-comment-textarea" @keyup.enter="fnupdateCommentReResult(item.commentId,comcontents,item.boardId)"></textarea>
                                                    <div>
                                                        <label for="file-upload" style="cursor: pointer;">
                                                            <img src="../src/첨부이모티콘.png" style="width: 25px; height: 25px;">
                                                        </label>
                                                        <input type="file" id="file-upload" style="display: none;" @change="fnFileChange(item.commentId)" />
                                                        <div v-if="fileName || filePreview">
                                                            <img :src="filePreview" style="width: 100px; height: 100px;" v-if="filePreview" />
                                                            <div>{{ fileName }}</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <button class="stu-comm-detail-comment-button" @click="fnupdateCommentReResult(item.commentId,comcontents,item.boardId)">답글 완료</button>
                                            <button class="stu-comm-detail-comment-button" @click="fnReChat(item.boardId)">취소</button>
                                        </div>
                                    </template>
                                </template>
                                <template v-if="item.upMode === 'Y'">
                                    <div class="stu-comm-detail-comment">
                                        <div style="flex-grow: 1;">
                                            <template v-if="isLogin">
                                                {{sessionUserNickName}} 님
                                            </template>
                                            <div class="stu-comm-detail-comment-input-container">
                                                <textarea placeholder="댓글을 남겨보세요..." v-model="item.comcontents" class="stu-comm-detail-comment-textarea" @keyup.enter="fnupdateCommentResult(item.commentId, item.comcontents)"></textarea>
                                                <div>
                                                    <label for="file-upload" style="cursor: pointer;">
                                                        <img src="../src/첨부이모티콘.png" style="width: 25px; height: 25px;">
                                                    </label>
                                                    <input type="file" id="file-upload" style="display: none;" @change="fnFileChange(item.commentId)" />
                                                    <div>
                                                        <img v-if="item.filePath || filePreview" :src="filePreview ? filePreview : item.filePath" style="width: 100px; height: 100px;" />
                                                    </div>
                                                    <div v-if="fileName || item.fileName">{{ fileName ? fileName : item.fileName }}</div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="stu-comm-detail-comment-button" @click="fnupdateCommentResult(item.commentId,item.comcontents)">수정 완료</button>
                                        <button class="stu-comm-detail-comment-button" @click="fnCommUpdateNo(item.boardId)">취소</button>
                                    </div>
                                </template>    
                            </div>
                        </div>
                    </template>
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
                boardId : '${boardId}',
                viewList : {},
                viewComment : [],
                user: '${sessionScope.user}',
                isLogin : false,
                sessionUserId : '',
                file : null,
                contents : "",
                fileName: '', // 파일명 저장
                filePreview: '', // 이미지 미리보기 URL 저장
                selectLikeCheck : {}
            };
        },
        methods: {
			fnupdateCommentReResult(commentId,comcontents,boardId){
              var self = this;
			  if(!comcontents){
				alert("내용을 입력하세요");
				return;
			  };
              var nparmap = { 
                  commentId : commentId,
                  content : comcontents,
				  boardId : boardId,
				  userId : self.sessionUserId
				  
              };
              $.ajax({
                  url:"/updateCommentReResult.dox",
                  dataType:"json",    
                  type : "POST", 
                  data : nparmap,
                  success : function(data) { 
                      alert(data.message);
                      var idx = data.idx;
                      console.log(idx);
                      console.log(self.file);        
                      if (self.file) {
                          const formData = new FormData();
                          formData.append('file1', self.file);
                          formData.append('idx', idx);
                          $.ajax({
                              url: '/fileUpload.dox',
                              type: 'POST',
                              data: formData,
                              processData: false,  
                              contentType: false,  
                              success: function() {
                                  console.log('업로드 성공!');
								  self.fnReChat();
                                  self.fnView();    
                                  self.filePreview ="";
                                  self.fileName ="";
								  self.file = "";
								  self.comcontents="";
                              },
                              error: function(jqXHR, textStatus, errorThrown) {
                                  console.error('업로드 실패!', textStatus, errorThrown);
                              }
                          });        
                      } else{
						  self.fnReChat();
                          self.fnView();    
						  self.filePreview ="";
	                        self.fileName ="";
						  self.comcontents="";
                      }        
                  }
              });
          },        
			fnReCommChat(commentId){
	              var self = this;
	              var boardId = self.boardId;
	              var nparmap = {commentId : commentId};
	              $.ajax({
	                  url:"/updateCommentREY.dox",
	                  dataType:"json",    
	                  type : "POST", 
	                  data : nparmap,
	                  success : function(data) { 
	                      console.log(data);
	                      self.fnView();                        
	                  }
	              });
	          },
            fnReChat(commentId){
               var self = this;
			   if(!self.isLogin){
					alert("로그인 먼저 하세요.");
					document.getElementById('headerLoginModal').showModal();
					document.getElementById('inputId').focus();
					return;
				};
               var boardId = self.boardId;
               var nparmap = {boardId : boardId};
               $.ajax({
                   url:"/updateCommentRENO.dox",
                   dataType:"json",    
                   type : "POST", 
                   data : nparmap,
                   success : function(data) { 
                       console.log(data);
                       self.fnReCommChat(commentId);                        
                   }
               });
	        },
            fnCommUpdateNo(boardId){
                var self = this;
                var nparmap = {boardId : boardId};
                $.ajax({
                    url:"/updateCommentNO.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);        
                        self.fnView();                
                    }
                });
            },
            fnupdateCommentResult(commentId,comcontents){
                var self = this;
                var nparmap = { 
                    commentId : commentId,
                    content : comcontents
                };
                $.ajax({
                    url:"/updateCommentResult.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        alert(data.message);
                        var idx = data.idx;
                        console.log(idx);
                        console.log(self.file);        
                        if (self.file) {
                            const formData = new FormData();
                            formData.append('file1', self.file);
                            formData.append('idx', idx);
                            $.ajax({
                                url: '/fileUpload.dox',
                                type: 'POST',
                                data: formData,
                                processData: false,  
                                contentType: false,  
                                success: function() {
                                    console.log('업로드 성공!');
                                    self.fnView();    
                                    self.filePreview ="";
                                    self.fileName ="";
									self.file = "";
                                },
                                error: function(jqXHR, textStatus, errorThrown) {
                                    console.error('업로드 실패!', textStatus, errorThrown);
                                }
                            });        
                        } else{
                            self.fnView();    
                        }        
                    }
                });
            },        
            fnCommUpdate(commentId){
                var self = this;
                var boardId = self.boardId;
                var nparmap = {commentId : commentId};
                $.ajax({
                    url:"/updateComment.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);
                        self.fnView();                        
                    }
                });
            },
            fnCommUpdateN(commentId){
                var self = this;
                var boardId = self.boardId;
                var nparmap = {boardId : boardId};
                $.ajax({
                    url:"/updateCommentNO.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);
                        self.fnCommUpdate(commentId);                        
                    }
                });
            },
            fnCommhide(commentId,commentstatus){
                var self = this;
                var nparmap = {commentId : commentId, commentstatus : commentstatus };
                $.ajax({
                    url:"/updateStatusBoardComment.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);
                        if(data.commentStatus == "N"){
                            alert("숨김해제 완료");
                        }else{
                            alert("숨김처리 완료");
                        }
                        self.fnView();
                    }
                });
            },    
            fnCommDelete(commentId){
                var self = this;
                var nparmap = {commentId : commentId};
                $.ajax({
                    url:"/deleteBoardComment.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);
                        alert(data.message);
                        self.fnView();
                    }
                });
            },            
            fnUpdate(boardId){
                $.pageChange("/study-comm-Update",{boardId : boardId});
            },
            fnhide(boardstatus){
                var self = this;
                var nparmap = {boardId : self.boardId, boardstatus : boardstatus };
                $.ajax({
                    url:"/updateStatusBoard.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);
                        if(data.resultHide == "N"){
                            alert("숨김해제 완료");
                        }else{
                            alert("숨김처리 완료");
                        }
                        location.href="study-comm"
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
				var self = this;
				if(!self.isLogin){
					alert("로그인 먼저 하세요.");
					document.getElementById('headerLoginModal').showModal();
					document.getElementById('inputId').focus();
					
				}else{
				location.href="commInsert"					
				}
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
                var nparmap = {};
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
				if(!self.isLogin){
					alert("로그인 먼저 하세요.");
					document.getElementById('headerLoginModal').showModal();
					document.getElementById('inputId').focus();
					return;
				};

                var nparmap = {boardId : self.boardId,contents : self.contents,userId : self.sessionUserId };
                $.ajax({
                    url:"/insertViewComment.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        var idx = data.idx;
                        console.log(idx);
                        console.log(self.file);        
                        if (self.file) {
                            const formData = new FormData();
                            formData.append('file1', self.file);
                            formData.append('idx', idx);
                            $.ajax({
                                url: '/fileUpload.dox',
                                type: 'POST',
                                data: formData,
                                processData: false,  
                                contentType: false,  
                                success: function() {
                                    console.log('업로드 성공!');
                                    alert(data.message);
                                    self.contents = "";
                                    self.file = null;
                                    self.fileName = ""; // 파일명 저장
                                    self.filePreview = null;
                                    self.fnView();
                                },
                                error: function(jqXHR, textStatus, errorThrown) {
                                    console.error('업로드 실패!', textStatus, errorThrown);
                                }
                            });        
                        } else{
                            alert(data.message);
                            self.contents = "";
                            self.fnView();
                        }        
                    }
                });
            },
			fnFileChange(event) {
			    const file = event.target.files[0];
			    this.file = file;

			    // 파일명 업데이트
			    this.fileName = file.name;

			    // 이미지 파일인 경우 미리보기 생성
			    if (file && file.type.startsWith('image/')) {
			        const reader = new FileReader();
			        reader.onload = (e) => {
			            this.filePreview = e.target.result;
			        };
			        reader.readAsDataURL(file);
			    } else {
			        this.filePreview = null; // 이미지가 아니면 미리보기 없음
			    }
			},
            fnCommLike(boardId){
                var self = this;
                var nparmap = {boardId : boardId,
                               userId : self.sessionUserId};
                $.ajax({
                    url:"/insertCommLike.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);
                        self.viewList.likeCnt++;
                    }
                });        
            },    
            fnCommentLike(boardId){
                var self = this;
                var nparmap = {boardId : boardId,
                               userId : self.sessionUserId};
                $.ajax({
                    url:"/insertCommentLike.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);
                        self.fnView();
                    }
                });
            },
            fndeleteCommLike(boardId){
                var self = this;
                var nparmap = {boardId : boardId,
                               userId : self.sessionUserId};
                $.ajax({
                    url:"/deleteCommentLike.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);
                        self.viewList.likeCnt--;
                    }
                });        
            },
            fndeleteCommentLike(boardId){
                var self = this;
                var nparmap = {boardId : boardId,
                               userId : self.sessionUserId};
                $.ajax({
                    url:"/deleteCommentLike.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);
                        self.fnView();
                    }
                });
            },                    
            fnLikeCheck(boardId,type) {
                var self = this;
				if(!self.isLogin){
					alert("로그인 먼저 하세요.");
					document.getElementById('headerLoginModal').showModal();
					document.getElementById('inputId').focus();
					return;
				};

                var nparmap = {
                    boardId: boardId,
                    userId: self.sessionUserId
                };
                $.ajax({
                    url: "/selectLikeCheck.dox",
                    dataType: "json",
                    type: "POST",
                    data: nparmap,
                    success: function(data) {
                        console.log(data);
                        console.log(type);
                        if (data.selectLikeCheck) {
                            if (data.selectLikeCheck.targetType === "게시글"){
                                if (confirm("이미 좋아요 하신 게시글입니다. 해제 하시겠습니까?")) {
                                    self.fndeleteCommLike(boardId);
                                } else {
                                    return;
                                }
                            }else{
                                if (confirm("이미 좋아요 하신 댓글입니다. 해제 하시겠습니까?")) {
                                    self.fndeleteCommentLike(boardId);
                                } else {
                                    return;
                                }
                            }
                        } else {
                            if(type === "게시글"){
                                self.fnCommLike(boardId);
                            }else{
                                self.fnCommentLike(boardId);
                            }
                        }
                    }
                });
            },
			fnUserboard(author,userNickName){
		     	 $.pageChange("/study-comm-myboard",{author : author, itemMode : "board", userNickName : userNickName});
	  	    }, 
			fnLogin(){
				var self = this;
				var nparmap = {
					userId : self.userId,
					password : self.password

				};
				$.ajax({
					url:"/login.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data); 
						alert(data.message);
						if(data.result){
							document.getElementById('headerLoginModal').close();
							self.getSharedHeader();
							self.userId = '',
							self.password = ''
						}
					}
				});
            },	   
                
        },
        mounted() {
            var self = this;
            self.fnView();
            self.fnSession();
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					self.isLogin = false;
				};
				self.fnSession();
			});
        }
    });
    app.mount('#app');
</script>

