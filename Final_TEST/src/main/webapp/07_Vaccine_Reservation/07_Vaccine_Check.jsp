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
	<h2>접종예약조회</h2>
	<section>
		<form action="07_Vaccine_Check_List.jsp" name="form">
			<table border="1">
				<tr>
					<td>접종예약번호 입력</td>
					<td><input type="text" name="resvno"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="예약조회" onclick="yhs()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.form;
			if (f.resvno.value == "") {
				alert("예약번호 입력 필요!");
				f.resvno.focus();
				return false;
			} else {
				f.submit();
			}
		}
	</script>
</body>
</html>