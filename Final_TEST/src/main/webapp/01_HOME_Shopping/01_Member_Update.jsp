<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input[type="text"] {
	text-align: left;
	justify-content: center;
}
</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	ResultSet rs;
	PreparedStatement pstmt;
	String sql = "select * from member_tbl_9 where custno = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("custno"));
	rs = pstmt.executeQuery();
	rs.next();
	%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<h2>회원 수정</h2>
	<form action="01_Member_Update_Detail.jsp" name="form">
		<table border="1">
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" readonly name="custno" value="<%=rs.getString(1)%>" readonly></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone" value="<%=rs.getString(3)%>"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="joindate" value="<%=rs.getString(5).substring(0,10)%>"></td>
			</tr>
			<tr>
				<th>고객등급[A,B,C]</th>
				<td><input type="text" name="grade" value="<%=rs.getString(6)%>"></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city" value="<%=rs.getString(7)%>"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="수정" onclick="yhs()">
				<input type="button" value="조회" onclick="location.href='01_Member_List.jsp'"></td>
			</tr>
		</table>
	</form>

	<script type="text/javascript">
		function yhs() {
			var f = document.form;
			if (f.custno.value == "") {
				alert("회원번호 입력 필요.");
				f.custno.focus();
			} else if (f.custname.value == "") {
				alert("회원번호 입력 필요.");
				f.custname.focus();
			} else if (f.phone.value == "") {
				alert("회원번호 입력 필요.");
				f.phone.focus();
			} else if (f.address.value == "") {
				alert("회원번호 입력 필요.");
				f.address.focus();
			} else if (f.joindate.value == "") {
				alert("회원번호 입력 필요.");
				f.joindate.focus();
			} else if (f.grade.value == "") {
				alert("회원번호 입력 필요.");
				f.grade.focus();
			} else if (f.city.value == "") {
				alert("회원번호 입력 필요.");
				f.city.focus();
			} else {
				alert("수정 완료");
				f.submit();
			}
		}
	</script>
</body>
</html>