<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0 auto;
}

h2 {
	text-align: center;
	padding: 15px 0;
}
</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	ResultSet rs;
	String list =
			"select  " + "s.classid as 강의id, " + "s.classcnt as 회차, " + "s.classname as 강의명, " + "t.typename as 강좌명, "
			+ "to_char(to_date(s.classdate, 'yyyymmdd'), 'yyyy-mm-dd') as 강의일자, "
			+ "to_char(to_date(lpad(s.classtime, 4, '0'), 'hh24mi'), 'hh24:mi') as 강의시간, "
			+ "decode(s.classday, 1, '월요일',  " + "2, '화요일',  " + "3, '수요일',  " + "4, '목요일',  " + "5, '금요일',  "
			+ "6, '토요일',  " + "7, '일요일') as 강의요일 " + "from  " + "tbl_schedule_01 s "
			+ "right join tbl_class_type_01 t " + "on s.typecode = t.typecode " + "where s.classcnt = '1' "
			+ "order by " + "s.classid asc, s.classcnt asc";

	rs = con.prepareStatement(list).executeQuery();
	ResultSet rs2;
	String list2 = 
			"select " + 
		    "s.classid as 강의id, " +
		    "s.classcnt as 회차, " +
		    "s.classname as 강의명, " +
		    "t.typename as 강좌명, " +
		    "to_char(to_date(s.classdate, 'yyyymmdd'), 'yyyy-mm-dd') as 강의일자, " +
		    "to_char(to_date(lpad(s.classtime, 4, '0'), 'hh24mi'), 'hh24:mi') as 강의시간, " +
		    "decode(s.classday, 1, '월요일', 2, '화요일', 3, '수요일', 4, '목요일', 5, '금요일', 6, '토요일', 7, '일요일') as 강의요일 " +
		"from tbl_schedule_01 s, tbl_class_type_01 t " +
		"where s.typecode = t.typecode " +
		  "and s.classcnt = (select max(classcnt) from tbl_schedule_01) " +
		"order by s.classid asc, s.classcnt asc";

	rs2 = con.prepareStatement(list2).executeQuery();
	
	
	
	
	
	
	%>

	<h2>헬스센터 강의 스케줄 조회 시스템</h2>
	<table border="1" style="text-align: center;">
		<tr>
			<td>강의 ID</td>
			<td>회차</td>
			<td>강의명</td>
			<td>강좌명</td>
			<td>강의일자</td>
			<td>강의시간</td>
			<td>강의요일</td>
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
		</tr>
		<%
		}
		%>
	</table>


	<h2>[인기강좌]</h2>
	<table border="1" style="text-align: center;">
		<tr>
			<td>강의 ID</td>
			<td>회차</td>
			<td>강의명</td>
			<td>강좌명</td>
			<td>강의일자</td>
			<td>강의시간</td>
			<td>강의요일</td>
		</tr>
		<%
		while (rs2.next()) {
		%>
		<tr>
			<td><%=rs2.getString(1)%></td>
			<td><%=rs2.getString(2)%></td>
			<td><%=rs2.getString(3)%></td>
			<td><%=rs2.getString(4)%></td>
			<td><%=rs2.getString(5)%></td>
			<td><%=rs2.getString(6)%></td>
			<td><%=rs2.getString(7)%></td>
		</tr>
		<%
		}
		%>
	</table>
	
</body>
</html>