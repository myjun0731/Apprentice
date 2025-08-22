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
	String sql = 
			"select  " +
			"subStr(DRV_DATE, 0,4) || '년' ||subStr(DRV_DATE, 5,2) || '월' ||subStr(DRV_DATE, 7,2) || '일', " +
			"dr.CAR_NO, " +
			"ca.CAR_MODEL, " +
			"to_char(DRV_START, '999,999,999'), " +
			"to_char(DRV_END, '999,999,999'), " +
			"de.DEPT_NAME, " +
			"to_char(DRV_MONEY, 'L999,999,999') " +
			"from TBL_DRIVE dr, TBL_CAR ca, TBL_DEPT de " +
			"where ca.CAR_NO = dr.CAR_NO and dr.DEPT_CODE = de.DEPT_CODE " +
			"order by CAR_NO, DRV_START desc";
	
	rs = con.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<section>
		<h2>주행내역조회</h2>
		<table border="1">
			<tr>
				<th>주행일자</th>
				<th>차량번호</th>
				<th>모델</th>
				<th>출발Km</th>
				<th>도착Km</th>
				<th>부서명</th>
				<th>주유금액</th>
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
	</section>
</body>
</html>