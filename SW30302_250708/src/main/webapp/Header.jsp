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

footer {
	color: white;
}
</style>
</head>
<body>
	<header style="background-color: black; padding: 20px 0;">
		<h1 style="text-align: center; color:white;">학생 성적 조회 프로그램 ver 1.0</h1>
	</header>
	<nav style="background-color: gray; padding: 15px 0;">
		<a href="1StudentList.jsp">학생조회</a>
		<a href="2StudentInsert.jsp">학생성적등록</a>
		<a href="3NumberList.jsp">학생성적조회</a>
		<a href="4Index.jsp">홈으로</a>
	</nav>

	<footer
		style="width: 100%; background-color: gray; padding: 20px 0; bottom: 0; position: absolute;">
		<p style="text-align: center;">Copyrnight @ 2018 ALL right reserved High School</p>
	</footer>
</body>
</html>