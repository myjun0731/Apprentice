<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table input[type="text"] {
	text-align: left;
	justify-content: center;
}
</style>
</head>
<body>
	<jsp:include page="/00_Index/00_Index.jsp" />
	<h2 style="text-align: center; padding: 20px;">검사결과입력</h2>
	<section>
		<form action="04_Result_Insert_Detail.jsp" name="form">
			<table border="1" style="margin: 0 auto; border-collapse: collapse;">
				<tr>
					<td>환자코드</td>
					<td><input type="text" name="p_no" size="20" /> 예)1001</td>
				</tr>
				<tr>
					<td>검사명</td>
					<td><select name="t_code">
							<option value="-">검사명</option>
							<option value="T001">결핵</option>
							<option value="T002">장티푸스</option>
							<option value="T003">수두</option>
							<option value="T004">홍역</option>
							<option value="T005">콜레라</option>
					</select></td>
				</tr>	
				<tr>
					<td>검사시작일</td>
					<td><input type="text" name="sdate" size="20" />
						예)20200101</td>
				</tr>
				<tr>
					<td>검사상태</td>
					<td><input type="radio" name="t_status" value="1" /> 검사 중
						<input type="radio" name="t_status" value="2" /> 검사 완료</td>
				</tr>
				<tr>
					<td>검사완료일</td>
					<td><input type="text" name="ldate" size="20" />
						예)20200101</td>
				</tr>
				<tr>
					<td>검사결과</td>
					<td><input type="radio" name="t_result" value="X" /> 미입력
						<input type="radio" name="t_result" value="p" /> 양성
						<input type="radio" name="t_result" value="N" /> 음성</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: center;">
						<input type="submit" value="등록" onclick="yhs(); return false;" />
						<input type="reset" value="재입력" onclick="alert('모든 데이터를 삭제하고 처음부터 다시 입력합니다!')"/>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.form;
			if (f.p_no.value == "") {
				alert("환자코드 입력 필요.");
				f.p_no.focus();
				return false;
			}
			else if (f.t_code.value == "-") {
				alert("검사명 선택 필요.");
				f.t_code.focus();
				return false;
			}
			else if (f.sdate.value == "") {
				alert("검사시작일 입력 필요.");
				f.sdate.focus();
				return false;
			}
			else if (f.t_status.value == "") {
				alert("검사상태 입력 필요.");
				f.t_status.focus();
				return false;
			}
			else if (f.ldate.value == "") {
				alert("검사완료일 입력 필요.");
				f.ldate.focus();
				return false;
			}
			else if (f.t_result.value == "") {
				alert("검사결과 입력 필요.");
				f.t_result.focus();
				return false;
			} else {
				alert("정상적으로 등록되었습니다!");
				f.submit();
			}
		}
	</script>
</body>
</html>