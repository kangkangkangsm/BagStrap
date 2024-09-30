
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://localhost:8080/js/jquery.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/mainStyle.css">
	<jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
    <title>첫번째 페이지</title>
</head>
<style>

</style>
<body>
	<div id="app">	
	      <main class="container_wrapper">
	          <div class="main-wrapper">
	              <!-- 메인 슬라이드 섹션 -->
	              <section class="main-slide-wrapper">
	                  <div class="slide-content">
	                      <div class="slide-title">
	                          첫 메인 광고 베너
	                      </div>	
	                      <div class="slide-btn-left">
	                          버튼
	                      </div>
	                      <div class="slide-btn-right">
	                          버튼
	                      </div>		
	                  </div>	
	              </section>
					
				  
				  
				  
				  
				  
	              <!-- 새로운 책 리스트 섹션 -->
	              <section class="new-book-list-wrapper main2-wrapper">
	                  <div class="new-book-list-title">
	                      <ul class="new-book-list-title-ul">
	                          <li class="new-book-list-title-ol">전체</li>
	                          <li>독서</li>
	                          <li class="new-book-list-title-ol">논술</li>
	                          <li class="new-book-list-title-ol">어학</li>
	                          <li class="new-book-list-title-ol">자격증</li>
	                          <li class="new-book-list-title-ol">취업준비</li>
	                          <li class="new-book-list-more">더보기</li>		
	                      </ul>
	                  </div>
	                  <div class="new-book-list">
	                      <div>새로운 책 리스트</div>
	                      <ul class="new-book-list-ul">
	                          <li><div>책 1</div></li>
	                          <li><div>책 2</div></li>
	                          <li><div>책 3</div></li>
	                          <li><div>책 4</div></li>
	                          <li><div>책 5</div></li>
	                      </ul>	
	                  </div>	
	              </section>

	              <!-- 베스트 책 리스트 섹션 -->
	              <section class="best-book-list-wrapper main3-wrapper">
	                  <div class="new-book-list-title">
	                      <ul class="new-book-list-title-ul">
	                          <li class="new-book-list-title-ol">일별</li>
	                          <li class="new-book-list-title-ol">주간</li>
	                          <li class="new-book-list-title-ol">월별</li>
	                          <li class="new-book-list-more">더보기</li>
	                      </ul>
	                  </div>
	                  <div class="new-book-list">
	                      <div>베스트 책 리스트</div>
	                      <ul class="new-book-list-ul">
	                          <li><div>책 1</div></li>
	                          <li><div>책 2</div></li>
	                          <li><div>책 3</div></li>
	                          <li><div>책 4</div></li>
	                          <li><div>책 5</div></li>
	                      </ul>	
	                  </div>	
	              </section>

	              <!-- 추가 섹션 -->
	              <section class="main4-wrapper">
	                  <div>추가 섹션</div>
	              </section>
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
	  