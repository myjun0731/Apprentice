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

	String sql = "insert into tbl_class_202201 (regist_month, c_no, class_area, tuition) values (?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("regist_month"));
	pstmt.setString(2, request.getParameter("c_no"));
	pstmt.setString(3, request.getParameter("class_area"));
	pstmt.setString(4, request.getParameter("tuition"));
	
	pstmt.executeUpdate();
	response.sendRedirect("3MemberSelect.jsp");
	%>
</body>
</html>