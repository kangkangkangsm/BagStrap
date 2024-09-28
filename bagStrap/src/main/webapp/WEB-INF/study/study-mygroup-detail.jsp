<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
   <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/style.css">
   <title>첫번째 페이지</title>
</head>
<style>
	body, html {
	    height: 100%;
	    margin: 0;
	    font-family: Arial, sans-serif;
	}
	.study-mygroup-detail-member-admin-panel-container {
	  display: block;
	  margin: 0 auto;
	}

	.study-mygroup-detail-member-admin-header {
	    text-align: center;
	    margin-bottom: 30px;
	}

	.study-mygroup-detail-member-admin-header h2 {
	    color: #2c3e50;
	    font-size: 1.8em;
	}

	.study-mygroup-detail-member-admin-header p {
	    color: #7f8c8d;
	    font-size: 1em;
	}

	/* 콘텐츠 영역 레이아웃 */
	.study-mygroup-detail-member-admin-content {
	  display: block; /* 상하 레이아웃으로 변경 */
	  align-items: center;
	  justify-content: center;
	}

	/* 테이블 스타일 */
	.study-mygroup-detail-member-admin-table {
	  margin: 20px auto;
	}

	.study-mygroup-detail-member-admin-table h3 {
	    margin-bottom: 20px;
	    color: #2c3e50;
	    font-size: 1.4em;
	    text-align: center;
	}

	/* 테이블 스타일링 */
	.study-mygroup-detail-member-admin-table table {
	    width: 100%;
	    border-collapse: collapse;
	}

	.study-mygroup-detail-member-admin-table th,
	.study-mygroup-detail-member-admin-table td {
	    padding: 10px;
	    text-align: center;
	    border-bottom: 1px solid #ecf0f1;
		line-height: 40px;
		
	}

	.study-mygroup-detail-member-admin-table th {
	    background-color: #f7f9fa;
	    color: #34495e;
	    font-weight: bold;
		line-height: 40px;
	}

	.study-mygroup-detail-member-admin-table tr:hover {
	    background-color: #f1f2f6;
	}

	/* 프로필 이미지 스타일 */
	.study-mygroup-detail-member-profile-img {
	    width: 40px;
	    height: 40px;
	    border-radius: 50%;
	}

	/* 버튼 스타일 */
	.study-mygroup-detail-member-btn {
	    padding: 8px 8px;
	    border-radius: 5px;
	    border: none;
	    cursor: pointer;
	    font-size: 0.9em;
	    color: #fff;
	    margin: 0 2px;
	    transition: background-color 0.3s ease;
	    min-width: 50px;
	}

	/* 그룹장 위임 버튼 */
	.study-mygroup-detail-member-assign-btn {
	    background-color: #3498db;
	}

	.study-mygroup-detail-member-assign-btn:hover {
	    background-color: #2980b9;
	}

	/* 강퇴 버튼 */
	.study-mygroup-detail-member-remove-btn {
	    background-color: #e74c3c;
	}

	.study-mygroup-detail-member-remove-btn:hover {
	    background-color: #c0392b;
	}

	/* 승인 버튼 */
	.study-mygroup-detail-member-approve-btn {
	    background-color: #2ecc71;
	}

	.study-mygroup-detail-member-approve-btn:hover {
	    background-color: #27ae60;
	}

	/* 거절 버튼 */
	.study-mygroup-detail-member-reject-btn {
	    background-color: #e74c3c;
	}

	.study-mygroup-detail-member-reject-btn:hover {
	    background-color: #c0392b;
	}
   </style>
