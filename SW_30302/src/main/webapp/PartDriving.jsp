<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	ResultSet rs;
	String sql = "select " +
			"dr.DEPT_CODE, " +
			"de.DEPT_NAME, " +
			"sum(dr.DRV_END - dr.DRV_START), " +
			"to_char(sum(dr.DRV_MONEY), 'L999,999,999') " +
			"from TBL_DRIVE dr, TBL_DEPT de " +
			"where dr.DEPT_CODE = de.DEPT_CODE " +
			"group by " +
			"dr.DEPT_CODE, " +
			"de.DEPT_NAME " +
			"order by " +
			"case when dr.DEPT_CODE = '10' then dr.DEPT_CODE " +
			"when dr.DEPT_CODE = '20' then dr.DEPT_CODE " +
			"when dr.DEPT_CODE = '30' then de.DEPT_NAME " +
			"when dr.DEPT_CODE = '40' then dr.DEPT_CODE end";	
	
	rs = con.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<section>
		<h2>(부서별)주행통계</h2>
		<table border="1">
			<tr>
				<th>부서코드</th>
				<th>부서명</th>
				<th>총운행거리</th>
				<th>총주유금액</th>
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
	</section>
</body>
</html>