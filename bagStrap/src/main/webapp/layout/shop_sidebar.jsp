<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
  <style>
	.shop-sidebar-title {
	    font-size: 18px;
	    color: #333;
	    margin-bottom: 15px;
	    padding-bottom: 10px;
	    border-bottom: 1px solid #ddd;
	}
	.shop-sidebar-section {
	    margin-bottom: 20px;
	}
	.shop-sidebar-section h4 {
	    font-size: 16px;
	    margin-bottom: 10px;
	    color: #555;
	}
	/* a 태그 스타일을 버튼처럼 변경 */
	.shop-sidebar-link {
	    display: block;
	    margin: 5px 0;
	    padding: 8px 10px;
	    background-color: #f9f9f9;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    font-size: 14px;
	    color: #333;
	    text-align: left;
	    text-decoration: none; /* 링크의 밑줄 제거 */
	    box-sizing: border-box;
	    cursor: pointer;
	}
	.shop-sidebar-link:hover {
	    background-color: #e9e9e9;
	}
	.shop-sidebar-input {
	    width: 100%;
	    padding: 8px;
	    margin-bottom: 10px;
	    box-sizing: border-box;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	}
	.shop-sidebar-price-range-container {
	    margin-bottom: 10px;
	}
	.shop-sidebar-price-range-slider {
	    width: 100%;
	    position: relative;
	    height: 5px;
	    background-color: #ddd;
	    border-radius: 5px;
	}
	.shop-sidebar-price-range-slider input[type="range"] {
	    position: absolute;
	    width: 100%;
	    height: 0;
	    -webkit-appearance: none;
	    z-index: 2;
	}
	.shop-sidebar-price-range-slider input[type="range"]::-webkit-slider-thumb {
	    -webkit-appearance: none;
	    width: 18px;
	    height: 18px;
	    background: #007bff;
	    border-radius: 50%;
	    cursor: pointer;
	}
	.shop-sidebar-price-range-labels {
	    display: flex;
	    justify-content: space-between;
	    font-size: 14px;
	    margin-top: 5px;
	}
	.shop-sidebar-price-input-container {
	    display: flex;
	    justify-content: space-between;
	    margin-top: 10px;
	}
	.shop-sidebar-price-input {
	    width: 45%;
	    padding: 8px;
	    box-sizing: border-box;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	}
	.shop-sidebar-footer {
	    text-align: center;
	    margin-top: 20px;
	}
	.shop-sidebar-filter-btn {
	    background-color: #007bff;
	    color: white;
	    border: none;
	    padding: 10px 20px;
	    cursor: pointer;
	    border-radius: 4px;
	    font-size: 14px;
	    text-decoration: none;
	    display: inline-block;
	}
	.shop-sidebar-filter-btn:hover {
	    background-color: #0056b3;
	}
	/* 메뉴 스타일 */
	.stu-comm-menu {
	   
	}

	.stu-comm-menu button {
	    width: 100%;
	    padding: 10px;
	    margin-bottom: 20px;
	    background-color: #343A40;
	    border: none;
	    color: #ffffff;
	    border-radius: 5px;
	    font-weight: bold;
	    cursor: pointer;
	    transition: background-color 0.3s;
		margin-top: -20px;
	}

	.stu-comm-menu button:hover {
	    background-color: #337ab7;
	}

	/* 메뉴 항목 스타일 */
	.stu-comm-menu ul {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}

	.stu-comm-menu li {
	    margin-bottom: 10px;
	}

	.stu-comm-menu li a {
	    display: block;
	    font-size: 15px;
	    color: #333;
	    text-decoration: none;
	    padding: 8px 10px;
	    border-radius: 5px;
	    transition: background 0.3s, color 0.3s;
	}

	.stu-comm-menu li a:hover {
	    background-color: #E0E0E0; /* 호버 시 배경색 변경 */
		width:280px;
	}

	/* 메뉴 구분선 */
	.stu-comm-menu hr {
	    border: none;
	    height: 1px;
	    background-color: #e0e0e0;
	    margin: 15px 0;
	}	
	.study-comm-sidebard-h3 {
		    margin: 10px 0;
		    font-size: 15px;
		    color: #333333;
		    background-color: #E0E0E0;
		    padding: 8px 12px;
		    text-align: left;
		    border-radius: 5px;
	}
	.study-comm-sidebard-section {
		    margin-bottom: 10px;
		    padding: 10px;
		    background-color: #F9F9F9;
		   
		    border-radius: 5px;
	}
	.study-group-sidebard :hover {
		    background-color: #007bff;
		    color: white;
		    border-color: #007bff;
		}
    </style>
