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
			"subStr(c.regist_month, 0,4) || '년' || " +
			"subStr(c.regist_month, 5,2) || '월', " +
			"c.c_no, " +
			"m.c_name, " +
			"t.class_name, " +
			"c.class_area, " +
			"to_char(c.tuition, 'L999,999'), " +
			"m.grade " +
			"from " +
			"tbl_member_202201 m, tbl_class_202201 c, tbl_teacher_202201 t " +
			"where m.c_no = c.c_no and t.teacher_code = c.teacher_code";
			
	rs =  conn.prepareStatement(sql).executeQuery();
%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">회원정보조회</h2>
	<section style="justify-content: center; display: flex; text-align: center;"">
		<form action="2Insert_Detail.jsp">
			<table border="1">
				<tr>
					<td>수강일</td>
					<td>회원번호</td>
					<td>회원명</td>
					<td>강의명</td>
					<td>강의장소</td>
					<td>수강료</td>
					<td>등급</td>
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
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
				</tr>
				<%
		}
			%>
			</table>
		</form>
	</section>
</body>
</html>