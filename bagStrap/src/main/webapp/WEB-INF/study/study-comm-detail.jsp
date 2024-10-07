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
		/* 기존 스타일 유지 */

		/* 헤더 스타일 */
		.header {
		    display: flex;
		    width: 100%;
		    height: 60px; /* 적절한 헤더 높이 설정 */
		    background-color: white;
		    color: black;
		    align-items: center;
		    padding: 0 20px;
		    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		    position: sticky;
		    top: 0;
		    z-index: 1000;
		}

		/* 게시글 메인 컨테이너 */
		.stu-comm-detail-main-container {
		    display: flex;
		    flex: 1;
		    background-color: #f9f9f9;
		    box-sizing: border-box;
		    padding: 0px 12vw;
		    min-height: 100vh;
		}

		/* 사이드바 스타일 */
		.stu-comm-detail-sidebar {
		    width: 280px;
		    padding: 20px;
		}

		/* 게시글 컨테이너 */
		.stu-comm-detail-board-container {
		    width: 97%;
		    padding: 5px 0px;
		    background: transparent;
		    margin: 5px auto;
		    margin-left: 20px;
		}

		/* 게시글 헤더 스타일 */
		.stu-comm-detail-board-header {
		    border-bottom: 1px solid #e0e0e0;
		    padding-bottom: 10px;
		    margin-bottom: 20px;
		    position: relative; /* 드롭다운 위치 조정을 위해 추가 */
		}

		/* 게시글 헤더의 ⋮ 버튼 위치 조정 */
		.stu-comm-detail-board-header .dropdown {
		    position: absolute;
		    top: 0;
		    right: 0;
		}

		/* 게시글 제목 스타일 */
		.stu-comm-detail-board-title {
		    font-size: 28px;
		    color: #333;
		    margin: 10px 0;
		}

		/* 프로필 섹션 (변경 없음) */
		.stu-comm-detail-profile {
		    display: flex;
		    align-items: center;
		    margin-top: 15px;
		}

		.stu-comm-detail-profile-img {
		    width: 50px;
		    height: 50px;
		    border-radius: 50%;
		    margin-right: 15px;
		    cursor: pointer;
		    object-fit: cover;
		}

		.stu-comm-detail-profile-info a {
		    font-size: 14px;
		    color: #555;
		    text-decoration: none;
		}

		.stu-comm-detail-profile-info a:hover {
		    text-decoration: underline;
		}

		/* 댓글 작성 섹션 */
		.stu-comm-detail-comment {
		    display: flex;
		    align-items: flex-start;
		    background-color: #f1f1f1;
		    border-radius: 8px;
		    padding: 15px;
		    margin-bottom: 20px;
			margin-top: 20px;
			margin-left : 40px;
		}

		.stu-comm-detail-comment textarea {
		    width: 100%;
		    padding: 12px;
		    border: 1px solid #e0e0e0;
		    border-radius: 5px;
		    resize: none;
		    font-size: 14px;
		    margin-right: 10px;
		}

		.stu-comm-detail-comment-button {
		    padding: 10px 20px;
		    background-color: #343A40;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 14px;
		    height: 40px;
		    align-self: flex-end;
		}

		.stu-comm-detail-comment-button:hover {
		    background-color: #23272B;
		}

		/* 파일 업로드 및 미리보기 */
		.stu-comm-detail-comment-input-container {
		    display: flex;
		    align-items: center;
		    margin-top: 10px;
		}

		.stu-comm-detail-comment-input-container img {
		    cursor: pointer;
		    margin-right: 10px;
		    width: 25px;
		    height: 25px;
		}

		.stu-comm-detail-comment-input-container img:hover {
		    opacity: 0.8;
		}

		.stu-comm-detail-comment-input-container input[type="file"] {
		    display: none;
		}

		.stu-comm-detail-comment-input-container .file-preview {
		    width: 100px;
		    height: 100px;
		    margin-top: 10px;
		    border-radius: 8px;
		    object-fit: cover;
		}

		.stu-comm-detail-comment-input-container div {
		    margin-top: 10px;
		}

		/* 댓글 리스트 */
		.stu-comm-detail-comment-list {
		    margin-top: 40px;
		    padding: 15px;
		    background-color: #f9f9f9;
		    border-radius: 8px;
			margin-bottom:140px;
		}

		.stu-comm-detail-comment-item {
		    padding: 15px;
		    border-bottom: 1px solid #e0e0e0;
		    position: relative; /* 드롭다운 위치 조정을 위해 추가 */
		    background-color: #fff;
		    border-radius: 8px;
		    margin-bottom: 10px;
		}

		.stu-comm-detail-comment-item:last-child {
		    border-bottom: none;
		}

		/* 댓글의 ⋮ 버튼 위치 조정 */
		.stu-comm-detail-comment-item .dropdown {
		    position: absolute;
		    top: 15px;
		    right: 15px;
		}

		/* 댓글 내용 스타일 */
		.stu-comm-detail-comment-item a {
		    font-size: 16px;
		    color: #333;
		    text-decoration: none;
		}

		.stu-comm-detail-comment-item a:hover {
		    text-decoration: underline;
		}

		.stu-comm-detail-comment-item strong {
		    font-weight: bold;
		    margin-right: 5px;
		}

		.stu-comm-detail-comment-item small {
		    color: #777;
		    display: block;
		    margin-top: 5px;
		}

		/* 좋아요 버튼 스타일 개선 */
		.stu-comm-detail-comment-item button,
		.stu-comm-detail-comment-reply button {
		    background: none;
		    border: none;
		    cursor: pointer;
		    font-size: 16px; /* 크기 줄임 */
		    color: red;
		    margin-top: 10px;
		}

		.stu-comm-detail-comment-item button:hover,
		.stu-comm-detail-comment-reply button:hover {
		    opacity: 0.8;
		}

		/* 답글 섹션 */
		.stu-comm-detail-comment-reply {
		    margin-left: 40px;
		    margin-top: 20px;
		    padding: 15px;
		    background-color: #f1f1f1;
		    border-radius: 8px;
		    border: 1px solid #ddd;
		    position: relative; /* 드롭다운 위치 조정을 위해 추가 */
		}

		.stu-comm-detail-comment-reply .dropdown {
		    position: absolute;
		    top: 15px;
		    right: 15px;
		}

		/* 답글 내용 스타일 */
		.stu-comm-detail-comment-reply a {
		    font-size: 15px;
		    color: #333;
		    text-decoration: none;
		}

		.stu-comm-detail-comment-reply a:hover {
		    text-decoration: underline;
		}

		.stu-comm-detail-comment-reply strong {
		    font-weight: bold;
		    margin-right: 5px;
		}

		.stu-comm-detail-comment-reply small {
		    color: #777;
		    display: block;
		    margin-top: 5px;
		}

		/* 댓글 및 대댓글 내용 마진 추가 */
		.stu-comm-detail-comment-item .stu-comm-detail-comment-content,
		.stu-comm-detail-comment-reply .stu-comm-detail-comment-content {
		    margin-top: 10px;
		    margin-bottom: 5px;
		}

		/* 텍스트 영역 개선 */
		.stu-comm-detail-comment-textarea {
		    font-family: inherit;
		    font-size: 14px;
		    color: #333;
		}

		/* 기타 전반적인 텍스트 스타일 */
		body {
		    font-family: 'Noto Sans KR', sans-serif;
		    color: #333;
		}

		/* 드롭다운 버튼 스타일 */
		.dropdown-button {
		    background: none;
		    border: none;
		    cursor: pointer;
		    font-size: 18px;
		    color: black;
		    padding: 5px;
		}

		.dropdown-content {
		    display: none;
		    position: absolute;
		    right: 0;
		    background-color: #f9f9f9;
		    min-width: 160px;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		    z-index: 1;
		    border-radius: 5px;
		    padding: 5px 0;
		}

		.dropdown-content button {
		    width: 100%;
		    padding: 10px 16px;
		    text-align: left;
		    background: none;
		    border: none;
		    cursor: pointer;
		    font-size: 14px;
		    color: black;
		}

		.dropdown-content button:hover {
		    background-color: #f1f1f1;
		}

		.dropdown:hover .dropdown-content {
		    display: block;
		}
	    </style>
	</head>
	<body>
	    <main class="main-container">
	        <aside class="sidebar">
	            <jsp:include page="/layout/study_comm_sidebar.jsp"></jsp:include>  
	        </aside>
	        <div id="app" class="content">
	            <div class="stu-comm-detail-board-container">
	                <div class="stu-comm-detail-board-header">
	                    <a class="stu-comm-detail-board-type" href="#" @click="fnBoardTypeList(viewList.boardTypeId,viewList.name)">{{viewList.name}}</a>
	                    <h1 class="stu-comm-detail-board-title">{{viewList.title}}</h1>
	                    <div class="stu-comm-detail-profile">
	                        <template v-if="viewList.userFile">
	                            <img :src="viewList.userFile" alt="프로필 사진" class="stu-comm-detail-profile-img" @click="fnUserboard(viewList.author,viewList.userNickName)">
	                        </template>
	                        <template v-if="!viewList.userFile">
	                            <img src="../src/profile.png" alt="프로필 사진" class="stu-comm-detail-profile-img" @click="fnUserboard(viewList.author,viewList.userNickName)">
	                        </template>
	                        <div class="stu-comm-detail-profile-info">
	                            <div><a href="#" @click="fnUserboard(viewList.author,viewList.userNickName)"><strong>{{viewList.userNickName}} 님</strong></a></div>
	                            <div><a href="#" @click="fnUserboard(viewList.author,viewList.userNickName)">{{viewList.createdDate}} 조회 : {{viewList.views}}</a></div>
	                        </div>
	                        <!-- 좋아요 버튼을 하트 아이콘으로 변경 -->
	                        <button @click="fnLikeCheck(viewList.boardId,'게시글')" style="background: none; border: none; cursor: pointer; font-size: 20px; color: red; margin-bottom:-15px;">&#10084; {{viewList.likeCnt}}</button>
	                        <!-- 드롭다운 버튼 시작 -->
	                        <div class="dropdown">
	                            <button class="dropdown-button" style="background:#F1F1F1; color:black;">⋮</button>
	                            <div class="dropdown-content">
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
	                            </div>
	                        </div>
	                    </div>
	                </div>

	                <div class="stu-comm-detail-board-content">
	                    <div v-html="viewList.content"></div>
	                    <template v-if="viewList.filePath">
	                        <img style="width:400px; height:400px;" :src="viewList.filePath">
	                    </template>
	                </div>

	                <div class="stu-comm-detail-comments-section" style="margin-top:30px;">
	                    <span>좋아요 : {{viewList.likeCnt}}</span>
	                    <span>댓글수 : {{viewList.commentCnt}}</span>
	                    
	                    <!-- 댓글 작성 섹션 -->
	                    <div class="stu-comm-detail-comment">
	                        <div style="flex-grow: 1;">
	                            <template v-if="isLogin">
	                                <span>{{sessionUserNickName}} 님</span>
	                            </template>
	                            <template v-if="!isLogin">
	                                <span>로그인 먼저 하세요</span>
	                            </template>
	                            <div class="stu-comm-detail-comment-input-container">
	                                <textarea placeholder="댓글을 남겨보세요..." v-model="contents" class="stu-comm-detail-comment-textarea" @keyup.enter="fnSave()"></textarea>
	                                <div>
	                                    <label for="file-upload" style="cursor: pointer;">
	                                        <img src="../src/첨부이모티콘.png" style="width: 25px; height: 25px;">
	                                    </label>										
	                                    <input type="file" id="file-upload" style="display: none;" @change="fnFileChange"/>
										<template v-if="imageView === '1'">
										<div v-if="filePreview">
	                                        <img :src="filePreview" class="file-preview" />
	                                    </div>
	                                    <div v-if="fileName">{{ fileName }}</div>
										</template>
										
	                                </div>
	                            </div>
	                        </div>
	                        <button class="stu-comm-detail-comment-button" @click="fnSave()" style="background-color: #343A40;">등록</button>
	                    </div>

	                    <!-- 댓글 리스트 -->
	                    <template v-if="viewComment.length > 0">
	                        <div class="stu-comm-detail-comment-list">
	                            <div class="stu-comm-detail-comment-item" v-for="item in viewComment" v-show="!item.parentCommentId">
	                                <template v-if="item.upMode === 'N'">
	                                    <div><a style="font-size:20px; color:black;" href="#" @click="fnUserboard(item.author,item.userNickName)">{{item.userNickName}}</a></div>
	                                    <template v-if="item.commentstatus === 'N'">
	                                        <div style="width:90%;">{{item.comcontents}}</div>
	                                        <template v-if="item.filePath">
	                                            <div><img style="width:200px; height:200px;" :src="item.filePath"></div>
	                                        </template>
	                                        <template v-if="item.comUpdateDay">
	                                            <div><small>{{item.comUpdateDay}}(수정됨)</small></div>
	                                        </template>
	                                        <template v-else>
	                                            <div><small>{{item.comCreateDay}}</small></div>
	                                        </template>
	                                    </template>
	                                    <template v-if="item.commentstatus === 'Y' && isAdmin">
	                                        <div style="width:90%;">{{item.comcontents}} <span style="color:red;">(숨김 처리된 댓글 입니다. 관리자만 보임)</span></div>
	                                        <template v-if="item.filePath">
	                                            <img style="width:200px; height:200px;" :src="item.filePath">
	                                        </template>
	                                        <div><small>{{item.comCreateDay}}</small></div>
	                                    </template>
	                                    <template v-if="item.commentstatus === 'Y' && !isAdmin">
	                                        <div style="color:red;">관리자에 의해 숨김 처리된 댓글 입니다.</div>
	                                    </template>
	                                    <!-- 드롭다운 버튼 시작 -->
	                                    <div class="dropdown">
	                                    <!-- 좋아요 버튼을 하트 아이콘으로 변경 -->
	                                    <button @click="fnLikeCheck(item.commentId,'댓글')">&#10084; {{item.likeCnt}}</button>
	                                        <button class="dropdown-button">⋮</button>
	                                        <div class="dropdown-content">
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
	                                        </div>
	                                    </div>
	                                    
	                                    <!-- 대댓글 리스트 -->
	                                    <div class="stu-comm-detail-comment-reply" v-for="reply in viewComment" v-show="reply.parentCommentId === item.commentId">
	                                        <div><a style="font-size:15px; color:black;" href="#" @click="fnUserboard(reply.author,reply.userNickName)">{{reply.userNickName}}</a></div>
	                                        <template v-if="reply.commentstatus === 'N'">
	                                            <div style="width:90%;">{{reply.comcontents}}</div>
	                                            <template v-if="reply.filePath">
	                                                <div><img style="width:200px; height:200px;" :src="reply.filePath"></div>
	                                            </template>
	                                            <template v-if="reply.comUpdateDay">
	                                                <div><small>{{reply.comUpdateDay}}(수정됨)</small></div>
	                                            </template>
	                                            <template v-else>
	                                                <div><small>{{reply.comCreateDay}}</small></div>
	                                            </template>
	                                        </template>
	                                        <template v-if="reply.commentstatus === 'Y' && isAdmin">
	                                            <div >{{reply.comcontents}} <span style="color:red;">(숨김 처리된 댓글 입니다. 관리자만 보임)</span></div>
	                                            <template v-if="reply.filePath">
	                                                <img style="width:200px; height:200px;" :src="reply.filePath">
	                                            </template>
	                                            <div><small>{{reply.comCreateDay}}</small></div>
	                                        </template>
	                                        <template v-if="reply.commentstatus === 'Y' && !isAdmin">
	                                            <div style="color:red;">관리자에 의해 숨김 처리된 댓글 입니다.</div>
	                                        </template>
	                                        <!-- 드롭다운 버튼 시작 -->
	                                        <div class="dropdown">
	                                        <!-- 좋아요 버튼을 하트 아이콘으로 변경 -->
	                                        <button @click="fnLikeCheck(reply.commentId,'댓글')">&#10084; {{reply.likeCnt}}</button>
	                                            <button class="dropdown-button">⋮</button>
	                                            <div class="dropdown-content">
	                                                <template v-if="reply.userId === sessionUserId && reply.commentstatus === 'N'">
	                                                    <button @click="fnCommDelete(reply.commentId)">삭제</button>
	                                                </template>
	                                                <template v-if="isAdmin && reply.commentstatus === 'N'">
	                                                    <button @click="fnCommhide(reply.commentId,reply.commentstatus)">숨기기</button>
	                                                </template>
	                                                <template v-if="isAdmin && reply.commentstatus === 'Y'">
	                                                    <button @click="fnCommhide(reply.commentId,reply.commentstatus)">숨김 해제</button>
	                                                </template>
	                                            </div>
	                                        </div>
	                                    </div>

	                                    <!-- 답글 입력 섹션 -->
	                                    <template v-if="item.reMode === 'Y'">
	                                        <div class="stu-comm-detail-comment">
	                                            <div style="flex-grow: 1;">
	                                                <template v-if="isLogin">
	                                                    <span>{{sessionUserNickName}} 님</span>
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
	                                            <button class="stu-comm-detail-comment-button" @click="fnupdateCommentReResult(item.commentId,comcontents,item.boardId)" >답글 완료</button>
	                                            <button class="stu-comm-detail-comment-button" @click="fnReChat(item.boardId)" >취소</button>
	                                        </div>
	                                    </template>
	                                </template>
	                                <template v-if="item.upMode === 'Y'">
	                                    <div class="stu-comm-detail-comment">
	                                        <div style="flex-grow: 1;">
	                                            <template v-if="isLogin">
	                                                <span>{{sessionUserNickName}} 님</span>
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
	                                        <button class="stu-comm-detail-comment-button" @click="fnupdateCommentResult(item.commentId,item.comcontents)" >수정 완료</button>
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
                selectLikeCheck : {},
				imageView : '1'
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
								  self.imageView = '1'; 
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
						  self.imageView = '1'; 
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
				self.imageView = '2'; 
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
				self.imageView = '1'; 
                var nparmap = {boardId : boardId};
                $.ajax({
                    url:"/updateCommentNO.dox",
                    dataType:"json",    
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);        
                        self.fnView();                
						self.filePreview ="";
						self.fileName ="";
						self.file = "";
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
									self.imageView = '1'; 
                                },
                                error: function(jqXHR, textStatus, errorThrown) {
                                    console.error('업로드 실패!', textStatus, errorThrown);
                                }
                            });        
                        } else{
                            self.fnView();    
							self.imageView = '1'; 
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
				self.imageView = '2'; 
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
			
			
	// (추가) 로그인 상태가 변경되었을 때 세션 정보 다시 로드
	        window.addEventListener('loginStatusChanged', function () {
	            self.fnSession();  // (추가) 로그인 상태가 변경되었을 때 자동으로 세션 정보 업데이트
	        });
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

