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
			"r.p_no, " +
			"p.p_name, " +
			"t.t_name, " +
			"to_char(to_date(r.sdate, 'YYYYMMDD'), 'YYYY-MM-DD'), " +
			"case r.t_status " +
			"when '1' then '검사중' " +
			"when '2' then '검사완료' " +
			"else '상태없음' " +
			"end, " +
			"to_char(r.ldate, 'YYYY-MM-DD'), " +
			"case r.t_result " +
			"when 'X' then '미입력' " +
			"when 'P' then '양성' " +
			"when 'N' then '음성' " +
			"else '미입력' " +
			"end " +
			"from " +
			"tbl_result_202004 r, " +
			"TBL_PATIENT_202004 p, " +
			"tbl_lab_test_202004 t " +
			"where " +
			"r.p_no = p.p_no and r.t_code = t.t_code " +
			"order by " +
			"r.p_no";
			
			
			
			
	rs = conn.prepareStatement(sql).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">검사결과조회</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center; display: flex;">
			<tr>
				<th>환자코드</th>
				<th>환자이름</th>
				<th>검사명</th>
				<th>검사시작일</th>
				<th>검사상태</th>
				<th>검사완료일</th>
				<th>검사결과</th>
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