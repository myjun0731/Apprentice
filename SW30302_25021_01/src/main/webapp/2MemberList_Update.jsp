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
	String sql = "update member_tbl_03 set custname = ?, phone = ?, address = ? , joindate = ? , grade = ?, city = ? where custno = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("custname"));
	pstmt.setString(2, request.getParameter("phone"));
	pstmt.setString(3, request.getParameter("address"));
	pstmt.setString(4, request.getParameter("joindate").substring(0,10));
	pstmt.setString(5, request.getParameter("grade"));
	pstmt.setString(6, request.getParameter("city"));
	pstmt.setString(7, request.getParameter("custno"));
	pstmt.executeUpdate();
	response.sendRedirect("2MemberList.jsp");
	
	%>
</body>
</html>