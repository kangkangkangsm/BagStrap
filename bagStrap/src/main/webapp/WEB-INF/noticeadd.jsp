<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
    <!-- Quill CDN -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
    <title>공지사항 추가</title>
    <style>
		.main-container {
		     display: flex;
		     min-height: 100vh;
		     font-family: 'Arial', sans-serif;
		     background-color: #f4f6f9;
		 }
		 .content {
		      width:100%;
		      padding: 40px;
		      background-color: #ffffff;
			  border-radius: 8px; /* 둥근 모서리 */
			  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
		 }

		h1 {
		    text-align: center;
		    color: black; 
		    margin-bottom: 30px;
		}

		table {
			width: 100%;
			border-collapse: collapse;
			font-size: 16px;
			box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
			border-radius: 8px;
			overflow: hidden;
			margin-bottom: 30px;
		}

		th {
		    background-color: #3498db; /* 헤더 배경색 */
		    color: white; /* 헤더 텍스트 색상 */
		    padding: 12px; /* 패딩 추가 */
		    text-align: center; 
		    border: 1px solid #ddd; /* 경계선 색상 */
		}

		td {
		    padding: 12px; /* 패딩 추가 */
		    border: 1px solid #ddd; /* 경계선 색상 */
		}

		#editor {
		    height: 300px;
		    border: 1px solid #ddd; /* 에디터 테두리 */
		    border-radius: 5px; /* 에디터 둥글게 */
		}

		button {
			display:block;
			margin: 20px auto; /* 버튼 가운데 정렬 */
			padding: 10px 15px;
			border: none;
			background-color: #ff7f50;
			color: white;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
			transition: background-color 0.3s; /* 부드러운 호버 효과 */
		}

		button:hover {
		    background-color: #e74c3c; /* 버튼 호버 색상 */
		}
    </style>
</head>
<body>
	<main class="main-container">
    	<div id="app" class="content">
	        <h1>공지사항 추가</h1>
	        <table>
	            <tr>
	                <th>제목</th>
	                <td><input v-model="title" placeholder="공지 제목을 입력하세요" required></td>
	            </tr>
	            <tr>
	                <th>내용</th>
	                <td><div id="editor" required></div></td>
	            </tr>	
	        </table>
	        <button id="btn" @click="fnSave()">저장</button>
			
    	</div>
	</main>
	<jsp:include page="/layout/footer.jsp"></jsp:include>        

</body>
</html>
    <script>
        const app = Vue.createApp({
            data() {
                return {
					isLogin : false,
                    title: "",
                    content: "",
					sessionUserId : '',
					sessionUserNickName : '',
					
                };
            },
            methods: {
                fnSave() {
					var self=this;
					
					if (!self.title || !self.content) {
					       alert("제목과 내용를 입력해주세요.");
					       return;
					}
					
                    var nparam = {
                        title: self.title, 
                        content: self.content,
                        userId: self.sessionUserId
                    };
                    //console.log(nparam);
                    $.ajax({
                        url: "notice-add.dox",
                        dataType: "json",	
                        type: "POST", 
                        data: nparam,
                        success: function(data) { 
                            alert(data.message);
                            if (data.result === "success") {
                                location.href = "noticelist"; 
                            }
                        }
                    });
                },
                fnSession() {
                    $.ajax({
                        url: "sharedHeader.dox",
                        dataType: "json",	
                        type: "POST", 
                        success: (data)  => {
                            this.isLogin = data.isLogin;
                            if (data.isLogin) {
                                this.sessionUserId = data.userId;
                                this.sessionUserNickName = data.userNickName;
                                console.log('세션아이디:', this.sessionUserId);  // sessionUserId가 제대로 설정되었는지 확인
                            } else {
                                this.sessionUserId = '';
                                this.sessionUserNickName = '';
                            }
                        }
                    });
                }
            },
            mounted() {
				var self=this;			   
                self.fnSession();

                // Quill 에디터 초기화
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
				//에디터 초기 내용
				quill.root.innerHTML=self.content;

                // 에디터 내용이 변경될 때마다 Vue 데이터 업데이트
                quill.on('text-change', () => {
                    self.content = quill.root.innerHTML;
                });
            }
        });
        app.mount('#app');
    </script>