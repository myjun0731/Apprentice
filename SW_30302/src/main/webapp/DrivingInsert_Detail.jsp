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

	String sql = "insert into TBL_DRIVE values (?,?,?,?,?,?)";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("DRV_DATE"));
	pstmt.setString(2, request.getParameter("CAR_NO"));
	pstmt.setString(3, request.getParameter("DRV_START"));
	pstmt.setString(4, request.getParameter("DRV_END"));
	pstmt.setString(5, request.getParameter("DEPT_CODE"));
	pstmt.setString(6, request.getParameter("DRV_MONEY"));
	pstmt.executeUpdate();
	response.sendRedirect("Index.jsp");
	%>
</body>
</html>