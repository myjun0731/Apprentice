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
			"me.m_no, " +
			"me.m_name, " +
			"count(me.m_no) " +
			"from tbl_vote9 vo, tbl_member_9 me " +
			"where me.m_no = vo.m_no and vo.v_confirm = 'Y' " +
			"group by " +
			"me.m_no, " +
			"me.m_name " +
			"order by count(vo.m_no) desc";

	rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<section>
		<h2>후보자 등수</h2>
		<table border="1">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>총투표건수</td>
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