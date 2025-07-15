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
		<h1>타자 성적관리 프로그램 Ver1.0</h1>
	</header>
	<nav>
		<a href="1Insert.jsp">타자성적등록</a>
		<a href="2Select.jsp">개별타자성적조회</a>
		<a href="3AllSelect.jsp">전체타자성적조회</a>
		<a href="4Index.jsp">홈으로</a>
	</nav>
</body>
</html>