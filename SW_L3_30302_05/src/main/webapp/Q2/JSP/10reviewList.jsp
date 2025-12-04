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
		    "r.rno, " +
		    "c.cname, " +
		    "p.pname, " +
		    "cat.cname, " +
		    "r.score, " +
		    "r.content, " +
		    "to_char(o.odate,'yyyy-mm-dd') " +
		"from tbl_review_30 r " +
		"join tbl_order_30 o on r.ono = o.ono " +
		"join tbl_customer_30 c on o.cno = c.cno " +
		"join tbl_product_30 p on o.pno = p.pno " +
		"join tbl_category_30 cat on p.cno2 = cat.cno2 " +
		"order by r.rno asc";
	
	rs = con.prepareStatement(list).executeQuery();
	%>

	<table border="1">
		<tr>
			<td>리뷰번호</td>
			<td>고객명</td>
			<td>상품명</td>
			<td>카테고리</td>
			<td>평점</td>
			<td>리뷰내용</td>
			<td>주문일자</td>
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