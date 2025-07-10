<%@page import="DTO.SalesDTO"%>
<%@page import="Util.DButil"%>
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
	Connection conn = DButil.getConnection();
	// Class.forName("oracle.jdbc.OracleDriver");
	// Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	PreparedStatement pstmt;

	// SalesDTO 클래스의 메서드를 사용하기 위한 객체 생성
	SalesDTO dto = new SalesDTO();
	
	// 메소드 호출을 통해 setter 변수 내 파라미터 값 저장
	dto.setSalesno(request.getParameter("saleno"));
	dto.setPcode(request.getParameter("pcode"));
	dto.setSaledate(request.getParameter("saledate"));
	dto.setScode(request.getParameter("scode"));
	dto.setAmount(request.getParameter("amount"));
	
	String sql = "insert into tbl_salelist_01 values(?,?,?,?,?)";

	pstmt = conn.prepareStatement(sql);
	
	
	// 메소드 호출을 통해 getter 로 값 호출
	pstmt.setString(1, dto.getSalesno());
	pstmt.setString(2, dto.getPcode());
	pstmt.setString(3, dto.getSaledate());
	pstmt.setString(4, dto.getScode());
	pstmt.setString(5, dto.getAmount());
	
/* 	pstmt.setString(1, request.getParameter("saleno"));
	pstmt.setString(2, request.getParameter("pcode"));
	pstmt.setString(3, request.getParameter("saledate"));
	pstmt.setString(4, request.getParameter("scode"));
	pstmt.setString(5, request.getParameter("amount")); */
	
	pstmt.executeUpdate();
	response.sendRedirect("1Insert.jsp");
	%>
</body>
</html>