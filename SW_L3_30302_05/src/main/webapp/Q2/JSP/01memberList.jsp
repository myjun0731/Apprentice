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
</style>
</head>
<body>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	ResultSet rs;
	String list = 
		"select " + 
		    "m.mno, " +
		    "m.name, " +
		    "m.phone, " +
		    "g.gname " +
		"from tbl_member_21 m " +
		"join tbl_grade_21 g  " +
			"on m.gcode = g.gcode " +
		"order by m.mno asc";

	rs = con.prepareStatement(list).executeQuery();
	%>
	
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>이름</td>
			<td>연락처</td>
			<td>등급명</td>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>