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
		    "p.pno, " +
		    "p.pname, " +
		    "e.eno, " +
		    "e.ename, " +
		    "d.dname, " +
		    "e.position, " +
		    "a.role " +
		"from tbl_assign_26 a " +
		"join tbl_emp_26 e on a.eno = e.eno " +
		"join tbl_dept_26 d on e.dno = d.dno " +
		"join tbl_project_26 p on a.pno = p.pno " +
		"where p.status = '진행중' " +
		"order by p.pno asc, e.ename asc";
			
	
	rs = con.prepareStatement(list).executeQuery();
	%>

	<table border="1">
		<tr>
			<td>프로젝트번호</td>
			<td>프로젝트명</td>
			<td>직원번호</td>
			<td>직원이름</td>
			<td>부서명</td>
			<td>직급</td>
			<td>역할</td>
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
			<td><%=rs.getString(7)%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>