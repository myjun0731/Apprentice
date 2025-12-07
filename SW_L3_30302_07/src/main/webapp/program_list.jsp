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
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	ResultSet rs;

	String list = "select " + "s.PGMID || '[' || PGMCNT || '회]', " + "s.PGMNAME, " + "t.TYPENAME, " + "s.PGMDATE, "
			+ "s.PGMTIME, " + "decode(s.PGMDAY,'1','월','2','화','3','수','4','목','5','금','6','토','7','일') "
			+ "from TBL_SCHEDULE_05 s " + "join TBL_PGMTYPE_05 t " + "on s.TYPECODE = t.TYPECODE";

	rs = con.prepareStatement(list).executeQuery();
	%>

	<table border="1">
		<tr>
			<th>프로그램ID</th>
			<th>프로그램명</th>
			<th>분류명</th>
			<th>방송일자</th>
			<th>방송시간</th>
			<th>방송요일</th>
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
</body>
</html>