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

	String sql = "select menu_cd, menu_nm, to_char(price, '999,999') || '원', decode(menu_fg, '0', '커피', '1', '티') from menu_tbl_9";
	rs = conn.prepareStatement(sql).executeQuery();

	%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<h2 style="text-align: center; padding: 20px;">메뉴 등록/수정</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center;">
			<tr>
				<td>메뉴코드</td>
				<td>메뉴명</td>
				<td>메뉴가격</td>
				<td>메뉴구분</td>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td> <a href="05_Menu_Update.jsp?menu_cd=<%=rs.getString(1)%>"><%=rs.getString(1)%></a> </td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td colspan="4">
					<input type="button" value="등록" onclick="location.href='05_Menu_Insert.jsp'">
				</td>
			</tr>
		</table>
	</section>
</body>
</html>