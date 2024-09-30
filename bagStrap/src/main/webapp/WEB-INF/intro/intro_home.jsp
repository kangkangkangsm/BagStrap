
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!--<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://localhost:8080/js/jquery.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/style.css">-->
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
    <title>첫번째 페이지</title>
</head>
<style>
    .main-container {
        display: flex;

        align-items: center;
    }
    .input-box {
        width: 400px; /* 너비 조절 */
        padding: 10px 20px;
        margin-bottom: 20px; /* 박스와의 거리 조절 */
        font-size: 16px; /* 글씨 크기 조절 */
        border-radius: 10px; /* 모서리 둥글게 */
        border: 1px solid #ccc; /* 테두리 색상 및 스타일 */
    }
    .box {
        width: 600px; /* 너비 */
        height: 300px; /* 높이 */
        border: 1px solid #000; /* 테두리 */
        background-color: #f0f0f0; /* 기본 배경 색 */
        padding: 30px; /* 안쪽 여백 */
        margin: 20px; /* 바깥 여백 */
 
      
    }
    .box:hover {
        transform: scale(1.05); /* 호버 시 박스 확대 */
        box-shadow: 0 12px 24px 0 rgba(0,0,0,0.3); /* 호버 시 그림자 강조 */
    }
</style>
<body>
    <div id="app">
        <main class="main-container">
            <input type="text" class="input-box" placeholder="여기에 입력하세요">
            <div class="box" id="shop" @click="fnShop()">
                shop 으로 이동 
            </div>
            <div class="box" id="study" @click="fnStudy()">
                study 으로 이동 
            </div>
        </main>
    </div>
    <jsp:include page="/layout/footer.jsp"></jsp:include>


	</body>
	</html>
	<script>
	    const app = Vue.createApp({
	        data() {
	            return {};
	        },
	        methods: {
	            fnGetList(){
	                var self = this;
	                var nparmap = {};
	                $.ajax({
	                    url:"intro.dox",
	                    dataType:"json",
	                    type : "POST",
	                    data : nparmap,
	                    success : function(data) {
	                        console.log(data);
	                    }
	                });
	            },
	            fnShop(){
	                location.href="/shop";
	            },
	            fnStudy(){
	                location.href="/study";
	            }
	        },
	        mounted() {
	            var self = this;
	            self.fnGetList();
	        }
	    });
	    app.mount('#app');
	</script>
	  