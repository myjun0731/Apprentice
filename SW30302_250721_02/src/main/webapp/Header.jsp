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
		<h1>학생 성적 조회 프로그램 ver 1.0</h1>
	</header>
	<nav>
		<a href="1StList.jsp">학생조회</a>
		<a href="2StInsert.jsp">학생성적등록</a>
		<a href="3StScore.jsp">학생성적조회</a>
		<a href="4Index.jsp">홈으로</a>
	</nav>
	<footer>
		<p>상미고 30302</p>
	</footer>
</body>
</html>