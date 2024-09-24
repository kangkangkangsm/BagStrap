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
        table {
            margin: 20px;
        }
        table, tr, th, td {
            border: 1px solid black;
            padding: 5px 5px;
            border-collapse: collapse;
        }
        #editor {
            height: 300px;
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
                    console.log(nparam);
                    $.ajax({
                        url: "notice-add.dox",
                        dataType: "json",	
                        type: "POST", 
                        data: nparam,
                        success: (data) => { 
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
                        success: (data) => {
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
                    this.content = quill.root.innerHTML;
                });
            }
        });
        app.mount('#app');
    </script>