<body>
   <div id="app">
      <main class="main-container">
           <aside class="sidebar">
         <jsp:include page="/layout/header_sidebar.jsp"></jsp:include>
           </aside>
         <div class="study-mygroup-detail2-content">
             <div class="study-mygroup-detail2-container">
                 <!-- 사이드바 시작 -->
                 <div class="study-mygroup-detail2-sidebar">
                     <!-- 로그인 유저 이름 -->
                     <div class="session-user-name">{{sessionUserNickName}}님</div>

			            <!-- 상단 메뉴 -->
			            <div class="study-mygroup-detail2-sidebar-top"> 
			                <ul>
			                    <li @click="fnSidebar('1')">그룹 정보</li>
			                    <li @click="fnSidebar('2')">자유게시판</li>
			                </ul>
							<template v-if="adminlist.userId === sessionUserId">
			                <ul>
			                    <li @click="fnSidebar('3')">회원 관리</li>
			                    <li @click="fnSidebar('4')">그룹 관리</li>
			                </ul>
							</template>
			            </div>

			            <!-- 가입한 유저 목록 -->
			            <div class="study-mygroup-detail2-sidebar-bottom">
			                <div class="joined-users-title">가입한 유저 목록</div>
			                <ul>
			                    <!-- 관리자 -->
			                    <li>
									<template v-if="adminlist.filePath">
									<img :src="adminlist.filePath" alt="유저 사진" />
									</template>
									<template v-if="!adminlist.filePath">
									<img src="../src/profile.png" alt="유저 사진" />
									</template>
			                        <span>👑 {{adminlist.userNickName}}</span>
			                    </li>
			                    <!-- 일반 유저 목록 -->
			                    <li v-for="item in searchjoinGroup">
									<template v-if="item.filePath">
									<img :src="item.filePath" alt="유저 사진" />
									</template>
									<template v-if="!item.filePath">
									<img src="../src/profile.png" alt="유저 사진" />
									</template>
									<template v-if="item.userId === sessionUserId">
			                        <span>{{item.userNickName}}(나)</span>
									</template>
									<template v-else>
			                        <span>{{item.userNickName}}</span>
									</template>
			                    </li>
			                </ul>
			            </div>
			        </div>
			        <!-- 사이드바 끝 -->

                 <!-- 콘텐츠 영역 -->
                 <div class="study-mygroup-detail2-content">
                     <div class="study-mygroup-detail2-top-bar"></div>
                     <div class="study-mygroup-detail2-email-list">
                     <div class="study-meta">
                     
                     <!-- ===========================================그룹정보=========================================== -->
                     <template v-if = "pageView == '1'">
                     <div class="stu-group-detail">
                           <img src="../src/스터디디테일.png" alt="책 표지" style="width: 100%; max-width: 400px; display: block; margin: 0 auto 20px auto;">

                           <h1>[ {{ detailList.name }} ] {{ detailList.studyName }}</h1>
                           <div class="intro">
                           </div>

								<span>🔍 그룹 진행 방식</span>
				               <div class="details">
								   <span>👑 {{adminlist.userNickName}} </span>
				                   <span>👥 {{ detailList.applyY }} / {{ detailList.maxparticipants }}</span>
				                   <span>스터디 방식: {{ detailList.onOffMode }}</span>
				                   <span>성별 : {{ detailList.genderGroup }}</span>
				                   <span>연령대: {{ detailList.age }}</span>
								<span> 스터디 시간:  {{ detailList.stgStudyTime }} </span>
				               </div>
			                   <span>💡 그룹 소개</span>
				               <div class="details">
								<span>{{ detailList.description }}</span>
				               </div>
							   <span>나의학습목표</span>
   							   <div class="details">
   								<span>{{ searchUserlist.studygoal }}</span>
   	   			               </div>
				               <h2>그룹 관련 도서 정보</h2>
				               <div class="book-info">
				                   <img :src="detailList.image" alt="책 표지">
				                   <div class="book-details">
				                       <h3>{{ detailList.title }}</h3>
				                       <p>저자: {{ detailList.author }}</p>
				                       <p>평점: ★★★★☆</p>
				                       <p>소개: {{ detailList.tbDescription }}</p>
				                   </div>
				               </div>
				           </div>
						   </template>
						   <!-- ===========================================그룹 정보=========================================== -->
						   <!-- ===========================================자유게시판=========================================== -->
						   <template v-if = "pageView == '2'">
							자유게시판
							</template>
						   <!-- ===========================================자유게시판=========================================== -->
						   <!-- ===========================================회원관리=========================================== -->
						   <template v-if="pageView == '3'">
						     <div class="study-mygroup-detail-member-admin-panel-container" style="max-width: 800px; width: 100%; margin: auto;">
						       <!-- 페이지 헤더 -->
						       <div class="study-mygroup-detail-member-admin-header">
						         <p>여기에서 그룹원 관리 및 가입 신청을 처리할 수 있습니다.</p>
						       </div>

						       <!-- 메인 콘텐츠 영역 (상하 레이아웃) -->
						       <div class="study-mygroup-detail-member-admin-content" style="display: block;">
						         
						         <!-- 좌측 회원 리스트 (1단) -->
						         <details id="memberListfirst" class="study-mygroup-detail-member-admin-table" @toggle="closeOtherDetails('memberListDetails')" style="margin-bottom: 20px; max-width: 800px; width: 100%;">
						           <summary style="cursor: pointer; padding: 10px; background: #f7f9fa; border: 1px solid #ddd; border-radius: 4px; text-align: center;">
						             회원 리스트
						           </summary>
						           
						           <!-- 드롭다운 내용 -->
						           <div style="margin-top: 10px;">
						             <table>
						               <thead>
						                 <tr>
						                   <th>프로필</th>
						                   <th>닉네임</th>
						                   <th>활동</th>
						                 </tr>
						               </thead>
						               <tbody>
						                 <tr>
						                   <td>
						                     <template v-if="adminlist.filePath">
						                       <img :src="adminlist.filePath" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
						                     </template>
						                     <template v-if="!adminlist.filePath">
						                       <img src="../src/profile.png" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
						                     </template>
						                   </td>
						                   <td>👑{{adminlist.userNickName}}</td>
						                   <td class="study-mygroup-detail-member-action-buttons"> 그룹장</td>
						                 </tr>
						                 <tr v-for="item in searchjoinGroup">
						                   <template v-if="item.rejectionMessage !== 'Y'">
						                     <td>
						                       <template v-if="item.filePath">
						                         <img :src="item.filePath" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
						                       </template>
						                       <template v-if="!item.filePath">
						                         <img src="../src/profile.png" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
						                       </template>
						                     </td>
						                     <td>{{item.userNickName}}</td>
						                     <td class="study-mygroup-detail-member-action-buttons">
						                       <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-assign-btn" @click="fnassignLeader(item.fetchappuserid,item.userNickName )">그룹장 위임</button>
						                       <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-remove-btn" @click="removeMember(item.fetchappuserid)">강퇴</button>
						                     </td>
						                   </template>
						                   <template v-else>
						                     <td colspan="2">
						                       <input type="text" style="height:40px; width:100%;" v-model="rejectionMessage" placeholder="강퇴 사유를 입력해주세요." />
						                     </td>
						                     <td class="study-mygroup-detail-member-action-buttons">
						                       <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-remove-btn" @click="removeMemberResult(item.fetchappuserid,item.userNickName)">강퇴</button>
											   <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-remove-btn" @click="removeMember()">취소</button>
						                     </td>
						                   </template>
						                 </tr>
						               </tbody>
						             </table>
						           </div>
						         </details>

						         <!-- 우측 가입 신청 목록 (2단) -->
						         <details id="memberListSecond" class="study-mygroup-detail-member-admin-table" @toggle="closeOtherDetails('memberListSecond')" style="margin-bottom: 20px; max-width: 800px; width: 100%;">
						           <summary style="cursor: pointer; padding: 10px; background: #f7f9fa; border: 1px solid #ddd; border-radius: 4px; text-align: center;">
						             가입 신청 목록
						           </summary>
						           
						           <!-- 드롭다운 내용 -->
						           <div style="margin-top: 10px;">
						             <table>
						               <thead>
						                 <tr>
						                   <th>프로필</th>
						                   <th>닉네임</th>
						                   <th>활동</th>
						                 </tr>
						               </thead>
						               <tbody>
										<template v-for="item in searchnotjoinGroup">
						                 <tr>
						                   <td>
						                     <template v-if="item.filePath">
						                       <img :src="item.filePath" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
						                     </template>
						                     <template v-if="!item.filePath">
						                       <img src="../src/profile.png" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
						                     </template>
						                   </td>
						                   <td>{{item.userNickName}}</td>
						                   <td class="study-mygroup-detail-member-action-buttons">
						                     <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-approve-btn" @click="approveMember(item)">승인</button>
						                     <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-reject-btn" @click="rejectMember(item)">거절</button>
						                   </td>
						                 </tr>
										 </template>
						               </tbody>
						             </table>
						           </div>
						         </details>

								 <!-- 우측 가입 신청 목록 (하단) -->
 						         <details id="memberListthird" class="study-mygroup-detail-member-admin-table" @toggle="closeOtherDetails('memberListthird')" style="margin-bottom: 20px; max-width: 800px; width: 100%;">
 						           <summary style="cursor: pointer; padding: 10px; background: #f7f9fa; border: 1px solid #ddd; border-radius: 4px; text-align: center;">
 						             가입 차단된 사용자 리스트(강퇴)
 						           </summary>
								   
								   <!-- 드롭다운 내용 -->
	   					           <div style="margin-top: 10px;">
	   					             <table>
	   					               <thead>
	   					                 <tr>
	   					                   <th>프로필</th>
	   					                   <th>닉네임</th>
										   <th>차단사유</th>
	   					                   <th>활동</th>
	   					                 </tr>
	   					               </thead>
	   					               <tbody>
	   					                 <tr v-for="item in searchnotLeaveGroup">
	   					                   <td>
	   					                     <template v-if="item.filePath">
	   					                       <img :src="item.filePath" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
	   					                     </template>
	   					                     <template v-if="!item.filePath">
	   					                       <img src="../src/profile.png" class="study-mygroup-detail-member-profile-img" alt="유저 사진" />
	   					                     </template>
	   					                   </td>
	   					                   <td>{{item.userNickName}}</td>
										   <td>{{item.rejectionMessage}}</td>
	   					                   <td class="study-mygroup-detail-member-action-buttons">
	   					                     <button class="study-mygroup-detail-member-btn study-mygroup-detail-member-approve-btn" @click="fnStuGroupUnblocking(item.fetchappuserid)">차단해제</button>
	   					                   
	   					                   </td>
	   					                 </tr>
	   					               </tbody>
	   					             </table>
	   					           </div>
	   					         </details>
								 
						       </div>
						     </div>
						   </template>

   						   <!-- ===========================================회원관리=========================================== -->
						   <!-- ===========================================그룹관리=========================================== -->
   						   <template v-if = "pageView == '4'">
							
									  
							      <div class="study-group-insert-form-group">
							          <label for="field">스터디 영역</label>
							         <input type="text" id="studyName" name="studyName" v-model="detailList.name" maxlength="24" disabled>
							      </div>
								  <div class="study-group-insert-form-group">
							          <label for="studyName">스터디 이름 (24자 이내)</label>
							          <input type="text" id="studyName" name="studyName" v-model="detailList.studyName" maxlength="24">
							      </div>
							      <div class="study-group-insert-form-group">
							          <label for="startDate">스터디 기간 (시작일)</label>
							          <input type="date" id="startDate" name="startDate" v-model="detailList.stgStartDate">
							      </div>
							      <div class="study-group-insert-form-group">
							          <label for="endDate">스터디 기간 (종료일)</label>
							          <input type="date" id="endDate" name="endDate" v-model="detailList.stgEndDate">
							      </div>
							      <div class="study-group-insert-form-group">
							          <label for="time">스터디 시간 설정</label>
							          <input type="time" id="time" name="time" v-model="detailList.stgStudyTime">
							      </div>
							      <div class="study-group-insert-form-group">
							          <label for="ageGroup">연령별</label>
							          <select id="ageGroup" name="ageGroup" v-model="detailList.age">
							              <option value="중딩">중딩</option>
										  <option value="고딩">고딩</option>
										  <option value="대딩">대딩</option>
										  <option value="성딩">성인</option>
							          </select>
							      </div>
							      <div class="study-group-insert-form-group">
							          <label for="studyType">온라인/오프라인</label>
							          <select id="studyType" name="studyType" v-model="detailList.onOffMode">
							              <option value="온라인">온라인</option>
										  <option value="오프라인">오프라인</option>
										  <option value="">혼합</option>
							              <!-- 온라인/오프라인 추가 -->
							          </select>
							      </div>
							      <div class="study-group-insert-form-group">
							          <label for="members">모집 인원</label>
							          <select id="members" name="members" v-model="detailList.maxparticipants">
										  <option value="2">1:1(과외)</option>
										  <option value="3">3명</option>
										  <option value="4">4명</option>
										  <option value="5">5명</option>
										  <option value="6">6명</option>
										  <option value="7">7명</option>
										  <option value="8">8명</option>
										  <option value="9">9명</option>
										  <option value="10">10명</option>
										  <option value="11">11명</option>
										  <option value="12">12명</option>
										  <option value="13">13명</option>
										  <option value="14">14명</option>
										  <option value="15">15명</option>
										  <option value="16">16명</option>
										  <option value="17">17명</option>
										  <option value="18">18명</option>
										  <option value="19">19명</option>
										  <option value="20">20명</option>
										</select>
							      </div>
								  <div class="study-group-insert-form-group">
				  			    	   <label for="gender">성별</label>
									   <select id="gender" name="gender" v-model="detailList.genderGroup">
									 	   <option value="남성">남성</option>
						            	   <option value="여성">여성</option>
						            	   <option value="">성별무관</option>
						          </select>
				  			      </div>
							      <div class="study-group-insert-form-group">
							          <label for="book">참고 할 교재</label>
							          <div class="study-group-insert-book-list">
							              <select id="book" name="book" v-model="﻿detailList.bookId">
							                  <option v-for="item in typeList" :value="item.bookId">{{item.title}}</option>
							                  <!-- 책 리스트 추가 -->
							              </select>
							          </div>
							      </div>
								  <div class="study-group-insert-form-group">
					  		          <label for="description">스터디 설명 (50자이내)</label>
					  		          <input type="text" id="description" name="description" v-model="detailList.description" maxlength="50" style="height:67px;">
					  		      </div>
								  <label for="file">변경할 스터디 그룹 이미지</label>
								        <input type="file" style="margin-top:-5px;" @change="fnFileChange"/>
								        <input type="file" id="file-upload" style="display: none;" @change="fnFileChange"/>
										<div><img v-if="filePreview" :src="filePreview" style="margin-top:10px; width: 100px; height: 100px;" /></div> <!-- 이미지 미리보기 -->
							      <button class="study-group-insert-submit-btn" 
								  @click="fnGroupUpdate(detailList.studyName,detailList.stgStartDate,detailList.stgEndDate,
								  detailList.stgStudyTime,detailList.age,detailList.onOffMode,detailList.genderGroup,detailList.bookId,detailList.description)">변경완료</button>
								  <button class="study-group-insert-submit-btn" @click="fnback()">취소</button>
							  </div>
   							</template>
   						   <!-- ===========================================그룹관리=========================================== -->
				        </div>
				    </div>
				</div>
	        </div>
	    </main>
	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>
