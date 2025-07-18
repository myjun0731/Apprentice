<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>

	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	ResultSet rs;

	String sql =
			"select " +
			"decode(st.course, 'AD','전문학사','BD','학사','MD','석사','DD','박사'), " +
			"st.studentid, " +
			"st.studentname, " +
			"count(st.studentname) || '과목', " +
			"round(sum(gr.mid*0.3 + gr.final*0.3 + gr.attend*0.2 + gr.report*0.1 + gr.etc*0.1)), " +
			"to_char(round(sum(gr.mid*0.3 + gr.final*0.3 + gr.attend*0.2 + gr.report*0.1 + gr.etc*0.1), 1) / count(st.studentname), '999.9') " +
			"from " +
			"tbl_grade_202205 gr, " +
			"tbl_student_202205 st " +
			"where gr.studentid = st.studentid " +
			"group by " +
			"st.course, " +
			"st.studentid, " +
			"st.studentname " +
			"order by st.studentid desc";
	rs = conn.prepareStatement(sql).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2>개인별성적통계</h2>
	<section style="text-align: center;">
		<table border="1">
			<tr>
				<td>학위과정</td>
				<td>학번</td>
				<td>성명</td>
				<td>수강교과목수</td>
				<td>총점</td>
				<td>평균</td>
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