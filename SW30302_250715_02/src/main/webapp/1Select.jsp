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
	String sql = "select " +
			"teacher_code, " +
			"teacher_name, " +
			"class_name, " +
			"to_char(class_price, 'L999,999'), " +
			"subStr(teacher_regist_date, 0,4) || '년' || " +
			"subStr(teacher_regist_date, 5,2) || '월' || " +
			"subStr(teacher_regist_date, 7,2) || '일' " +
			"from tbl_teacher_202201";
			
	rs =  conn.prepareStatement(sql).executeQuery();
%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">강사조회</h2>
	<section style="justify-content: center; display: flex; text-align: center;">
		<form action="2Insert_Detail.jsp">
			<table border="1">
				<tr>
					<td>강사코드</td>
					<td>강사명</td>
					<td>강의명</td>
					<td>수강료</td>
					<td>강사자격취득일</td>
				</tr>
				<%
		while(rs.next()){
			%>

				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
				</tr>
				<%
		}
			%>
			</table>
		</form>
	</section>
</body>
</html>