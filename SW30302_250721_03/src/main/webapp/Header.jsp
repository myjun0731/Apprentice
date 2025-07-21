<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0 auto;
}

nav a {
	padding-left: 12px;
	text-decoration: none;
	color: white;
}

header {
	background-color: black;
	padding: 20px 0;
}

nav {
	background-color: gray;
	padding: 15px 0;
}

section {

}

footer {
	background-color: black;
	padding: 15px 0;
	width: 100%;
	position: fixed;
	bottom: 0px;
	color: white;
}

p {
	text-align:center;
	color: white;
}
</style>
</head>
<body>
	<header>
		<h1 style="text-align: center; color: white;">매장별 커피 판매 관리 Ver 1.0</h1>
	</header>
	<nav>
		<a href="1Insert.jsp">판매등록</a>
		<a href="2List.jsp">판매현황</a>
		<a href="3Shop_List.jsp">매장별총판매액</a>
		<a href="4Price_List.jsp">상품별총판매액</a>
		<a href="5Index.jsp">홈으로</a>
	</nav>

	<footer>
		<p>상미고 30302</p>
	</footer>
</body>
</html>