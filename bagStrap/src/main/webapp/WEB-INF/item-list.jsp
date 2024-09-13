<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
	table, tr, td, th {
		border-collapse: collapse;
		border: 1px solid black;
		padding: 10px 20px;
	}
</style>
<body>
	<div id="app">
		
		<div v-for="item in codeList">
		<input type="checkbox" :value ="item.code" v-model="selectedCodes" @change="fnGetList()">{{item.codeName}}
		</div>
		<table>
		<tr v-for="item in list">
			<td>{{item.itemNo}}</td>	
			<td>{{item.itemName}}</td>	
			<td>{{item.price}}</td>	
			<td>{{item.codeName}}</td>		
			<td>{{item.codeName}}</td>	
		</tr>	
		</table>
		
	
		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "",
				list : {},
				codeList : {},
				selectedCodes : []
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {selectedCodes: JSON.stringify(self.selectedCodes)};
				$.ajax({
					url:"itemList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
						self.codeList = data.codeList;
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
​