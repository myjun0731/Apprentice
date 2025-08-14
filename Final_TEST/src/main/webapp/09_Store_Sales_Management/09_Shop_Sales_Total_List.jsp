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
			"select " +
			"st.store_nm, " +
			"sum(case when pay_type = '01' then goods_price*sale_cnt else 0 end), " +
			"sum(case when pay_type = '02' then goods_price*sale_cnt else 0 end), " +
			"sum(goods_price*sale_cnt) " +
			"from  " +
			"store_tbl_10 st, " +
			"sale_tbl_10 sa, " +
			"tbl_goods_10 go " +
			"where go.goods_cd = sa.goods_cd and st.store_cd = sa.store_cd " +
			"group by st.store_nm";
	rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<section>
		<h2>점포별매출현황</h2>
		<table border="1">
			<tr>
				<td>점포명</td>
				<td>현금매출</td>
				<td>카드매출</td>
				<td>총매출</td>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>