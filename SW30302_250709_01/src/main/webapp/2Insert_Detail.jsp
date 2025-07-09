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

	String sql = "insert into tbl_result_202004 values(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("p_no"));
	pstmt.setString(2, request.getParameter("t_code"));
	pstmt.setString(3, request.getParameter("sdate"));
	pstmt.setString(4, request.getParameter("t_status"));
	pstmt.setString(5, request.getParameter("ldate"));
	pstmt.setString(6, request.getParameter("t_result"));
	pstmt.executeUpdate();
	response.sendRedirect("2Insert.jsp");
	%>
</body>
</html>