</head>
<body>
	<aside id="shopSidebar">
	        <nav class="stu-comm-menu">
				<h3 class="study-comm-sidebard-h3">카테고리</h3>
				<div class="study-comm-sidebard-section">
		            <ul v-for="item in categoryList">
		                <li><a :style="{color: category == item.boardTypeId ? 'blue' : 'gray'}" href="#" @click="fnCategory(item.boardTypeId)">{{item.name}}</a></li>
					</ul>
				</div>
				<h3 class="study-comm-sidebard-h3">{{highPrice}}원 이하</h3>
				<br>
				<div class="shop-sidebar-price-range-container">
		            <div class="shop-sidebar-price-range-slider">
						<!--<input type="range" :min="min" :max="max" v-model="lowPrice" id="minPrice" step="1000">-->
						<input type="range" :min="min" :max="max" v-model.number="highPrice" id="maxPrice" step="1000" @change="applyFilters()">
		            </div>
		        </div>
		        <div class="shop-sidebar-price-range-labels">
		            <!--<span id="minPriceLabel" >{{min}}원</span>-->
		            <span id="maxPriceLabel"></span>{{max}}원
		        </div>
				
				<div class="shop-sidebar-section">
			        <h4>평점</h4>
					<svg v-for="number in 5" @click="fnChangeStar(number)" :fill="star >= number ? 'orange' : 'gray'" baseProfile="tiny" height="24px" id="Layer_1" version="1.2" viewBox="0 0 24 24" width="24px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><g><path d="M9.362,9.158c0,0-3.16,0.35-5.268,0.584c-0.19,0.023-0.358,0.15-0.421,0.343s0,0.394,0.14,0.521    c1.566,1.429,3.919,3.569,3.919,3.569c-0.002,0-0.646,3.113-1.074,5.19c-0.036,0.188,0.032,0.387,0.196,0.506    c0.163,0.119,0.373,0.121,0.538,0.028c1.844-1.048,4.606-2.624,4.606-2.624s2.763,1.576,4.604,2.625    c0.168,0.092,0.378,0.09,0.541-0.029c0.164-0.119,0.232-0.318,0.195-0.505c-0.428-2.078-1.071-5.191-1.071-5.191    s2.353-2.14,3.919-3.566c0.14-0.131,0.202-0.332,0.14-0.524s-0.23-0.319-0.42-0.341c-2.108-0.236-5.269-0.586-5.269-0.586    s-1.31-2.898-2.183-4.83c-0.082-0.173-0.254-0.294-0.456-0.294s-0.375,0.122-0.453,0.294C10.671,6.26,9.362,9.158,9.362,9.158z"/></g></g></svg>
					<div>{{star}}점 이상</div>
			    </div>
		
	        </nav>    

	</aside>
</body>
</html>
<script>
	 const shopSidebarApp = Vue.createApp({
	        data() {
	            return {
					categoryList : [],
					star: 0,
					category: 2000,
					min: 0,
					max: 100000,
					lowPrice: 0,
					highPrice: 50000,
					keyword: ''
				};
	        },
	        methods: {
				fnGetList() {
				    const self = this;
				    const nparmap = {

				    };
				    $.ajax({
				        url: "/getBookCat.dox", // 서버의 URL
				        dataType: "json",
				        type: "POST",
				        data: nparmap, // 검색어 데이터를 함께 전송
				        success: function(data) {
							console.log(data);
							if(data.categoryList){
								self.categoryList = data.categoryList;
								self.max = data.minMaxPrice[0].max;
								self.highPrice = self.max/2;
								window.sessionStorage.setItem("rating", self.star);
								window.sessionStorage.setItem("category", self.category);
								window.sessionStorage.setItem("keyword", self.keyword);
								window.sessionStorage.setItem("highPrice", self.highPrice);
							}
															
				        }
					});
				},
				fnChangeStar(numb){
					var self = this;
					if (self.star === numb){
						self.star = 0;
					} else {
						self.star = numb;
					}
					self.applyFilters();
				}, 
				fnCategory(categoryId){
					var self=this;
					
					self.category = categoryId;
					window.sessionStorage.setItem("category", self.category);
					window.dispatchEvent(new Event('shopCategoryChange'));

				},
				applyFilters() {
					var self = this;
					window.sessionStorage.setItem("rating", self.star);
					window.sessionStorage.setItem("category", self.category);
					window.sessionStorage.setItem("keyword", self.keyword);
					window.sessionStorage.setItem("highPrice", self.highPrice);

					window.dispatchEvent(new Event('shopCategoryChange'));
				}
	        },
	        mounted() {
				var self = this;
				self.fnGetList();
			}
	    });
	    shopSidebarApp.mount('#shopSidebar');
</script>
