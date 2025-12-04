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
		    "e.eno, " +
		    "e.ename, " +
		    "d.dname, " +
		    "to_char(e.basepay ,'999,999,999,999,999'), " +
		    "sum(w.hours) as work_hours, " +
		    "pc.hourly_pay, " +
		    "to_char((e.basepay + (sum(w.hours) * pc.hourly_pay)),'999,999,999,999,999') as total_pay " +
		"from tbl_emp_29 e " +
		"join tbl_dept_29 d on e.dno = d.dno " +
		"join tbl_payconf_29 pc on d.dno = pc.dno " +
		"join tbl_wtime_29 w on e.eno = w.eno " +
		"where w.work_date >= to_date('2025-06-01', 'YYYY-MM-DD') " +
		  "and w.work_date <= to_date('2025-06-30', 'YYYY-MM-DD') " +
		"group by e.eno, e.ename, d.dname, e.basepay, pc.hourly_pay " +
		"order by d.dname asc, e.ename asc";
			
			
	
	rs = con.prepareStatement(list).executeQuery();
	%>

	<table border="1">
		<tr>
			<td>직원번호</td>
			<td>이름</td>
			<td>부서명</td>
			<td>기본급</td>
			<td>근무시간</td>
			<td>시급</td>
			<td>실급여</td>
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