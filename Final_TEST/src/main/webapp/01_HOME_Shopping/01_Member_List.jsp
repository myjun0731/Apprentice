<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList</title>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	ResultSet rs;
	String sql = "select me.custno, me.custname, me.phone, me.address, to_char(me.joindate, 'YYYY-MM-DD'), decode(grade, 'A','VIP','B','일반','C','직원'), me.city from member_tbl_9 me";
	rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<section>
		<h2>회원목록 조회 / 수정</h2>
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><a href="01_Member_Update.jsp?custno=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>