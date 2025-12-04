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
		    "o.ono, " +
		    "to_char(o.odate, 'yyyy-mm-dd'), " +
		    "c.cname, " +
		    "p.pname, " +
		    "o.qty, " +
		    "(p.price * o.qty) as total_price " +
		"from tbl_order_22 o " +
		"join tbl_customer_22 c on o.cno = c.cno " +
		"join tbl_product_22 p on o.pno = p.pno " +
		"order by o.odate asc, o.ono asc";
			
	
	rs = con.prepareStatement(list).executeQuery();
	%>

	<table border="1">
		<tr>
			<td>주문번호</td>
			<td>주문일자</td>
			<td>고객명</td>
			<td>상품명</td>
			<td>수량</td>
			<td>주문고객</td>
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