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
	font-weight: bold;
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
		<h1>(과정평가형산업기사)검사프로그램</h1>
	</header>
	
	<nav>
		<a href="1Select_P.jsp">환자조회</a>
		<a href="2Insert.jsp">검사결과입력</a>
		<a href="3Select_R.jsp">검사결과조회</a>
		<a href="4Select_C.jsp">지역별검사건수</a>
		<a href="5Index.jsp">홈으로</a>
	</nav>
	
	<footer>
		<p>Copyright @ 2020 All right reserved HRD</p>
	</footer>
</body>
</html>
