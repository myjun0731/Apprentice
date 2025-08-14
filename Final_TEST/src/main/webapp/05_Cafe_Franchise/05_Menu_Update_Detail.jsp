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

	String sql = "update menu_tbl_9 set menu_nm = ?, price = ?, menu_fg = ? where menu_cd = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("menu_nm"));
	pstmt.setString(2, request.getParameter("price"));
	pstmt.setString(3, request.getParameter("menu_fg"));
	pstmt.setString(4, request.getParameter("menu_cd"));
	pstmt.executeUpdate();
	response.sendRedirect("05_Menu_List.jsp");
	%>
</body>
</html>