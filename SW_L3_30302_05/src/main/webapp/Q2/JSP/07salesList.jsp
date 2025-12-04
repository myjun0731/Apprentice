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
		    "s.sno, " +
		    "to_char(s.sdate, 'yyyy-mm-dd'), " +
		    "p.pname, " +
		    "c.cname, " +
		    "p.price, " +
		    "s.qty, " +
		    "(p.price * s.qty) as total_price " +
		"from tbl_sale_27 s " +
		"join tbl_product_27 p on s.pno = p.pno " +
		"join tbl_category_27 c on p.cno = c.cno " +
		"where s.sdate >= to_date('2025-06-01', 'YYYY-MM-DD') " +
		  "and s.sdate <= to_date('2025-06-30', 'YYYY-MM-DD') " +
		"order by s.sdate asc, s.sno asc";
	
	rs = con.prepareStatement(list).executeQuery();
	%>

	<table border="1">
		<tr>
			<td>판매번호</td>
			<td>판매일자</td>
			<td>상품명</td>
			<td>카테고리</td>
			<td>단가</td>
			<td>수량</td>
			<td>총액</td>
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