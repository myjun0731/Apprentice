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

h2 {
	padding: 20px;
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
		    "a.ID as 학번, " +
		    "a.NAME as 이름, " +
		    "substr(a.ID, 1, 1) as 학년, " +
		    "substr(a.ID, 2, 2) as 반, " +
		    "substr(a.ID, 4, 2) as 번호, " +
		    "a.GENDER as 성별, " +
		    "b.KOREAN as 국어, " +
		    "b.MATH as 수학, " +
		    "b.ENGLISH as 영어, " +
		    "b.HISTORY as 역사, " +
		    "(b.KOREAN + b.ENGLISH + b.MATH + b.HISTORY) as 합계, " +
		    "(b.KOREAN + b.ENGLISH + b.MATH + b.HISTORY) / 4 as 평균, " +
		    "rank() over (order by (b.KOREAN + b.ENGLISH + b.MATH + b.HISTORY) desc) as 순위 " +
		"from MEMBER_TBL a " +
		"join SCORE_TBL b " +
		  "on a.ID = b.ID " +
		"order by 순위 asc";
	
	rs = con.prepareStatement(list).executeQuery();

	ResultSet rs2;
	String list2 =

			"select " + "sum(korean) as 국어종합, " + "sum(math) as 수학종합, " + "sum(english) as 영어종합, "
			+ "sum(history) as 역사종합, " + "sum(korean + math + english + history) as 종합, "
			+ "round(avg(korean + math + english + history), 1) as 총평균 " + "from score_tbl";

	rs2 = con.prepareStatement(list2).executeQuery();
	%>


<h2>학생 조회</h2>
	<table border="1">
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>
			<th>성별</th>
			<th>국어</th>
			<th>수학</th>
			<th>영어</th>
			<th>역사</th>
			<th>합계</th>
			<th>평균</th>
			<th>순위</th>
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
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>
			<td><%=rs.getString(10)%></td>
			<td><%=rs.getString(11)%></td>
			<td><%=rs.getString(12)%></td>
			<td><%=rs.getString(13)%></td>
		</tr>
		<%
		}
		%>

		<tr>
			<td colspan="6"></td>
			<td>국어총합</td>
			<td>수학총합</td>
			<td>영어총합</td>
			<td>역사총합</td>
			<td>총합</td>
			<td>총평균</td>
			<td> ------ </td>
		</tr>
		<%
			while (rs2.next()) {
			%>
		<tr>
			<td colspan="6"></td>
			<td><%=rs2.getString(1)%></td>
			<td><%=rs2.getString(2)%></td>
			<td><%=rs2.getString(3)%></td>
			<td><%=rs2.getString(4)%></td>
			<td><%=rs2.getString(5)%></td>
			<td><%=rs2.getString(6)%></td>
			<td> ------ </td>
		</tr>
		<%
			}
			%>
	</table>
</body>
</html>