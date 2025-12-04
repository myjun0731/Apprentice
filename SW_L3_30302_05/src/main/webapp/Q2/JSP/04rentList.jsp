<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* {
		margin: 0 auto;
		text-align: center;
	}
</style>
</head>
<body>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	ResultSet rs;
	String list = 
			
			"select " +
		    "r.rno, " +
		    "m.mname, " +
		    "m.phone, " +
		    "b.btitle, " +
		    "to_char(r.rentdate, 'yyyy-mm-dd'), " +
		    "to_char(r.duedate, 'yyyy-mm-dd') " +
		"from tbl_rent_24 r " +
		"join tbl_member_24 m on r.mno = m.mno " +
		"join tbl_book_24 b on r.bno = b.bno " +
		"where r.return_yn = 'N' " +
		"order by r.duedate asc, r.rno asc";
	
	rs = con.prepareStatement(list).executeQuery();
	%>

	<table border="1">
		<tr>
			<td>대여번호</td>
			<td>회원이름</td>
			<td>연락처</td>
			<td>도서제목</td>
			<td>대여일자</td>
			<td>반납예정일</td>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>