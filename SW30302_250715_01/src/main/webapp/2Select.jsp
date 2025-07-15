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
	ResultSet rs2;
	String sql = "select p.registration_code, p.name " +
			"from tbl_hitter_info h, tbl_player_info p " +
			"where p.registration_code = h.registration_code";

	String sql2 =
			"select " +
			"p.birth_day, " +
			"subStr(p.birth_day, 1, 4) || '년' || " +
			"subStr(p.birth_day, 5, 2) || '월' || " +
			"subStr(p.birth_day, 7, 2) || '일' " +
			"from tbl_player_info p";
	rs = conn.prepareStatement(sql).executeQuery();
	rs2 = conn.prepareStatement(sql2).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">개별 타자 성적 조회</h2>
	<section
		style="justify-content: center; display: flex; text-align: center;">
		<form action="2Select_search.jsp" name="form">
			<table border="1">

				<tr>
					<td>조건 선택</td>
					<td>조건값선택</td>
				</tr>

				<tr>
					<td><select name="DBcolumn" onchange="toggleInput()">
							<option value="registration_code">선수등록코드</option>
							<option value="name">선수명</option>
							<option value="birth_day">생년월일</option>
					</select></td>
					<td><input type="text" name="registration_code"> <select
						name="name" disabled>
							<option value="*">선수명 선택</option>
							<%
							while(rs.next()){
							%>
							<option value="<%=rs.getString("registration_code")%>"><%=rs.getString("registration_code")%>
								-
								<%=rs.getString("name")%></option>
							<%
							}
							%>
					</select> <select name="birth_day" disabled>
							<option value="*">생년월일 선택</option>
							<%
							while(rs2.next()){
							%>
							<option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
							<%
							}
							%>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="선수조회"
						onclick="yhs();"> <input type="button" value="홈으로"
						onclick="location.href='4Index.jsp'"></td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function toggleInput() {
			var selectBox = document.getElementsByName("DBcolumn")[0];
			var registrationCodeInput = document
					.getElementsByName("registration_code")[0];
			var nameSelect = document.getElementsByName("name")[0];
			var birthDaySelect = document.getElementsByName("birth_day")[0];

			registrationCodeInput.disabled = true;
			registrationCodeInput.value = "";
			nameSelect.disabled = true;
			nameSelect.value = "*";
			birthDaySelect.disabled = true;
			birthDaySelect.value = "*";

			if (selectBox.value == "registration_code") {
				registrationCodeInput.disabled = false;
			} else if (selectBox.value == "name") {
				nameSelect.disabled = false;
			} else if (selectBox.value == "birth_day") {
				birthDaySelect.disabled = false;
			}
		}

		function yhs() {
			var f = document.form;
			var selectBox = document.getElementsByName("DBcolumn")[0];

			if (selectBox.value == "registration_code") {
				if (f.registration_code.value == "") {
					alert("선수 등록 코드를 입력하세요.");
					f.registration_code.focus();
					return false;
				}
			} else if (selectBox.value == "name") {
				if (f.name.value == "*") {
					alert("선수명을 선택하세요.");
					f.name.focus();
					return false;
				}
			} else if (selectBox.value == "birth_day") {
				if (f.birth_day.value == "*") {
					alert("생년월일을 선택하세요.");
					f.birth_day.focus();
					return false;
				}
			}

			f.submit();
		}
	</script>
</body>
</html>