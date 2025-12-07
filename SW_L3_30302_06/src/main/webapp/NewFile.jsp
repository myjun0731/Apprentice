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

div hr {
	width: 40%;
	margin-bottom: 10px;
}
footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	padding: 20px;
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
		    "a.goods_cd, " +
		    "a.goods_nm, " +
		    "a.goods_price, " +
		    "a.cost, " +
		    "to_char(a.in_date, 'yy/mm/dd') as in_date " +
			"from tbl_goods_01 a " +
			"order by a.goods_cd asc";

	rs = con.prepareStatement(list).executeQuery();
	%>

	<h2>상품정보조회</h2>
	
	
	<div>
		<hr>
		<table border="1">
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>단가</th>
				<th>원가</th>
				<th>입고일자</th>
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
	</div>
	<footer>
		<p>HRKOREA Copyright@2023 All rights reserved. Human Resources Development Service of Korea</p>
	</footer>
</body>
</html>