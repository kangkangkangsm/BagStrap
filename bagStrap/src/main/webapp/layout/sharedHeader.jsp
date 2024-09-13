<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<script src="http://localhost:8080/js/jquery.js"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/css/style.css">
    <title>웹 페이지 레이아웃</title>
</head>
<body>
    <header class="header">

        <div class="header-logo">
            로고
        </div>

        <nav class="header-menu">
            메뉴
        </nav>
        
        <div class="headerCustomerMenu">
            <div class="headerloginMainMenu headerCustomerSub">
                <div class="headerLogin clickableText">
                    Login
                </div>
                
                <div class="headerloginSubMenu clickableMenu"><a>MyInfo/Join</a></div>
                <div class="headerloginSubMenu clickableMenu"><a>MyStudy</a></div>
                <div class="headerloginSubMenu clickableMenu"><a>MyShop</a></div>
                <div class="headerloginSubMenu clickableMenu"><a>Logout /</a></div>
            </div>
            <div class="headerCSCenter headerCustomerSub clickableText">
                CSCenter
            </div>
            <div class="headerCart headerCustomerSub clickableText">
                Cart
            </div>
            <div class="headerAdmin clickableText">
                <img class="headerIcon clickableMenu" src="http://localhost:8080/src/icon_cart.png">
            </div>
            <div class="headerNotification clickableText" alt="icon_cart">
                <img class="headerIcon" src="http://localhost:8080/src/icon_notification.png" alt="icon_notification">
            </div>
            
        </div>

    </header>
    <script>
		
	</script>
</body>
</html>
