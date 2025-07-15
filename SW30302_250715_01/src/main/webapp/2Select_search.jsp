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
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	String dbColumn = request.getParameter("DBcolumn");

	String sql = "select " +
			"p.registration_code, p.name, h.game_numbers, h.appearance, h.hit_numbers, " +
			"h.home_runs, to_char((((h.hit_numbers / h.appearance) * 100) + 100),'999.99'), " +
			"h.put_out, h.double_play, h.error_count, " +
			"(h.put_out + (h.double_play * 2) - (h.error_count * 5)) " +
			"from tbl_player_info p, tbl_hitter_info h " +
			"where p.registration_code = h.registration_code ";

	if ("registration_code".equals(dbColumn)) {
		sql += "and p.registration_code like ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + request.getParameter("registration_code") + "%");
	} else if ("name".equals(dbColumn)) {
		sql += "and p.registration_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));
	} else if ("birth_day".equals(dbColumn)) {
		sql += "and p.birth_day = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("birth_day"));
	}

	if (pstmt != null) {
		rs = pstmt.executeQuery();
	}
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<%
	if(rs != null && rs.next()){
	%>
	<h2 style="text-align: center; padding: 20px;">
		선수 등록 코드 :
		<%=rs.getString(1)%>
		성적 조회
	</h2>
	<section
		style="justify-content: center; display: flex; text-align: center;">
		<table border="1">

			<tr>
				<td>선수등록코드</td>
				<td>선수명</td>
				<td>게임수</td>
				<td>타석수</td>
				<td>안타수</td>
				<td>홈런수</td>
				<td>공격포인트</td>
				<td>아웃카운트수</td>
				<td>더블플레이수</td>
				<td>에러수</td>
				<td>수비포인트</td>
			</tr>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(10)%></td>
				<td><%=rs.getString(11)%></td>
			</tr>
			<tr>
				<td colspan="11"><input type="button" value="돌아가기"
					onclick="location.href='2Select.jsp'"></td>
			</tr>
		</table>
	</section>
	<%
	} else {
	%>
	<h2 style="text-align: center; padding: 20px;">선수 등록 코드 : 선택된 선수가
		없습니다.</h2>
	<%
	}
	%>
</body>
</html>