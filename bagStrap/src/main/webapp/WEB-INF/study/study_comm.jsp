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
	.stu_comm_profile {
	    display: flex;
	    align-items: center;
	    margin-bottom: 30px;
    }

    .stu_comm_profile-img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 10px;
    }

    .stu_comm_profile-info {
        flex-grow: 1;
    }

    .stu_comm_profile-info p {
        margin: 0;
        padding: 0;
    }
	
	.stu_comm_activity-item {
        display: flex;
        align-items: center;
        margin-bottom: 5px;
    }

    .stu_comm_activity-icon {
        margin-right: 5px;
    }

    .stu_comm_activity-item a {
        text-decoration: none;
        color: #333;
        font-weight: bold;
        margin-right: 10px;
		width:200px;
    }

    .stu_comm_activity-count {
        color: #666;
    }
	.stu_comm_user-activity {
        margin-top: 10px;
	}
	.stu_comm_menu {
	    margin-top: 20px;
	}

	.stu_comm_menu button {
	    width: 93%;
	    padding: 10px;
	    margin-bottom: 10px;
	    background-color: #333;
	    color: #fff;
	    border: none;
	    cursor: pointer;
	}

	.stu_comm_menu ul {
	    list-style: none;
	    padding: 0;
	}

	.stu_comm_menu li {
	    display: flex;
	    justify-content: space-between;
	    margin: 10px 0;
	}

	.stu_comm_menu a {
	    text-decoration: none;
	    color: #007bff;
		width:180px;
	}
	
	.stu_comm_recent-comments {
        margin-top: 30px;
    }

    .stu_comm_recent-comments h3 {
        margin-bottom: 10px;
        font-size: 14px;
        font-weight: bold;
    }

    .stu_comm_recent-comments ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .stu_comm_recent-comments li {
        margin-bottom: 5px;
    }

    .stu_comm_pagination {
        margin-top: 10px;
    }

    .stu_comm_pagination a {
        text-decoration: none;
        color: #007bff;
        margin: 0 5px;
    }

    .stu_comm_pagination span {
        color: #666;
        margin: 0 5px;
    }

	</style>
<body>
	<div id="app">
		<main class="main-container">
			
	        <aside class="sidebar">
				<jsp:include page="/layout/study_comm_sidebar.jsp"></jsp:include>
	        </aside>
			
	        <div class="content">
	            콘텐츠
				Default
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
                name : "",
				list : {},
				codeList : {},
				selectedCodes : []
            };
        },
        methods: {
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
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>