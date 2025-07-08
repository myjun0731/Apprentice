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
	String sql = "select sa.saleno, sa.pcode, sa.saledate, sa.scode, sa.amount, to_char(sum(pr.cost*sa.amount), '999,999') "
			+ "from tbl_salelist_01 sa, tbl_product_01 pr " + "where sa.pcode = pr.pcode "
			+ "group by sa.saleno, sa.pcode, sa.saledate, sa.scode, sa.amount " + "order by sa.saleno";
	rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>

	<h2 style="text-align: center; padding: 20px;">판매현황</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center;">
			<tr>
				<td>판매번호</td>
				<td>판매코드</td>
				<td>판매일</td>
				<td>매장코드</td>
				<td>수량</td>
				<td>총판매액</td>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3).substring(0, 10)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>