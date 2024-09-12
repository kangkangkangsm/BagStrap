<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page contentType="text/html; charset=UTF-8" %>
	<%@ page pageEncoding="UTF-8" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>
</head>
<body>
    <h1>Search Result</h1>
    <pre>${books}</pre> <!-- JSON 결과를 출력 -->
    <a href="/search">다시 검색하기</a>
	<img src = "https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F506439%3Ftimestamp%3D20231201015513">
</body>
</html>
<script>
	console.log(${books})	
</script>
	