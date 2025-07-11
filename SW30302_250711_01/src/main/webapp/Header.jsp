<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
}

nav a {
	padding-left: 12px;
	text-decoration: none;
	color: white;
}

footer{
	color: white;
}
</style>
</head>
<body>
	<header style="background-color: black; padding: 20px 0;">
		<h1 style="text-align: center; color: white;">매장별 커피 판매 관리 Ver 1.0</h1>
	</header>
	<nav style="background-color: gray; padding: 15px 0;">
		<a href="1Insert.jsp">판매등록</a>
		<a href="sales?action=list">판매현황</a>
		<a href="sales?action=Slist">매장별판매액</a>
		<a href="sales?action=Plist">상품별판매액</a>
		<a href="5Index.jsp">홈으로</a>
	</nav>

	<footer
		style="background-color: gray; padding: 15px 0; width: 100%; position: absolute; bottom: 0px;">
		<p style="text-align: center;">Copyright @ 2018 All right
			reservered SangilMedia High School</p>
	</footer>
</body>
</html>