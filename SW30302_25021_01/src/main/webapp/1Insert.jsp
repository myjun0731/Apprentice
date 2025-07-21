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
	String sql = "select max(custno)+1 from member_tbl_03";
	rs = conn.prepareStatement(sql).executeQuery();
	rs.next();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px 0;">홈쇼핑 회원 등록</h2>
	<section>
		<form action="1Insert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<td>회원번호(지동발생)</td>
					<td><input type="text" name="custno"
						value="<%=rs.getString(1)%>"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" onclick="yhs(); return false;">
						<input type="button" value="조회" onclick="location.href='2MemberList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.form;

			if (f.custname.value == "") {
				alert("회원성명을 입력해주세요.");
				f.custname.focus();
				return false;
			} else if (f.phone.value == "") {
				alert("회원전화를 입력해주세요.");
				f.phone.focus();
				return false;
			} else if (f.address.value == "") {
				alert("회원주소를 입력해주세요.");
				f.address.focus();
				return false;
			} else if (f.joindate.value == "") {
				alert("가입일자를 입력해주세요.");
				f.joindate.focus();
				return false;
			} else if (f.grade.value == "") {
				alert("고객등급을 입력해주세요.");
				f.grade.focus();
				return false;
			} else if (f.city.value == "") {
				alert("도시코드를 입력해주세요.");
				f.city.focus();
				return false;
			} else {
				alert("등록이 정상적으로 완료하였습니다.");
				f.submit();
				return true;
			}
		}
	</script>
</body>
</html>