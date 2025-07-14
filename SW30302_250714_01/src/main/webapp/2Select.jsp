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
	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">개별 타자 성적 조회</h2>
	<section
		style="justify-content: center; display: flex; text-align: center;">
		<form action="2Select_search.jsp" name="form">
			<table border="1">
				<tr>
					<td>선수 등록 코드 입력</td>
					<td><input type="text" name="registration_code"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="선수조회"
						onclick="yhs(); return false;"> <input type="button"
						value="홈으로" onclick="location.href='4Index.jsp'"></td>
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