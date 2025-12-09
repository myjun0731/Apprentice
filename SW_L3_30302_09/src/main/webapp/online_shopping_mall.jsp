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
	
	h2 {
		padding: 20px;
	}
</style>
</head>
<body>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	PreparedStatement pstmt;
	ResultSet rs;
	String list = 
			"select " +
		    "a.orderid as 주문번호, " +
		    "a.custid as 고객ID, " +
		    "b.name as 고객명, " +
		    "a.prodid as 상품ID, " +
		    "c.prodname as 상품명, " +
		    "a.qty as 수량, " +
		    "case when a.paytype = '1' then '카드' " +
			"when a.paytype = '2' then '무통장' " +
			"else a.paytype " +
		    "end as 결제수단, " +
		    "to_char(a.orderdate,'yyyy-mm-dd') as 주문일자 " +
			"from tbl_order_04 a " +
			"join tbl_customer_04 b " +
			"on a.custid = b.custid " +
			"join tbl_product_04 c " +
			"on a.prodid = c.prodid " +
			"order by a.orderid asc";
			
	rs = con.prepareStatement(list).executeQuery();
	%>

	<h2>주문 내역 조회</h2>

	<table border="1" style="border-collapse: collapse;">
		<tr>
			<th>주문번호</th>
			<th>고객ID</th>
			<th>고객명</th>
			<th>상품ID</th>
			<th>상품명</th>
			<th>수량</th>
			<th>결제수단</th>
			<th>주문일자</th>
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