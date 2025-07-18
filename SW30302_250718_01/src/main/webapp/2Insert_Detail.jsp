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
	PreparedStatement pstmt;

	String studentid = request.getParameter("studentid");
	String subjectcode = request.getParameter("subjectcode");
	String mid = request.getParameter("mid");
	String final1 = request.getParameter("final1");
	String attend = request.getParameter("attend");
	String report = request.getParameter("report");
	String etc = request.getParameter("etc");

	String sql = "insert into tbl_grade_202205 values(?,?,?,?,?,?,?)";

	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, studentid);
	pstmt.setString(2, subjectcode);
	pstmt.setString(3, mid);
	pstmt.setString(4, final1);
	pstmt.setString(5, attend);
	pstmt.setString(6, report);
	pstmt.setString(7, etc);

	pstmt.executeUpdate();
	response.sendRedirect("2Insert.jsp");
	%>
</body>
</html>