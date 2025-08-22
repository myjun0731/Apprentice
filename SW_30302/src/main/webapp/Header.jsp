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
		text-align: center;
	}
	
	header {
		padding: 20px 0;
		background-color: black;
		color: white;
	}
	
	nav {
		text-align:left;
		padding: 13px 0;
		background-color: gray;
	}
	
	nav a {
		padding-left: 12px;
		text-decoration: none;
		color: white;
	}
	
	section h2 {
		padding: 20px;
	}
	footer {
		position: fixed;
		width: 100%;
		bottom: 0;
		padding: 20px 0;
		background-color: black;
		color: white;
	}
</style>
</head>
<body>
	<header>
		<h1>(과정평가형 정보처리산업기사)차량주행관리 프로그램</h1>
	</header>
	
	<nav>
		<a href="CarList.jsp">차량조회</a>
		<a href="DrivingInsert.jsp">주행내역등록</a>
		<a href="DrivingList.jsp">주행내역조회</a>
		<a href="PartDriving.jsp">부서별주행통계</a>
		<a href="Index.jsp">홈으로</a>
	</nav>
	
	<footer>
		<p>Footer</p>
	</footer>
</body>
</html>