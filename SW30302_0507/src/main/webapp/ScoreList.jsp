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
		String SelectSql = 
				"select po.serial_no, " +
				"ar.artist_id, " +
				"ar.artist_name, " +
				"subStr(ar.artist_birth, 0,4),subStr(ar.artist_birth, 5,2),subStr(ar.artist_birth, 7,2), " +
				"po.point, " +
				"me.mento_name " +
				"from tbl_artist_201905 ar, tbl_point_201905 po, tbl_mento_201905 me " +
				"where ar.artist_id = po.artist_id and me.mento_id = po.mento_id order by po.serial_no";
		rs = conn.prepareCall(SelectSql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>멘토점수조회</h2>
	<section>
		<table border="1">
			<tr>
			 	<th>채점번호</th>
			 	<th>참가번호</th>
			 	<th>참가자명</th>
			 	<th>생년월일</th>
			 	<th>점수</th>
			 	<th>평점</th>
			 	<th>멘토</th>
			</tr>
			
			<%
			while(rs.next()){
				int Score = rs.getInt(7);
				String Grade ="";
				switch(Score/10){
				case 9:
					Grade = "A";
					break;
				case 8:
					Grade = "B";
					break;
				case 7:
					Grade = "C";
					break;
				case 6:
					Grade = "D";
					break;
				default:
					Grade = "F";
					
				
				}
			%>
				<tr>
					<td><%=rs.getString(1) %> </td>
					<td><%=rs.getString(2) %> </td>
					<td><%=rs.getString(3) %> </td>
					<td><%=rs.getString(4) %>년<%=rs.getString(5) %>월<%=rs.getString(6) %>일</td>
					<td><%=rs.getString(7) %> </td>
					<td><%=Grade%> </td>
					<td><%=rs.getString(8) %> </td>
				</tr>	
			<%		
			}
			%>
		</table>
	</section>
</body>
</html>