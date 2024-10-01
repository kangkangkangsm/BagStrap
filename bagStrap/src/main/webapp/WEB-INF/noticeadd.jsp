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
		body {
		    font-family: 'Roboto', sans-serif;
		    background-color: #f4f6f9; /* 부드러운 배경색 */
		    color: #333;
		    margin: 0;
		    padding: 20px;
		}

		h1 {
		    text-align: center;
		    color: #2c3e50; /* 제목 색상 */
		    margin-bottom: 30px;
		}

		table {
		    margin: 20px auto; /* 가운데 정렬 */
		    width: 80%; /* 넓이 조정 */
		    border-collapse: collapse; /* 경계선 조정 */
		    background-color: #ffffff; /* 테이블 배경색 */
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
		    border-radius: 8px; /* 테이블 테두리 둥글게 */
		}

		th {
		    background-color: #3498db; /* 헤더 색상 */
		    color: white; /* 헤더 텍스트 색상 */
		}

		td {
		    padding: 10px; /* 패딩 조정 */
		}

		#editor {
		    height: 300px;
		    border: 1px solid #ddd; /* 에디터 테두리 */
		    border-radius: 5px; /* 에디터 둥글게 */
		}

		button {
		    display: block;
		    margin: 20px auto; /* 버튼 가운데 정렬 */
		    padding: 10px 20px;
		    background-color: #007BFF; /* 버튼 배경색 */
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s ease; /* 부드러운 호버 효과 */
		    font-size: 1.1em; /* 버튼 글자 크기 */
		}

		button:hover {
		    background-color: #0056b3; /* 버튼 호버 색상 */
		}
    </style>
</head>
<body>
    <div id="app">
        <h1>공지사항 추가</h1>
        <table>
            <tr>
                <th>제목</th>
                <td><input v-model="title" placeholder="공지 제목을 입력하세요"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><div id="editor"></div></td>
            </tr>	
        </table>
        <button id="btn" @click="fnSave()">저장</button>
			
    </div>
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
                this.fnSession();

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