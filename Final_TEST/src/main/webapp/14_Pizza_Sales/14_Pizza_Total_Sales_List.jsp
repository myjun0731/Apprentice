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
			"sa.saleno, " +
			"sh.scode || '-' || sh.sname, " +
			"to_char(sa.saledate,'YYYY-MM-DD'), " +
			"pi.pcode, " +
			"pi.pname, " +
			"sa.amount, " +
			"to_char(pi.cost*sa.amount, 'L999,999,999')  " +
			"from tbl_pizza_10 pi, tbl_shop_10 sh, tbl_salelist_10 sa " +
			"where sa.pcode = pi.pcode and sa.scode = sh.scode " +
			"order by sa.saleno";
			
	rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<section>
		<h2>통합매출 현황 조회</h2>
		<table border="1">
			<tr>
				<td>매출전표번호</td>
				<td>지점</td>
				<td>판매일자</td>
				<td>피자코드</td>
				<td>피자명</td>
				<td>판매수량</td>
				<td>매출액</td>
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
	</section>
</body>
</html>