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
			"p.registration_code, " +
			"p.name, " +
			"subStr(p.birth_day, 1, 4) || '년' || " +
			"subStr(p.birth_day, 7, 5) || '월' || " +
			"subStr(p.birth_day, 7, 8) || '일', " +
			"p.height, " +
			"p.weight, " +
			"decode(subStr(p.registration_code, 0,1), 'A', '1군', 'B', '2군'), " +
			"((((((h.appearance+h.home_runs)/h.hit_numbers)*100)+home_runs) + (h.put_out+(h.double_play*2)-h.error_count*5)))/2, " +
			"row_number() over(order by ((((h.appearance+h.home_runs)/h.hit_numbers)*100) + (h.put_out+(h.double_play*2)-h.error_count*5)) desc) " +
			"from " +
			"tbl_player_info p, " +
			"tbl_hitter_info h " +
			"where p.registration_code = h.registration_code";

	rs = conn.prepareStatement(sql).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">전체 타자 성적 조회</h2>
	<section
		style="justify-content: center; display: flex; text-align: center;">
		<table border="1">

			<tr>
				<td>선수등록코드</td>
				<td>선수명</td>
				<td>생년월일</td>
				<td>키</td>
				<td>몸무게</td>
				<td>소속</td>
				<td>선수등급</td>
				<td>순위</td>
			</tr>
			<%
			while (rs.next()) {

				Double Class = 	Double.parseDouble(rs.getString(7));
				String Team = "";
				if (Class > 230) {
					Team = "A";
				} else if (Class > 200) {
					Team = "B";
				} else if (Class > 180) {
					Team = "C";
				} else if (Class > 140) {
					Team = "D";
				}
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=Team%></td>
				<td><%=rs.getString(8)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>

</body>
</html>