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
	<h2 style="text-align: center; padding: 20px;">검사결과입력</h2>
	<section style="justify-content: center; display: flex;">
		<form action="2Insert_Detail.jsp">
			<table border="1" style="margin: 0 auto; border-collapse: collapse;">
				<tr>
					<td style="width: 120px; text-align: right;">환자 코드</td>
					<td><input type="text" name="p_no" size="20" /> 예)1001</td>
				</tr>
				<tr>
					<td style="text-align: right;">검사명</td>
					<td><select name="t_code">
							<option>검사명</option>
							<option value="T001">결핵</option>
							<option value="T002">장티푸스</option>
							<option value="T003">수두</option>
							<option value="T004">홍역</option>
							<option value="T005">콜레라</option>
					</select></td>
				</tr>	
				<tr>
					<td style="text-align: right;">검사시작일</td>
					<td><input type="text" name="sdate" size="20" />
						예)20200101</td>
				</tr>
				<tr>
					<td style="text-align: right;">검사상태</td>
					<td><label><input type="radio" name="t_status" value="1" /> 검사 중</label>
							<label><input type="radio" name="t_status" value="2" /> 검사 완료</label></td>
				</tr>
				<tr>
					<td style="text-align: right;">검사완료일</td>
					<td><input type="text" name="ldate" size="20" />
						예)20200101</td>
				</tr>
				<tr>
					<td style="text-align: right;">검사결과</td>
					<td><label><input type="radio" name="t_result" value="X" /> 미입력</label>
						<label><input type="radio" name="t_result" value="p" /> 양성</label>
						<label><input type="radio" name="t_result" value="N" /> 음성</label></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: center;"><input
						type="submit" value="등록" /> <input type="reset" value="재입력" /></td>
				</tr>
			</table>

		</form>
	</section>

</body>
</html>