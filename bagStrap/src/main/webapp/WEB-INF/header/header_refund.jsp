<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<style>

		.ordered-list-container {
		    display: flex;
		    border-bottom: 1px solid #eee;
		    padding: 20px;
		    margin-bottom: 20px;
		}

		.left-section {
		    flex: 3;
		    padding-right: 20px;
		    border-right: 1px solid #eee; /* Border between left and right section */
		}

		.right-section {
		    flex: 1;
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		    padding-left: 20px;
		}

		.status {
		    font-weight: bold;
		    margin-bottom: 5px;
		}

		.arrival-time {
		    color: green;
		    margin-bottom: 10px;
		}

		.ordered-product {
		    display: flex;
		    margin-bottom: 10px;
		}

		.ordered-product-image {
			width:80px;
		    height: 100px;
		    margin-right: 20px;
		}

		.ordered-product-info {
			flex:1;
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		}

		.ordered-product-name {
		    font-size: 18px;
		    margin-bottom: 10px;
		}

		.ordered-product-detail-info {
		    position: relative;
		    justify-content: space-between;
		    font-size: 16px;
		}

		.relative-right{
			position: absolute;
			right:0px;
			bottom:0px
		}
		.ordered-button {
		    padding: 10px;
		    background-color: #f0f0f0;
		    border: 1px solid #ddd;
		    cursor: pointer;
		    text-align: center;
		}
		details {
	        width: 500px;
	        border: 1px solid #aaa;
	        border-radius: 4px;
	        padding: 8px 8px 0 8px;
	        opacity: 0.8;
	    }
	    details[open] {
	        opacity: 1;
	        padding: 8px;
	    }
	    details[open] summary {
	        background-color: azure;
	    }
	    summary {
	        font-weight: bold;
	        background-color: bisque;
	        margin: -8px -8px 0 -8px;
	        padding: 8px;
	    }
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
						<span :style="{ color: progress>0 ? 'blue' : 'black' }"> 1 상품 선택</span>
						<span :style="{ color: progress>1 ? 'blue' : 'black' }"> - 2 사유 선택</span>
						<span :style="{ color: progress>2 ? 'blue' : 'black' }"> - 3 해결방법 선택</span>
					</div>		
					<div class="progress" v-if="progress === 1">			
						<h2>상품을 선택해 주세요</h2>
						<div class="ordered-list-container round">
						    <div class="left-section">
						        <div class="ordered-product" v-for="item in orderList">
									<input type="checkbox" :value="item.bookId" v-model="selectedBooks"/>
						            <img class="ordered-product-image" :src="item.image" :alt="item.title">
									<div class="ordered-product-info">
						                <div class="ordered-product-name">{{item.title}}</div>
						                <div class="ordered-product-detail-info">
						                    <span>{{item.price}}</span> / <span>{{item.quantity}}</span> 
											<button class="ordered-button relative-right">장바구니에 추가</button>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
					</div>
					<div class="progress" v-if="progress === 2">
						<details @toggle="handleToggle">
						    <summary>Details 태그에 있는 제목부분: summary</summary>
						    <p>맞아요 여기는 열면 나오는 부분이랍니다</p>
						</details>
					<div class="progress" v-if="progress === 3">			

					</div>

					<div>
						<button @click="progress+=1">다음 단계</button>	
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
				//가변값 넣어라
				isLogin : true,
                orderId : '${orderId}',
				progress : 1,
				orderList : [],
				selectedBooks: [],
				
				reasonList: [],
				selectedReason: '',
				
				
				list : {},
				codeList : {},
				selectedCodes : []
            };
        },
		computed: {
		    sumPrice() {
				var self = this;
		        return self.selectedPrice.reduce((acc, item) => {
		            acc = acc+item
		            return acc;
		        }, 0);
		    }
		},
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					orderId : self.orderId
				};
				$.ajax({
					url:"/orderListForRefund.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.orderList = data.orderList;
						alert(data.message); 	
					}
				});
            },
			handleToggle(event){
				if (event.target.open){
					
				}
			}
        },
        mounted() {
            var self = this;
			self.fnGetList();
			window.addEventListener('loginStatusChanged', function(){
				if(window.sessionStorage.getItem("isLogin") === 'true'){
					self.isLogin = true;	
				} else{
					alert('로그인하쇼');
					self.isLogin = false;
				};
			})
        }
    });
    app.mount('#app');
</script>