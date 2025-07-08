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
			"select sh.scode, sh.sname, to_char(sum(pr.cost*sa.amount), '999,999') " +
			"from tbl_shop_01 sh, tbl_salelist_01 sa, tbl_product_01 pr " +
			"where pr.pcode = sa.pcode and sh.scode = sa.scode " +
			"group by sh.scode, sh.sname " +
			"order by sh.scode";
			
			rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>

	<h2 style="text-align: center; padding: 20px;">매장별 판매액</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center;">
			<tr>
				<td>매장코드</td>
				<td>매장명</td>
				<td>매장별 판매액</td>
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