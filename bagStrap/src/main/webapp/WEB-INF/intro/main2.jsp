<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/mainStyle2.css">
    <script src="https://unpkg.com/vue@3"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <jsp:include page="/layout/sharedHeader.jsp"></jsp:include>
    
    <title>첫번째 페이지</title>
    <style>
        .wrapper {
            width: 100%;
            margin: 0 auto;
            overflow: hidden;
            background-color: #f0f0f0;
        }
        .swiper-container {
            width: 100%;
            height: 450px;
            overflow: hidden;
            margin: 0 auto;
        }
        .swiper-wrapper {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }
        .swiper-slide {
            min-width: 100%;
            box-sizing: border-box;
            text-align: center;
        }
        .swiper-slide img {
            width: 100%;
            height: 450px;
            object-fit: cover;
        }
        .slide-btn {
            position: absolute;
            top: 50%;
            width: 48px;
            height: 48px;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            cursor: pointer;
            transform: translateY(-50%);
            z-index: 999;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .prev {
            left: 10px;
        }
        .next {
            right: 10px;
        }
        .slide-indicator {
            position: absolute;
            bottom: 15px;
            width: 100%;
            text-align: center;
        }
        .slide-indicator > div {
            width: 12px;
            height: 12px;
            background: #ddd;
            border-radius: 50%;
            display: inline-block;
            margin: 0 5px;
            cursor: pointer;
        }
        .slide-indicator > div.selected {
            background: #333;
        }
    </style>
</head>
<body>
    <div id="app">
        <h1 style="text-align: center;">슬라이드 & 이미지 변경 예제</h1>
        
        <!-- 슬라이드 영역 -->
        <div class="wrapper">
            <main class="welcome_banner_wrap">
                <section id="contents" class="contents_wrap">
                    <div class="welcome_wrap">
                        <div class="welcome_banner_inner">
                            <div class="swiper-container" id="bannerSlider">
                                <ul class="swiper-wrapper" id="slideWrapper">
                                    <!-- 각 슬라이드를 반복적으로 출력 -->
                                    <li class="swiper-slide" v-for="(imageList, index) in slides" :key="index">
                                        <div class="banner_visual_box">
                                            <div class="img_box">
                                                <!-- 슬라이드 내 이미지 변경 -->
                                                <img :src="imageList[currentImageIndex[index]]" :alt="'배너 ' + (index + 1)">
                                            </div> 
                                        </div> 
                                    </li>
                                </ul>
                                <!-- 슬라이드 이동 버튼 -->
                                <span class="slide-btn prev" id="prevBtn">◀</span>
                                <span class="slide-btn next" id="nextBtn">▶</span>
                                <!-- 인디케이터 -->
                                <div class="slide-indicator" id="slideIndicators">
                                    <div class="indicator" v-for="(_, index) in slides" :key="index" :data-index="index" :class="{'selected': index === currentIndex}" @click="moveSlide(index)"></div>
                                </div>
                            </div>
                        </div>    
                    </div>    
                </section>                        
            </main>    
        </div>    

        <!-- 이미지 변경을 위한 추가 버튼 -->
        <div style="text-align: center; margin-top: 20px;">
            <button @click="prevImage">이전 이미지</button>
            <button @click="nextImage">다음 이미지</button>
        </div>
        
    </div>
    <jsp:include page="/layout/footer.jsp"></jsp:include>

    <script>
        const app = Vue.createApp({
            data() {
                return {
                    currentIndex: 0,  // 현재 슬라이드의 인덱스
                    currentImageIndex: [0, 0, 0], // 각 슬라이드의 현재 이미지 인덱스 (초기화)
                    slides: [
                        // 각 슬라이드에 포함될 이미지 리스트
                        [
                            '../src/sample1.png',
                            '../src/sample2.png',
                            '../src/sample3.png'
                        ],
                        [
						'../src/sample1.png',
                      '../src/sample2.png',
                      '../src/sample3.png'
                        ],
                        [
						'../src/sample1.png',
						                      '../src/sample2.png',
						                      '../src/sample3.png'
                        ]
                    ]
                };
            },
            methods: {
                // 슬라이드를 이동하는 메서드
                moveSlide(index) {
                    const slideWrapper = document.getElementById('slideWrapper');
                    slideWrapper.style.transform = `translateX(-${index * 100}%)`;
                    this.currentIndex = index;
                },

                // 이전 이미지로 이동
                prevImage() {
                    // 현재 슬라이드의 이미지 인덱스를 업데이트
                    this.currentImageIndex[this.currentIndex] = (this.currentImageIndex[this.currentIndex] - 1 + this.slides[this.currentIndex].length) % this.slides[this.currentIndex].length;
                },

                // 다음 이미지로 이동
                nextImage() {
                    // 현재 슬라이드의 이미지 인덱스를 업데이트
                    this.currentImageIndex[this.currentIndex] = (this.currentImageIndex[this.currentIndex] + 1) % this.slides[this.currentIndex].length;
                }
            },
            mounted() {
                // 슬라이드 이동 버튼 이벤트 설정
                document.getElementById('prevBtn').addEventListener('click', () => {
                    const newIndex = this.currentIndex > 0 ? this.currentIndex - 1 : this.slides.length - 1;
                    this.moveSlide(newIndex);
                });

                document.getElementById('nextBtn').addEventListener('click', () => {
                    const newIndex = this.currentIndex < this.slides.length - 1 ? this.currentIndex + 1 : 0;
                    this.moveSlide(newIndex);
                });

                // 초기 슬라이드 설정
                this.moveSlide(0);
            }
        });
        app.mount('#app');
    </script>
</body>
</html>
