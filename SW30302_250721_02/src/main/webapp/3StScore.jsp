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
	String sql = 
			"select " +
			"met.id, " +
			"met.name, " +
			"subStr(met.id, 0,1), " +
			"subStr(met.id, 3,2), " +
			"subStr(met.id, 4,2), " +
			"met.gender, " +
			"korean, " +
			"math, " +
			"english, " +
			"history, " +
			"sum(korean + math + english + history), " +
			"sum(korean + math + english + history)/4, " +
			"row_number() over(order by sum(korean + math + english + history)) " +
			"from member_tbl_01 met, score_tbl_01 sco " +
			"where met.id = sco.id " +
			"group by " +
			"met.id, " +
			"met.name, " +
			"met.gender, " +
			"korean, " +
			"math, " +
			"english, " +
			"history";	
	rs = conn.prepareStatement(sql).executeQuery();

	ResultSet rs2;
	String sql2 =
			
			"select " +
			"sum(korean), " +
			"sum(math), " +
			"sum(english), " +
			"sum(history), " +
			"to_char(sum(korean + math + english + history), '99999.9'), " +
			"avg(korean + math + english + history) " +
			"from score_tbl_01 sco";
			
	rs2 = conn.prepareStatement(sql2).executeQuery();
	%>
	
	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px 0;">학생 성적 조회</h2>
	<section>
		<table border="1">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>학년</td>
				<td>반</td>
				<td>번호</td>
				<td>성별</td>
				<td>국어</td>
				<td>수학</td>
				<td>영어</td>
				<td>역사</td>
				<td>합계</td>
				<td>평균</td>
				<td>순위</td>
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
			
			rs2.next();
			%>
			<tr>
				<td colspan="6"></td>
				<td>국어 총합</td>
				<td>수학 총합</td>
				<td>영어 총합</td>
				<td>역사 총합</td>
				<td>총합</td>
				<td>총평균</td>
				<td>-------</td>
			</tr>
			<tr>
				<td colspan="6"></td>
				<td><%=rs2.getString(1)%></td>
				<td><%=rs2.getString(2)%></td>
				<td><%=rs2.getString(3)%></td>
				<td><%=rs2.getString(4)%></td>
				<td><%=rs2.getString(5)%></td>
				<td><%=rs2.getString(6)%></td>
				<td>-------</td>
			</tr>
		</table>
	</section>
</body>
</html>