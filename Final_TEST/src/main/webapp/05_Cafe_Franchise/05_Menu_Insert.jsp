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

	String sql = "select max(menu_cd) + 1 from menu_tbl_9";
	rs = conn.prepareStatement(sql).executeQuery();

	rs.next();
%>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<section>
	<h2>메뉴 등록</h2>
		<form action="05_Menu_Insert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<td>메뉴코드</td>
					<td><input type="text" name="menu_cd" value="<%=rs.getString(1)%>" readonly></td>
				</tr>
				<tr>
					<td>메뉴명</td>
					<td><input type="text" name="menu_nm"></td>
				</tr>
				<tr>
					<td>메뉴가격</td>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td>메뉴구분</td>
					<td>
						<select name="menu_fg">
							<option value="-">선택</option>
							<option value="0">커피</option>
							<option value="1">티</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="등록" onclick="yhs()">
					<input type="button" value="조회" onclick="location.href='05_Menu_List.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<script type="text/javascript">
	function yhs() {
		var f = document.form;
		if (f.menu_nm.value == "") {
			alert("메뉴명 입력 필요.");
			f.menu_nm.focus();
			return false;
		} else if(f.price.value == ""){
			alert("메뉴가격 입력 필요.");
			f.price.focus();
			return false;
		} else if(f.menu_fg.value == ""){
			alert("메뉴구분 선택 필요.");
			f.menu_fg.focus();
			return false;
		} else {
			alert("정상적으로 등록 되었습니다");
			f.submit();
		}
	}
	</script>
</body>
</html>