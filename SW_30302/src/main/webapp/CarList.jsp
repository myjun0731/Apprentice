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

			"select " +
			"CAR_NO, " +
			"CAR_MODEL, " +
			"CAR_COMPANY, " +
			"subStr(CAR_DATE, 0,4) || '년' ||subStr(CAR_DATE, 5,2) || '월' ||subStr(CAR_DATE, 7,2) || '일' " +
			"from TBL_CAR " +
			"order by CAR_NO";
			
	rs = con.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<section>
		<h2>차량조회</h2>
		<table border="1">
			<tr>
				<th>차량번호</th>
				<th>모델</th>
				<th>제조사</th>
				<th>구매일</th>
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