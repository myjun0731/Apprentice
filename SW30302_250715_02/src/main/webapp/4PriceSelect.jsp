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
			"t.teacher_code, " +
			"t.class_name, " +
			"t.teacher_name, " +
			"to_char(sum(c.tuition), 'L999,999') " +
			"from  " +
			"tbl_teacher_202201 t, " +
			"tbl_class_202201 c " +
			"where t.teacher_code = c.teacher_code " +
			"group by t.teacher_code, " +
			"t.class_name, " +
			"t.teacher_name, " +
			"c.tuition " +
			"order by t.teacher_code";
			
	rs =  conn.prepareStatement(sql).executeQuery();
%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">강사매출현황</h2>
	<section
		style="justify-content: center; display: flex; text-align: center;"">
		<form action="2Insert_Detail.jsp">
			<table border="1">
				<tr>
					<td>강사코드</td>
					<td>강의명</td>
					<td>강사명</td>
					<td>총매출</td>
				</tr>
				<%
		while(rs.next()){
			%>

				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
				</tr>
				<%
		}
			%>
			</table>
		</form>
	</section>
</body>
</html>