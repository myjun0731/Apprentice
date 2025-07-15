<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
* {
	margin: 0px auto;
}

header {
	background-color: black;
	text-align: center;
	padding: 20px;
	color: white;
}

nav {
	background-color: gray;
	text-align: left;
	padding: 12px;
	color: white;
	text-decoration: none;
}

a {
	padding-left: 7px;
	text-decoration: none;
	color: white;
}

footer {
	background-color: black;
	text-align: center;
	padding: 12px;
	bottom: 0px;
	color: white;
	text-decoration: none;
	position: fixed;
	width: 100%;
}
</style>
</head>
<body>
	<header>
		<h1>골프연습장 회원 관리 프로그램 ver 1.0</h1>
	</header>
	<nav>
		<a href="1Select.jsp">강사조회</a>
		<a href="2Insert.jsp">수강신청</a>
		<a href="3MemberSelect.jsp">회원정보조회</a>
		<a href="4PriceSelect.jsp">강사매출현황</a>
		<a href="5Index.jsp">홈으로</a>
	</nav>
	<footer>
		<p>상미고 30302</p>
	</footer>
</body>
</html>