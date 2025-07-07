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
	String sql = "select me.custno, me.custname, me.phone, me.address, to_char(me.joindate, 'YYYY-MM-DD'), decode(grade, 'A','VIP','B','일반','C','직원'), me.city from member_tbl_02 me";
	rs = conn.prepareStatement(sql).executeQuery();
	rs.next();
	%>
	
	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">쇼핑몰 회원관리 프로그램</h2>
	<section style="justify-content: left; display: flex; padding-left: 12px;">
		쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다. <br>
		프로그램 작성 순서 <br>
		1. 회원정보 테이블을 생성한다. <br>
		2. 매출정보 테이블을 생성한다. <br>
		3. 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다. <br>
		4. 회원정보 조회 프로그램을 작성한다. <br>
		5. 회원매출정보 조회 프로그램을 작성한다.
	</section>
</body>
</html>