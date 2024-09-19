<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<style>
	</style>
</head>
<body>
		<main class="main-container">
			
	        <aside class="sidebar">
				<jsp:include page="/layout/header_sidebar.jsp"></jsp:include>
	        </aside>

	        <div class="content">
				<div id="app">
					<div>
					    <div>
					        아이디<input type="text" v-model="USER_ID">
					    </div>
					    <div>
					        이름<input type="text" v-model="USER_NAME">
					    </div>
					    <div>
					        닉네임<input type="text" v-model="USER_NICKNAME">
					    </div>
					    <div>
					        비밀번호<input type="password" v-model="PASSWORD">	
					    </div>
						<div>
						    비밀번호 확인<input type="password" v-model="CONFIRM_PASSWORD">	
						</div>
					    <div>
					        이메일<input type="text" v-model="EMAIL">	
					    </div>
					    <div>
					        주소<input type="text" v-model="ADDR">
					    </div>
					    <div>
					        이게뭐냐<input type="text" v-model="BAN">
					    </div>
					    <div>
					        지위<input type="text" v-model="STATUS">
					    </div>
					    <div>
					        휴대전화<input type="text" v-model="PHONE_NUM">
					    </div>
					    <div>
					        날짜1<input type="text" v-model="CREATE_DATE">
					    </div>
					    <div>
					        날짜2<input type="text" v-model="UPDATE_DATE">
					    </div>
					    <div>
					        <button @click="fnSave">제출하기</button>
					    </div>
					</div>

				</div>
			</div>

	    </main>

		
	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>
<script>
	//localStorage.setItem('data', JSON.stringify(data));
	// JSON.parse(localStorage.getItem('data')).result
    const app = Vue.createApp({
        data() {
            return {
				list:[],
				USER_ID:"",
				USER_NAME:"",
				USER_NICKNAME:"",
				PASSWORD:"",
				CONFIRM_PASSWORD:"",
				EMAIL:"",
				ADDR:"",
				BAN:"",
				STATUS:"",
				PHONE_NUM:"",
				CREATE_DATE:"",
				UPDATE_DATE:""
            };
        },
		
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url:"/join.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						
					}
				});
            },
			fnSave(){
				var self = this;
								            }
				var nparmap = {
						USER_ID:self.USER_ID,
						USER_NAME:self.USER_NAME,
						USER_NICKNAME:self.USER_NICKNAME,
						PASSWORD:self.PASSWORD,
						EMAIL:self.EMAIL,
						ADDR:self.ADDR,
						BAN:self.BAN,
						STATUS:self.STATUS,
						PHONE_NUM:self.PHONE_NUM,
						CREATE_DATE:self.CREATE_DATE,
						UPDATE_DATE:self.UPDATE_DATE
				};
				$.ajax({
					url:"/joinadd1.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.fnGetList();
					}
				});
			}
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>