<script>
	//localStorage.setItem('data', JSON.stringify(data));
	// JSON.parse(localStorage.getItem('data')).result
	 const app = Vue.createApp({
	        data() {
	            return {
					isLogin: false,
					sessionUserId: '',
					sessionUserNickName: '',
					studyGroupId: '${studyGroupId}',
					detailList : {},
					adminlist : {},
					searchUserlist : {},
					pageView : '1',
					searchjoinGroup : [],
					categoryList:[],
					typeList : [],
					fileName: '', // 파일명 저장
	                filePreview: '', // 이미지 미리보기 URL 저장
					searchnotjoinGroup : [],
					searchnotLeaveGroup : []
					
										
	            };
	        },
	        methods: {
				fnassignLeader(fetchappuserid,userNickName){
					var self = this;
					if(!confirm(userNickName + "님에게 그룹장을 위임합니다. 되돌릴수 없어요!")){
						return;
					}
					var nparmap = { studyGroupId : self.studyGroupId ,fetchappuserid : fetchappuserid, sessionId : self.sessionUserId
					};
					$.ajax({
						url:"updateStuGroupBossDelegation.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							alert("그룹장 위임 완료");
							self.fnDetail();
							self.fnSidebar(1);
						}
					});
		        },
				fnStuGroupUnblocking(fetchappuserid){
					var self = this;
					var nparmap = { studyGroupId : self.studyGroupId ,fetchappuserid : fetchappuserid
					};
					$.ajax({
						url:"deleteStuGroupUnblocking.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							alert("차단해제 되었습니다.");
							self.fnDetail();
							self.fnSidebar(3);
							
						}
					});
		        },
				removeMemberResult(fetchappuserid,userNickName){
					var self = this;
					if(!confirm("정말 강퇴 시킵니다?!")){
						self.rejectionMessage ="";
						return;
					}
					var nparmap = { studyGroupId : self.studyGroupId ,fetchappuserid : fetchappuserid,
									rejectionMessage : self.rejectionMessage
					};
					$.ajax({
						url:"updateStuGroupLeave.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							alert(userNickName + "님이 강퇴되었습니다.");
							self.fnDetail();
							self.fnSidebar(3);
						}
					});
		        },
				removeMember(fetchappuserid){
					var self = this;
					var nparmap = { studyGroupId : self.studyGroupId ,fetchappuserid : fetchappuserid
					};
					$.ajax({
						url:"updateStuGroupLeaveMode.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							self.fnDetail();
							self.fnSidebar(3);
							
						}
					});
		        },
				fnGroupUpdate(studyName,stgStartDate,stgEndDate,stgStudyTime,age,onOffMode,genderGroup,bookId,description){
					var self = this;
					var maxparticipants = self.detailList.maxparticipants;
					var studyGroupId = self.studyGroupId;
					var nparmap = {studyName : studyName , stgStartDate : stgStartDate ,
									stgEndDate : stgEndDate ,stgStudyTime : stgStudyTime,
									age : age ,  onOffMode : onOffMode , maxparticipants : maxparticipants, 
									genderGroup : genderGroup , bookId : bookId , studyGroupId : studyGroupId,
									description : description
					};
					$.ajax({
						url:"updateStuGroup.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							var idx = data.idx;
							console.log(idx);
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
										 alert("수정완료 입니다요~");
										  self.fnDetail();
										  self.filePreview = "";
										},
										error: function(jqXHR, textStatus, errorThrown) {
										  console.error('업로드 실패!', textStatus, errorThrown);
										}
								  });		
							  } else {
								self.fnDetail();
								
							  }		
						}
					});
		        },			
				fnFileChange(event) {
				    const file = event.target.files[0];
				    this.file = file;

              },         
            fnFileChange(event) {
                const file = event.target.files[0];
                this.file = file;

                // 파일명이 있으면 표시
                this.fileName = file.name;

                // 이미지 파일인 경우 미리보기 표시
                if (file && file.type.startsWith('image/')) {
                    const reader = new FileReader();
                    reader.onload = (e) => {
                        this.filePreview = e.target.result;
                    };
                    reader.readAsDataURL(file); // 이미지 파일을 읽음
                } else {
                    this.filePreview = null; // 이미지가 아니면 미리보기 없음
                }
            },      
            fnBoardType(boardTypeId){
               var self = this;
               var nparmap = { boardTypeId : boardTypeId
               };
               $.ajax({
                  url:"selectStuGroupInsertBoardType.dox",
                  dataType:"json",   
                  type : "POST", 
                  data : nparmap,
                  success : function(data) { 
                     console.log(data);
                     self.typeList = data.typeList;
                  }
               });
              },
            fnSidebar(a){
               this.pageView = a; 
            },
            fnDetail() {
                    const self = this;
                    const nparmap = { studyGroupId: self.studyGroupId };
                    $.ajax({
                        url: "selectStuGroupDetail.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function(data) {
                            console.log(data);
                            self.detailList = data.detailList;
                     self.fnBoardType(self.detailList.boardTypeId);
                     self.fnsGroupAdminSearch(self.detailList.studyAdminId, self.detailList.studyGroupId);
                        },
                    });
                },
            fnsGroupAdminSearch(userId,studyGroupId) {
                    const self = this;
                    const nparmap = { userId : userId, sessionId : self.sessionUserId, studyGroupId : studyGroupId   };
                    $.ajax({
                        url: "selectStuGroupUserSearch.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function(data) {
                            console.log(data);
                            self.adminlist = data.adminlist;
							self.searchUserlist = data.searchUserlist;
							self.searchjoinGroup = data.searchjoinGroup;
							self.searchnotjoinGroup = data.searchnotjoinGroup;
							self.searchnotLeaveGroup = data.searchnotLeaveGroup;
                        },
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
                     self.isLogin = data.isLogin 
                     if(data.isLogin){
                        self.sessionUserId = data.userId;
                        self.sessionUserNickName = data.userNickName;
                        self.isAdmin = data.isAdmin;
                        console.log('세션아이디:', self.sessionUserId);  // sessionUserId가 제대로 설정되었는지 확인
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
            self.fnSession();
            self.fnDetail();
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