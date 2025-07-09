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
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	ResultSet rs;
	String sql =

			"SELECT " + "P.p_city, " + "CASE P.p_city " + "WHEN '10' THEN '서울' " + "WHEN '20' THEN '경기' "
			+ "WHEN '30' THEN '강원' " + "WHEN '40' THEN '대구' " + "ELSE '기타' " + "END, " + "COUNT(R.p_no) " + "FROM "
			+ "TBL_PATIENT_202004 P, " + "TBL_RESULT_202004 R " + "WHERE " + "P.p_no = R.p_no " + "GROUP BY "
			+ "P.p_city " + "ORDER BY " + "P.p_city";

	rs = conn.prepareStatement(sql).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">환자조회</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center; display: flex;">
			<tr>
				<th>자역코드</th>
				<th>지역명</th>
				<th>검사건수</th>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>