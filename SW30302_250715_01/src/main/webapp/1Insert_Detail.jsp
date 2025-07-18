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
	String registration_code = request.getParameter("registration_code");
	String game_numbers = request.getParameter("game_numbers");
	String appearance = request.getParameter("appearance");
	String hit_numbers = request.getParameter("hit_numbers");
	String home_runs = request.getParameter("home_runs");
	String put_out = request.getParameter("put_out");
	String double_play = request.getParameter("double_play");
	String error_count = request.getParameter("error_count");
	
	System.out.println(registration_code);
	System.out.println(game_numbers);
	System.out.println(appearance);
	System.out.println(hit_numbers);
	System.out.println(home_runs);
	System.out.println(put_out);
	System.out.println(double_play);
	System.out.println(error_count);
	
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	ResultSet rs;
	PreparedStatement pstmt;
	String sql = "insert into tbl_hitter_info values (?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("registration_code"));
	pstmt.setString(2, request.getParameter("game_numbers"));
	pstmt.setString(3, request.getParameter("appearance"));
	pstmt.setString(4, request.getParameter("hit_numbers"));
	pstmt.setString(5, request.getParameter("home_runs"));
	pstmt.setString(6, request.getParameter("put_out"));
	pstmt.setString(7, request.getParameter("double_play"));
	pstmt.setString(8, request.getParameter("error_count"));

	pstmt.executeUpdate();

	response.sendRedirect("2Select.jsp");
	%>
</body>
</html>