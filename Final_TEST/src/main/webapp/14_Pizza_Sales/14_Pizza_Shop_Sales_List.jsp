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
	PreparedStatement pstmt;
	String sql = 
			
			"select " +
			"sa.scode, " +
			"sh.sname, " +
			"to_char(sum(pi.cost*sa.amount), 'L999,999,999,999') " +
			"from tbl_pizza_10 pi, tbl_shop_10 sh, tbl_salelist_10 sa " +
			"where sa.pcode = pi.pcode and sa.scode = sh.scode " +
			"group by " +
			"sa.scode, " +
			"sh.sname " +
			"order by sa.scode";
	rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<section>
		<h2>지점별 매출 현황</h2>
		<table border="1">
			<tr>
				<td>지점코드</td>
				<td>지점명</td>
				<td>총매출액</td>
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