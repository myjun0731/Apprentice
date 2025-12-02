<%@page import="java.sql.*"%>
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
	
	hr {
		margin: 5px 0;
	}
	
	h2 {
		padding: 10px 0;
	}
	
	footer {
		width: 100%;
		position: fixed;
		bottom: 0;
		padding: 10px;
	}
</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	ResultSet rs;

	String list = "select " + "PGMID || '['|| PGMCNT ||'회]' " + ",PGMNAME " + ",pg.TYPENAME " + ",PGMDATE " + ",PGMTIME "
			+ ",decode(PGMDAY, '1','월', '2','화', '3','수', '4','목', '5','금', '6','토', '7','일') " + "from TBL_SCHEDULE_05 sc "
			+ "join TBL_PGMTYPE_05 pg " + "on sc.TYPECODE = pg.TYPECODE";

	rs = con.prepareStatement(list).executeQuery();
	%>

	<h2>방송프로그램조회</h2>
	<hr>
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<td>프로그램ID</td>
			<td>프로그램명</td>
			<td>분류명</td>
			<td>방송일자</td>
			<td>방송시간</td>
			<td>방송요일</td>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
		</tr>
		<%
		}
		%>
	</table>
	
	<footer>
		<p>HRDKOREA Copytrightⓒ2018 All rights reserved. Human Resources Development Service of korea</p>
	</footer>
</body>
</html>