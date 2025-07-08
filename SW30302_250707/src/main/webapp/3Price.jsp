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
	String sql = "select me.custno, me.custname, decode(grade, 'A','VIP','B','일반','C','직원'), to_char(sum(mo.price), '999,999') "
			+ "from member_tbl_02 me, money_tbl_02 mo " + "where me.custno = mo.custno "
			+ "group by me.custno, me.custname, me.grade " + "order by sum(mo.price) desc";

	rs = conn.prepareStatement(sql).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">회원매출조회</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center; display: flex;">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>