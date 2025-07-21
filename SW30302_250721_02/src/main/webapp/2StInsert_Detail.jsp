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
	PreparedStatement pstmt;
	String sql = "insert into score_tbl_01 values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("korean"));
	pstmt.setString(3, request.getParameter("math"));
	pstmt.setString(4, request.getParameter("english"));
	pstmt.setString(5, request.getParameter("history"));
	pstmt.executeUpdate();
	response.sendRedirect("2StInsert.jsp");
	%>
</body>
</html>