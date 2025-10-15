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
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		
		ResultSet rs;
		PreparedStatement pstmt;
		String artist_id = request.getParameter("artist_id");
		String artist_name = request.getParameter("artist_name");
		String artist_birth = request.getParameter("artist_birth");
		String artist_gender = request.getParameter("artist_gender");
		String talent = request.getParameter("talent");
		String agency = request.getParameter("agency");
		
		String InsertSql = "insert into tbl_artist_201905 values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(InsertSql);
		pstmt.setString(1, artist_id);
		pstmt.setString(2, artist_name);
		pstmt.setString(3, artist_birth);
		pstmt.setString(4, artist_gender);
		pstmt.setString(5, talent);
		pstmt.setString(6, agency);
		pstmt.executeUpdate();
		response.sendRedirect("List.jsp");
	%>
</body>
</html>