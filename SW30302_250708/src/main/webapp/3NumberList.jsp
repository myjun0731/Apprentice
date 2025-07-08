<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table th {
	text-align: center;
}
</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	ResultSet rs;
	ResultSet rs2;

	String sql = "SELECT  " + "M.id,  " + "M.name,  " + "M.gender,  " + "S.korean,  " + "S.english,  " + "S.math,  "
			+ "S.history, " + "(S.korean + S.english + S.math + S.history) AS total_score, "
			+ "(S.korean + S.english + S.math + S.history) / 4 AS average_score, "
			+ "row_number() over (order by (S.korean + S.english + S.math + S.history)) as total_rank " + "FROM "
			+ "member_tbl M, score_tbl S " + "where M.id = S.id";

	String sql2 = "select sum(korean), sum(english), sum(math), sum(history), "
			+ "to_char(sum(korean + english + math + history), '99999999.0'), "
			+ "(sum(sum(korean) + sum(english) + sum(math) + sum(history))／count(korean + english + math + history)) "
			+ "from score_tbl " + "group by korean, english, math, history";

	rs = conn.prepareStatement(sql).executeQuery();
	rs2 = conn.prepareStatement(sql2).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 40px;">학생성적조회</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: left;">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학년</th>
				<th>반</th>
				<th>번호</th>
				<th>성별</th>
				<th>국어</th>
				<th>수학</th>
				<th>영어</th>
				<th>역사</th>
				<th>합계</th>
				<th>평균</th>
				<th>순위</th>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(1).substring(0, 1)%></td>
				<td><%=rs.getString(1).substring(1, 3)%></td>
				<td><%=rs.getString(1).substring(3, 5)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(10)%></td>
			</tr>
			<%
			}
			rs2.next();
			%>
			<tr>
				<td colspan="6"></td>
				<th>국어총합</th>
				<th>수학총합</th>
				<th>영어총합</th>
				<th>역사총합</th>
				<th>총합</th>
				<th>총평균</th>
				<th></th>
			</tr>
			<tr>
				<td colspan="6"></td>
				<td><%=rs2.getString(1)%></td>
				<td><%=rs2.getString(3)%></td>
				<td><%=rs2.getString(2)%></td>
				<td><%=rs2.getString(4)%></td>
				<td><%=rs2.getString(5)%></td>
				<td><%=rs2.getString(6)%></td>
				<td></td>
			</tr>
		</table>
	</section>
</body>
</html>