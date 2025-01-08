<<<<<<< Upstream, based on branch 'main' of https://github.com/YSLennon/ProjectBagStrap.git
# 🌟 현이의 가방끈 플랫폼 - 프로젝트 README

## 📝 프로젝트 개요

'현이의 가방끈'은 스터디 그룹 생성, 커뮤니티,서적 판매 기능을 지원하는 웹 플랫폼입니다. 이 프로젝트는 사용자들이 스터디 그룹을 생성하고, 다른 사용자들과 자유롭게 소통하며, 필요한 학습 서적을 거래할 수 있는 종합적인 학습 지원 플랫폼을 목표로 하고 있습니다.

## 🚀 주요 기능

### 1. **도서 판매 및 참고 도서 관리**
- 스터디 그룹에 필요한 학습 서적을 참고하고, 책을 거래할 수 있는 기능이 제공됩니다.
- Iamport 결제 게이트웨이와 연동된 결제 기능을 통해 결제 프로세스를 지원하며, 결제 후 환불이 필요한 경우 간편하게 환불 요청을 할 수 있습니다.
  
### 2. **스터디 그룹 관리**
- 사용자는 스터디 그룹을 생성하고, 모집, 관리, 그리고 그룹원과의 상호작용을 할 수 있습니다. 그룹 정보 수정, 삭제 및 그룹원 초대, 강퇴 기능이 포함되어 있습니다.
- 그룹원들 간 실시간 채팅이 가능하여, 스터디 그룹 내에서 의견을 교환하고 공동 학습을 할 수 있습니다. 채팅창에서는 파일 공유 및 이미지 첨부도 지원됩니다.

### 3. **커뮤니티 기능**
- 자유게시판 및 그룹별 커뮤니티 기능이 제공되어 사용자들이 그룹 내외에서 자유롭게 의견을 나누고 정보를 공유할 수 있습니다.

### 4. 알람기능 
- 주요 활동(결제 상태, 환불 요청 결과, 스터디 그룹 신청/승인/거절, 커뮤니티 활동 등)에 대해 사용자에게 실시간 알림이 제공됩니다. 알림을 통해 플랫폼 내에서의 모든 중요 이벤트를 놓치지 않도록 합니다.


## 👥 주요 기여자와 담당 코드

### 팀장: 하유성

#### **하유성** (팀장)
플랫폼의 전반적인 설계와 관리, 여러 주요 기능 개발에 선도적인 역할을 맡았습니다. 특히 UI 및 사용자 경험을 개선하고 핵심 기능의 개발을 주도하였습니다.

- **담당 기능**:
  - 플랫폼 전체의 헤더, 사이드바, 풋터 HTML 템플릿 구성
  - 사용자 인터페이스: 사용자 로그인, 관리 기능 및 주문 관리 페이지 개발
  - 주문 페이지에서 주소 선택 및 결제 게이트웨이 연동 기능 구현
  - 책 상세보기 페이지: 책 제목, 저자, 출판사, ISBN, 카테고리 등의 정보를 표시하고, 관련 도서 및 스터디 목록을 보여주며, 장바구니에 추가하는 기능을 구현
  - 결제, 환불, 회원 정보 변경 등 여러 트리거를 개발하여 사용자에게 적시에 알림을 제공하도록 함.
  - Iamport 결제 연동 API 구현.

[![GitHub](https://img.shields.io/badge/GitHub-hayuseong-blue?logo=github)](https://github.com/YSLennon)

---

#### **강선민**
하유성(팀장)과 함께 프로젝트의 설계, 관리, 및 여러 기능 개발에 참여했습니다. 특히 스터디 그룹 관리와 커뮤니티 기능을 중심으로, 사용자들이 플랫폼에서 활발히 참여할 수 있는 기능들을 구현하였습니다. 또한, 메인 페이지와 이벤트 페이지 개발에 기여했으며, 이벤트 페이지를 통해 사용자가 다양한 대회 정보를 쉽게 조회하고 접근할 수 있도록 구축하였습니다.

- **담당 기능**:
  - 스터디 그룹 생성 페이지: 그룹 기본 정보 입력 및 수정 기능 구현
  - 스터디 그룹 세부 정보 페이지: 그룹장 위임, 멤버 관리 및 그룹 정보 수정 가능
  - 자유게시판 및 실시간 채팅 기능 개발: 사용자 간의 실시간 상호작용 지원
  - 그룹원 관리 인터페이스 개발: 그룹원 가입 승인 및 거절, 그룹원 강퇴 기능 제공
  - 스터디 그룹의 생성, 수정, 신청, 채팅에 관련된 여러 트리거를 개발하여 사용자에게 적시에 알림을 제공하도록 함.
  -  메인페이지: 새로 책을 리스트로 나타내고 스토어와 스터디 그룹을 탐색하기 쉽게 제공함
  -  이벤트페이지: 월별 탐색 기능을 통한 다양한 사용자 경험 제공
  -  이벤트 페이지를 통해 스토어와 스터디 연결 및 사용자 접속률 향상
   
[![GitHub](https://img.shields.io/badge/GitHub-kangseonmin-blue?logo=github)](https://github.com/kangkangkangsm)

---

#### **황보현**
사용자 계정 관리 및 프로필 관리 기능 개발에 중요한 기여를 했으며, 사용자들이 플랫폼을 안전하고 편리하게 이용할 수 있도록 다양한 기능을 구축하였습니다.
- **담당 기능**:
  - 사용자 계정 관리 인터페이스: 사용자 검색, 필터링 및 차단/차단 해제 기능 구현
  - 사용자 프로필 관리 인터페이스 : 핸드폰 메신저를 통한 본인확인기능으로 전화번호 수정과 닉네임 및 아이디 업데이트 기능 추가
  - 계정 삭제 페이지 개발: 사용자에게 계정 삭제 전 비밀번호 입력을 요구하는 기능 구현
  - 로그인 및 아이디,비밀번호 찾기 기능 구현
  - Daum 우편번호 API 구현
  - 회원가입기능 : 닉네임과 아이디 중복체크 기능, 사용자가 직접 프로필 사진 등록, 정규식을 통한 보안 강화, 주소 api를 이용하여 주소 입력 기능 구현

[![GitHub](https://img.shields.io/badge/GitHub-hwangbohyun-blue?logo=github)](https://github.com/hwangbohyun0219)

---

#### **송태근**
고객 서비스 센터 관련 기능을 개발하고, 사용자 접근성과 관리자 관리 기능을 향상시키는 데 중요한 역할을 수행하였습니다.
- **담당 기능**:
  - 고객센터cscenter 파트
  - 공지사항
  - Faq 자주묻는 질문
  - 문의하기
  - 문의 내역 (관리자가 답변가능)
  - 내가 문의한 내역 (사용자가 질문 관리자 답변 내용) 

[![GitHub](https://img.shields.io/badge/GitHub-songtaegeun-blue?logo=github)](https://github.com/songtaeg)

---

## 🛠️ 사용된 기술 스택

- **프론트엔드**: Vue.js, HTML, CSS (스타일링 포함), JavaScript
- **백엔드**: Spring Framework, JSP
- **데이터 관리**: AJAX를 통한 비동기 통신, JSON 데이터 포맷 사용
- **기타**: Daum 우편번호 API, Iamport 결제 연동 API

## 시연 동영상 
- [![시연 영상 보기](https://img.youtube.com/vi/KnEwswZHVI4/0.jpg)](https://youtu.be/KnEwswZHVI4?si=5s14YKUagPiPNhTz)
