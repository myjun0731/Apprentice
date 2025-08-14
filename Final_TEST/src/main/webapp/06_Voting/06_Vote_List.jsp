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
				  "v_name, " +
				  "to_char(to_date('19'||SubStr(v_jumin, 1, 6), 'YYYYMMDD'), 'YYYY\"년\"MM\"월\"DD\"일\"'), " +
				  "'만 ' || (2020 - to_number('19' || subStr(v_jumin, 1, 2))) || '세', " +
				  "decode(subStr(v_jumin, 7,1), '1','남','2','여'), " +
				  "m_no, " +
				  "to_char(to_date(v_time, 'HH24:MI'), 'HH24:MI'), " +
				  "decode(v_confirm, 'N','미확인','Y','확인') " +
				"from tbl_vote9 " +
				"where v_area = '제1투표장'";
				
		rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<section>
		<h2>투표 검수 조회</h2>
				<table border="1">
			<tr>
				<td>성명</td>
				<td>생년월일</td>
				<td>나이</td>
				<td>성별</td>
				<td>후보번호</td>
				<td>투표시간</td>
				<td>유권자확인</td>
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