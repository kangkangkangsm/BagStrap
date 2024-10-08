<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
	<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
	<title>첫번째 페이지</title>
</head>
<style>
	.stu-comm-insert-container {
	    max-width: 80%;
	    margin: 0 auto;
	    background-color: white;
	    padding: 20px;
	  
	}

	.stu-comm-insert-h2 {
	    margin-bottom: 20px;
	    text-align: center;
	}

	.stu-comm-insert-form label {
	    display: block;
	    margin-bottom: 5px;
	    font-weight: bold;
	}
	.stu-comm-insert-title{
		width: 97.5%;
	    padding: 10px;
	    margin-bottom: 15px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    font-size: 16px;
	}
	
	.stu-comm-insert-category,
	.stu-comm-insert-content,
	.stu-comm-insert-file {
	    width: 100%;
	    padding: 10px;
	    margin-bottom: 15px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    font-size: 16px;
	}

	.stu-comm-insert-content {
	    height: 150px;
	    resize: none;
	}

	.stu-comm-insert-buttons {
	    display: flex;
	    justify-content: flex-end;
	    gap: 10px;
	}

	.stu-comm-insert-buttons .cancel {
	    background-color: #ccc;
	    border: none;
	    padding: 10px 20px;
	    border-radius: 4px;
	    cursor: pointer;
	}

	.stu-comm-insert-buttons .submit {
	    background-color: #4CAF50;
	    border: none;
	    color: white;
	    padding: 10px 20px;
	    border-radius: 4px;
	    cursor: pointer;
	}

	.stu-comm-insert-buttons button:hover {
	    opacity: 0.9;
	}

	/* 이미지 미리보기 */
	.stu-comm-insert-image-preview {
	    margin-top: 10px;
	    width: 100px;
	    height: 100px;
	}
</style>
<body>
	<main class="main-container">
		<aside class="sidebar">
			<jsp:include page="/layout/study_comm_sidebar.jsp"></jsp:include>  
        </aside>

        <div id="app" class="content">
			<div class="stu-comm-insert-container">
			    <h2 class="stu-comm-insert-h2">글쓰기</h2>
			    <form class="stu-comm-insert-form">
			        <label for="category">카테고리</label>
					<select id="category" class="stu-comm-insert-category" v-model="boardTypeId">
						<option value="1002" v-if="isAdmin">공지사항</option>
					    <option v-for="item in categoryList" :value="item.boardTypeId">
					        {{ item.name }} 
					    </option>
					</select>

			        <label for="title">제목</label>
			        <input type="text" id="title" v-model="title" class="stu-comm-insert-title" placeholder="제목을 입력하세요">

			        <label for="content">내용</label>
			        <div id="editor" class="stu-comm-insert-content" style="height:300px;"></div>

			        <label for="file">파일 업로드</label>
			        <input type="file" @change="fnFileChange"/>
			        <input type="file" id="file-upload" style="display: none;" @change="fnFileChange"/>

			        <!-- 이미지 미리보기 -->
			        <div v-if="filePreview">
			            <img :src="filePreview" class="stu-comm-insert-image-preview" />
			        </div>

			        <div class="stu-comm-insert-buttons">
			            <button type="button" @click="fnBack()" class="cancel">취소</button>
			            <button type="button" @click="fnSave()" class="submit" style="background-color: #343A40;">등록</button>
			        </div>
			    </form>
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
				user: '${sessionScope.user}',
				isLogin: false,
				sessionUserId: '',
				sessionUserNickName: '',
				file: null,
				categoryList: [],
				content: "",
		        filePreview: '' // 이미지 미리보기 URL 저장,
				
            };
        },
        methods: {
			fnSave() {
				var self = this;
				var nparmap = { 
					boardTypeId: self.boardTypeId,
					title: self.title,
					content: self.content,
					userId: self.sessionUserId
				};
				$.ajax({
					url: "/insertComm.dox",
					dataType: "json",	
					type: "POST", 
					data: nparmap,
					success: function(data) { 
						alert(data.message);
						var idx = data.idx;
						
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
									
									  location.href = "/study-comm";
									  self.filePreview = "";
									},
									error: function(jqXHR, textStatus, errorThrown) {
									  
									}
							  });		
						  } else {
							location.href = "/study-comm";
						  }		
					}
				});
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
            fnGetList() {
				var self = this;
				$.ajax({
					url: "/selectMyCommCategory.dox",
					dataType: "json",	
					type: "POST", 
					success: function(data) { 
						self.categoryList = data.categoryList;
					}
				});
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
			fnBack() {
				history.back();
			}
        },
        mounted() {
            var self = this;
			window.addEventListener('loginStatusChanged', function() {
				if (window.sessionStorage.getItem("isLogin") === 'true') {
					self.isLogin = true;
				} else {
					self.isLogin = false;
				}
				self.fnSession();
			});
			self.fnSession();
			self.fnGetList();
			// (추가) 로그인 상태가 변경되었을 때 세션 정보 다시 로드
			        window.addEventListener('loginStatusChanged', function () {
			            self.fnSession();  // (추가) 로그인 상태가 변경되었을 때 자동으로 세션 정보 업데이트
			        });
			// Quill 에디터 초기화
			var quill = new Quill('#editor', {
	            theme: 'snow',
	            modules: {
	                toolbar: [
	                    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
	                    ['bold', 'italic', 'underline'],
	                    [{ 'list': 'ordered' }, { 'list': 'bullet' }],
	                    ['link', 'image'],
	                    ['clean']
	                ]
	            }
	        });

	        // 에디터 내용이 변경될 때마다 Vue 데이터를 업데이트
			quill.on('text-change', () => {
			    this.content = quill.root.innerHTML;
			});
	    }
    });
    app.mount('#app');
</script>
