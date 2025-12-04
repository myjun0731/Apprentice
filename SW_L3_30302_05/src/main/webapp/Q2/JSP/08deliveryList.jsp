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
		    "d.dno, " +
		    "c.cname, " +
		    "c.phone, " +
		    "p.pname, " +
		    "d.from_loc, " +
		    "d.to_loc, " +
		    "d.status " +
		"from tbl_delivery_28 d " +
		"join tbl_customer_28 c on d.cno = c.cno " +
		"join tbl_product_28 p on d.pno = p.pno " +
		"where d.status = '배송중' " +
		"order by c.cname asc";
			
			
	rs = con.prepareStatement(list).executeQuery();
	%>

	<table border="1">
		<tr>
			<td>배송번호</td>
			<td>고객명</td>
			<td>연락처</td>
			<td>상품명</td>
			<td>출발지</td>
			<td>도착지</td>
			<td>상태</td>
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