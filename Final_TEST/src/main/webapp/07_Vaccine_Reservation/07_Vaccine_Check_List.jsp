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
	PreparedStatement pstmt;
	ResultSet rs;
	String resvno = request.getParameter("resvno");
	String sql = "select ju.pname, ju.jumin, decode(substr(ju.jumin, 8,1), '1', '남', '2', '여'), tel, to_char(to_date(resvdate, 'YYYYMMDD'), 'YYYY\"년\"MM\"월\"DD\"일\"'), to_char(to_date(va.resvtime, 'HH24:MI'), 'HH24:MI'), ho.hospname, ho.hosptel, ju.address, decode(va.vcode, 'V001', 'A백신', 'V002','B백신','V003','C백신') "
			+ "from tbl_hosp_9 ho, tbl_vaccresv_9 va, tbl_jumin_9 ju "
			+ "where ju.jumin = va.jumin and va.hospcode = ho.hospcode and resvno = ?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, resvno);
	rs = pstmt.executeQuery();
	%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<%
	if (rs.next()) {
	%>
	<h2>예약번호: <%=resvno %> 의 접종예약조회</h2>
	<section class="section">
		<form action="2List_select.jsp" name="form">
			<table class="s_tbl" border="1">
				<tr>
					<td>이름</td>
					<td>주민번호</td>
					<td>성별</td>
					<td>전화번호</td>
					<td>예약일자</td>
					<td>예약시간</td>
					<td>병원명</td>
					<td>대표전화</td>
					<td>병원주소</td>
					<td>백신종류</td>
				</tr>
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
				</tr>
			</table>
		</form>
	</section>
	<%
	} else {
	%>
	<h1 style="text-align: center; padding-top: 50px;">접종예약정보가 존재하지 않습니다!!!</h1>
	<%
	}
	%>
	<div style="text-align: center; padding: 10px;">
		<input type="button" value="돌아가기" onclick="location.href='07_Vaccine_Check.jsp'">
	</div>
</body>
</html>