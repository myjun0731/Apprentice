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
			"sa.sale_ymd, " +
			"sa.sale_no, " +
			"st.store_nm, " +
			"me.menu_nm, " +
			"si.size_nm, " +
			"sa.sale_cnt, " +
			"to_char(me.price*sa.sale_cnt,'999,999,999') || '원', " +
			"decode(sa.pay_type, '02', '카드', '01', '현금') " +
			"from  " +
			"menu_tbl_9 me, sale_tbl_9 sa, store_tbl_9 st, size_tbl_9 si " +
			"where sa.menu_cd = me.menu_cd and si.size_cd = sa.size_cd and sa.store_cd = st.store_cd " +
			"order by sa.sale_no";
			
	rs = conn.prepareStatement(sql).executeQuery();

	%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<section>
	<h2>매출 현황</h2>
		<table border="1">
			<tr>
				<td>판매일자</td>
				<td>판매번호</td>
				<td>점포명</td>
				<td>판매메뉴</td>
				<td>사이즈</td>
				<td>판매수량</td>
				<td>판매금액</td>
				<td>수취구분</td>
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
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>