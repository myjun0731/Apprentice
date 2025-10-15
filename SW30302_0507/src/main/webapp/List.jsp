<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2 {
	text-align: center;
	padding: 20px;
}

section {
	display: flex;
	justify-content: center;
}

table {
text-align: center;
}

</style>
</head>
<body>
	<%
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		
		ResultSet rs;
		String SelectSql = "select artist_id, " +
				"artist_name, " +
				"subStr(artist_birth, 0,4),subStr(artist_birth, 5,2),subStr(artist_birth, 7,2), " +
				"decode(artist_gender, 'M', '남', 'F','여'), " +
				"decode(talent, '1','보컬', '2','댄스', '3','랩'), " +
				"agency " +
				"from tbl_artist_201905";
		rs = conn.prepareCall(SelectSql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>참가자목록조회</h2>
	<section>
		<table border="1">
			<tr>
			 	<th>참가번호</th>
			 	<th>참가자명</th>
			 	<th>생년월일</th>
			 	<th>성별</th>
			 	<th>특기</th>
			 	<th>소속사</th>
			</tr>
			
			<%
			while(rs.next()){
			%>
				<tr>
					<td><%=rs.getString(1) %> </td>
					<td><%=rs.getString(2) %> </td>
					<td><%=rs.getString(3)%>년<%= rs.getString(4) %>월<%= rs.getString(5)%>일</td>
					<td><%=rs.getString(6) %> </td>
					<td><%=rs.getString(7) %> </td>
					<td><%=rs.getString(8) %> </td>
				</tr>	
			<%		
			}
			%>
		</table>
	</section>
</body>
</html>