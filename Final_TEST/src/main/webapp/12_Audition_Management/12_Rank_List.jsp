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
	String SelectSql = 
			"select " +
			"ar.artist_id, " +
			"ar.artist_name, " +
			"sum(po.point), " +
			"to_char(sum(po.point)/count(*), '999.99'), " +
			"row_number() over(order by sum(po.point) DESC) " +
			"from tbl_artist_9 ar, tbl_point_9 po, tbl_mento_9 me " +
			"where ar.artist_id = po.artist_id and me.mento_id = po.mento_id " +
			"group by ar.artist_id, ar.artist_name";
	rs = conn.prepareCall(SelectSql).executeQuery();
	%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<section>
	<h2>참가자등수조회</h2>
		<table border="1">
			<tr>
				<th>참가번호</th>
				<th>참가자명</th>
				<th>총점</th>
				<th>평균</th>
				<th>등수</th>
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
	</section>
</body>
</html>