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
	<jsp:include page="/00_Index/00_Index.jsp" />
	<h2>개별 타자 성적 조회</h2>
	<section>
		<form action="13_Batter_Grade_Check_List.jsp" name="form">
			<table border="1">
				<tr>
					<td>선수 등록 코드 입력</td>
					<td><input type="text" name="registration_code"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="선수조회" onclick="yhs(); return false;">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.form;

			if (f.registration_code.value == "") {
				alert("선수 등록 코드를 입력하세요.");
				f.registration_code.focus();
				return false;
			} else {
				f.submit();
			}

		}
	</script>
</body>
</html>