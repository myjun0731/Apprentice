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
			"select " +
		    "'[인기장르]' as 구분 " +
		    ",g.type_name as 장르명 " +
		    ",s.movie_id " +
		    ",s.show_no " +
		    ",s.title " +
		    ",to_char(to_date(s.show_date, 'yyyymmdd'), 'yyyy-mm-dd') as 상영일자 " +
		    ",substr(s.show_time, 1, 2) || ':' || substr(s.show_time, 3, 2) as 상영시간 " +
		    ",decode(s.show_day, 1, '월요일', 2, '화요일', 3, '수요일', 4, '목요일', 5, '금요일', 6, '토요일', 7, '일요일') as 상영요일 " +
		"from " +
		    "tbl_showtime_02 s " +
		    ",tbl_genre_02 g " +
		"where " +
		    "s.type_code = g.type_code " +
		    "and s.movie_id = 'M002' " +
		    "and s.show_no = 1 " +
		"union all " +
		"select " +
		    "null as 구분 " +
		    ",g.type_name as 장르명 " +
		    ",s.movie_id " +
		    ",s.show_no " +
		    ",s.title " +
		    ",to_char(to_date(s.show_date, 'yyyymmdd'), 'yyyy-mm-dd') as 상영일자 " +
		    ",substr(s.show_time, 1, 2) || ':' || substr(s.show_time, 3, 2) as 상영시간 " +
		    ",decode(s.show_day, 1, '월요일', 2, '화요일', 3, '수요일', 4, '목요일', 5, '금요일', 6, '토요일', 7, '일요일') as 상영요일 " +
		"from " +
		    "tbl_showtime_02 s, tbl_genre_02 g " +
		"where " +
		    "s.type_code = g.type_code " +
		"order by " +
		    "구분 desc nulls last " +
		    ",상영일자 " +
		    ",상영시간";
	
	rs = con.prepareStatement(list).executeQuery();
	%>

	<h2>영화 상영 일정 조회 </h2>
	<table border="1" style="text-align: center;">
		<tr>
			<td>구분</td>
			<td>장르명</td>
			<td>영화ID</td>
			<td>회차번호</td>
			<td>영화제목</td>
			<td>상영일자</td>
			<td>상영시간</td>
			<td>상영요일</td>
		</tr>
		<%
		while (rs.next()) {
			String Str = rs.getString(1)!=null?rs.getString(1):"";
		%>
		<tr>
			<td><%=Str%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>