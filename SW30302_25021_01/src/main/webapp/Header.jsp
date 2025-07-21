<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0 auto;
}

header {
	background-color: black;
	padding: 20px 0;
}

header h1 {
	text-align: center;
	color: white;
}

nav {
	background-color: gray;
	padding: 12px 0;
}

nav a {
	text-align: left;
	padding-left: 12px;
	text-decoration: none;
	color: white;
}

footer {
	position: fixed;
	background-color: black; padding : 15px;
	width: 100%;
	bottom: 0;
	padding: 15px;
}

footer p {
	text-align: center;
	color: white;
}

section {
	text-align: center;
}
</style>
</head>
<body>
	<header>
		<h1>쇼핑몰 회원 관리 프로그램</h1>
	</header>
	<nav>
		<a href="1Insert.jsp">회원등록</a>
		<a href="2MemberList.jsp">회원목록조회/수정</a>
		<a href="3Price.jsp">회원매출조회</a>
		<a href="4Index.jsp">홈으로</a>
	</nav>
	<footer>
		<p>상미고 30302</p>
	</footer>
</body>
</html>