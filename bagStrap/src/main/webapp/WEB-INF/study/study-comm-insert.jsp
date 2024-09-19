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
	body {
	    font-family: Arial, sans-serif;
	    background-color: #f4f4f4;
	    padding: 20px;
	}

	.stu-comm-insert-container {
	    max-width:80%;
	    margin: 0 auto;
	    background-color: white;
	    padding: 20px;
	    border-radius: 8px;
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	}

	h2 {
	    margin-bottom: 20px;
	    text-align: center;
	}

	.stu-comm-insert-form label {
	    display: block;
	    margin-bottom: 5px;
	    font-weight: bold;
	}

	.stu-comm-insert-title,
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
</style>
<body>
	<div id="app">
		<main class="main-container">
			
	        <aside class="sidebar">
	            {{sessionUserNickName}}
	        </aside>
	        <div class="content">
			
				<div class="stu-comm-insert-container">
			       <h2>글쓰기 </h2>
			       <form class="stu-comm-insert-form">
			           <label for="category">카테고리</label>
					   <select id="category" class="stu-comm-insert-category" v-model="boardTypeId" >
					       <option v-for="item in boardTypelist" >{{item.name}}</option>				 
					   </select>
			           <label for="title">제목</label>
			           <input type="text" id="title" v-model = "title" class="stu-comm-insert-title" placeholder="제목을 입력하세요">


			           <label for="content">내용</label>
			           <div id="editor" style="height:300px;"></div>

			           <label for="file">파일 업로드</label>
			           <input type="file" @change="fnFileChange"/>

			           <div class="stu-comm-insert-buttons">
			               <button type="button" @click="fnBack()">취소</button>
			               <button type="submit" @click="fnSave()">등록</button>
			           </div>
			       </form>
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
				user: '${sessionScope.user}',
				isLogin : false,
				sessionUserId : '',
				sessionUserNickName : '',
				file : null,
				content : "",
				boardTypelist : [],
				boardTypeId :"",
				title : ""
				
            };
        },
        methods: {
			fnSave(){
				var self = this;
				var nparmap = {
					
				};
				$.ajax({
					url:"/selectStuCommType.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.boardTypelist = data.boardTypelist;
						
					}
				});
            },
			fnFileChange(event) {
							this.file = event.target.files[0];
						},
            fnGetList(){
				var self = this;
				var nparmap = {
					
				};
				$.ajax({
					url:"/selectStuCommType.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.boardTypelist = data.boardTypelist;
						
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
						self.isLogin = data.isLogin 
						if(data.isLogin){
							self.sessionUserId = data.userId;
							self.sessionUserNickName = data.userNickName;
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
			self.fnGetList();
			var quill = new Quill('#editor', {
		            theme: 'snow',
		            modules: {
		                toolbar: [
		                    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
		                    ['bold', 'italic', 'underline'],
		                    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
		                    ['link', 'image'],
		                    ['clean']
		                ]
		            }
		        });
				// 에디터 초기 내용 설정
				quill.root.innerHTML = this.content;

		        // 에디터 내용이 변경될 때마다 Vue 데이터를 업데이트
				quill.on('text-change', () => {
				    this.content = quill.root.innerHTML; // 수정된 코드
				});
		    }
		    });
    app.mount('#app');
</script>