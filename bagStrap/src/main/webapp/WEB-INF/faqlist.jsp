<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>FAQ</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<h1>자주 묻는 질문</h1>
		<div v-for="item in list" :key="item.faqId" class="faq-item" @click="toggle(item.faqId)" :class="{ active: item.active }">
		    <h3>{{ item.question }}</h3>
		    <p v-if="item.active">{{ item.answer }}</p>
		</div>
		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
            };
        },
        methods: {
			fnGetList(){
				var self = this;
				var nparmap = {
					
				};
				$.ajax({
					url:"faq-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
					}
				});
			},
			toggle(faqId){
				var self = this;
				var faq = self.list.find(item => item.faqId === faqId); // 클릭한 FAQ 찾기
				if (faq) {
				    faq.active = !faq.active; // 활성화 상태 토글
				}
			}
        },
        mounted() {
			var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>