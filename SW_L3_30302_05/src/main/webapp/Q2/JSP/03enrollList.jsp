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
		    "s.sno, " +
		    "s.sname, " +
		    "sub.subname, " +
		    "sub.credit, " +
		    "e.grade " +
		"from tbl_enroll_23 e " +
		"join tbl_student_23 s on e.sno = s.sno " +
		"join tbl_subject_23 sub on e.subno = sub.subno " +
		"where s.major = '컴퓨터공학' " +
		"order by s.sno asc, sub.subname asc";
	
	rs = con.prepareStatement(list).executeQuery();
	%>

	<table border="1">
		<tr>
			<td>학번</td>
			<td>이름</td>
			<td>과목명</td>
			<td>학점</td>
			<td>성적</td>
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
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>