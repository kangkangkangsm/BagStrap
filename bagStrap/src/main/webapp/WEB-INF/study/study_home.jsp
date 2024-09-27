<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
	
	</style>
<body>
	<div id="app">
		<main class="main-container">
			
	        <aside class="sidebar">
	            사이드바
	        </aside>
			
	        <div class="content">
	            콘텐츠
				studyhome
				<button @click="fnmove">임시 스터디커뮤니티 이동 버튼</button>
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
                name : '${hello}',
				list : {},
				codeList : {},
				selectedCodes : [],
				
            };
        },
        methods: {
			fnmove(){
				location.href="study-comm"
			},
            fnGetList(){
				var self = this;
				var nparmap = {
					selectedCodes: JSON.stringify(self.selectedCodes)
				};
				$.ajax({
					url:"itemList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
					}
				});
            }
        },
        mounted() {
            var self = this;
			//self.fnGetList();
        }
    });
    app.mount('#app');
</script>