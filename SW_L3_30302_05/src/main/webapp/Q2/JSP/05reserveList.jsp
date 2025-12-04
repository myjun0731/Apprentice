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
		    "rs.rsno, " +
		    "g.gname, " +
		    "g.phone, " +
		    "rm.rno, " +
		    "rm.rtype, " +
		    "to_char(rs.checkin, 'yyyy-mm-dd'), " +
		    "rs.nights, " +
		    "(rm.price * rs.nights) as total_fee " +
		"from tbl_reserve_25 rs " +
		"join tbl_guest_25 g on rs.gno = g.gno " +
		"join tbl_room_25 rm on rs.rno = rm.rno " +
		"where rs.checkin >= to_date('2025-05-01', 'YYYY-MM-DD') " +
		  "and rs.checkin <= to_date('2025-05-31', 'YYYY-MM-DD') " +
		"order by rs.checkin asc, rs.rsno asc";
	
	rs = con.prepareStatement(list).executeQuery();
	%>

	<table border="1">
		<tr>
			<td>예약번호</td>
			<td>고객명</td>
			<td>연락처</td>
			<td>객실번호</td>
			<td>객실타입</td>
			<td>체크인일자</td>
			<td>숙박일수</td>
			<td>총요금</td>
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
			<td><%=rs.getString(8)%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>