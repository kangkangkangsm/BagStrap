<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도서 검색</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>도서 검색</h1>
    <form id="searchForm">
        <input type="text" id="query" name="query" placeholder="검색어를 입력하세요" required>
        <button type="submit">검색</button>
    </form>
    <div id="results">
        <!-- 검색 결과가 여기에 표시됩니다 -->
    </div>

    <script>
        $(document).ready(function() {
            $('#searchForm').on('submit', function(e) {
                e.preventDefault();
                var query = $('#query').val();
                
                $.ajax({
                    url: '/search1',
                    type: 'GET',
                    data: { query: query },
                    success: function(data) {
						console.log(data);
                        var results = '';
                        data.items.forEach(function(item) {
                            results += '<div>';
                            results += '<h3>' + item.title + '</h3>';
                            results += '<p>저자: ' + item.author + '</p>';
                            results += '<p>출판사: ' + item.publisher + '</p>';
                            results += '<p>출판일: ' + item.pubdate + '</p>';
                            results += '<p>가격: ' + item.price + '</p>';
                            results += '<p><a href="' + item.link + '">자세히 보기</a></p>';
                            results += '</div>';
                        });
                        $('#results').html(results);
                    },
                    error: function() {
                        $('#results').html('<p>검색 중 오류가 발생했습니다.</p>');
                    }
                });
            });
        });
    </script>
</body>
</html>



<!--KAKAO API-->
<!--<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page contentType="text/html; charset=UTF-8" %>
	<%@ page pageEncoding="UTF-8" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Search</title>
</head>
<body>
    <h1>Book Search</h1>
    <form action="/searchBook" method="get">
        <input type="text" name="query" placeholder="책 제목을 입력하세요" required>
        <button type="submit">검색</button>
    </form>
</body>
</html>-->