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

<style>
section table th {
	text-align: center;
}
</style>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>개인성적등록</h2>
	<section style="">
		<form action="2Insert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<th>학번</th>
					<td><input type="text" name="studentid" class="Input"></td>
				</tr>
				<tr>
					<th>과목코드</th>
					<td><input type="text" name="subjectcode" class="Input">예)S001</td>
				</tr>
				<tr>
					<th>중간(30%)(0-100)</th>
					<td><input type="text" name="mid" class="Input">점</td>
				</tr>
				<tr>
					<th>기말(30%)(0-100)</th>
					<td><input type="text" name="final1" class="Input">점</td>
				</tr>
				<tr>
					<th>출석(20%)(1-100)</th>
					<td><input type="text" name="attend" class="Input">점</td>
				</tr>
				<tr>
					<th>레포트(10%)(1-100)</th>
					<td><input type="text" name="report" class="Input">점</td>
				</tr>
				<tr>
					<th>기타(10%)(1-100)</th>
					<td><input type="text" name="etc" class="Input">점</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" value="등록" onclick="yhs();">
						<input type="reset" value="다시쓰기" onclick="alert('정보를 지우고 처음부터 다시 입력합니다!')">
					</th>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.form;
			if (f.studentid.value.trim() == "") {
				alert("학번을 입력해주세요");
				f.studentid.focus();
			} else if (f.subjectcode.value.trim() == "") {
				alert("과목코드를 입력해주세요.");
				f.subjectcode.focus();
			} else if (f.mid.value.trim() == "") {
				alert("중간점수를 입력해주세요.");
				f.mid.focus();
			} else if (f.final1.value.trim() == "") {
				alert("기말점수를 입력해주세요.");
				f.final1.focus();
			} else if (f.attend.value.trim() == "") {
				alert("출석점수를 입력해주세요.");
				f.attend.focus();
			} else if (f.report.value.trim() == "") {
				alert("레포트 점수를 입력해주세요.");
				f.report.focus();
			} else if (f.etc.value.trim() == "") {
				alert("기타를 입력해주세요.");
				f.etc.focus();
			} else {
				alert("등록 완료");
				f.submit();
			}
		}
	</script>
</body>
</html>