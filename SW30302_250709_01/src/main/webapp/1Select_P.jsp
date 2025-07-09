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
	String sql = "select " + "p_no, " + "p_name, " + "substr(p_birth, 1, 4) || '년' || " + "substr(p_birth, 5, 2) || '월' || "
			+ "substr(p_birth, 7, 2) || '일', " + "case p_gender " + "when 'M' then '남' " + "when 'F' then '여' " + "end, "
			+ "p_tel1 || '-' || p_tel2 || '-' || p_tel3, " + "case p_city " + "when '10' then '서울' "
			+ "when '20' then '경기' " + "when '30' then '강원' " + "when '40' then '대구' " + "end " + "from TBL_PATIENT_202004 "
			+ "order by p_no";

	rs = conn.prepareStatement(sql).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">환자조회</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center; display: flex;">
			<tr>
				<th>환자 코드
				</th>
				<th>환자 이름</th>
				<th>환자 생년월일</th>
				<th>환자 성별</th>
				<th>환자 전화번호</th>
				<th>환자 거주지</th>
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
			</tr>
			<%
			}
			%>
		</table>
	</section>

</body>
</html>