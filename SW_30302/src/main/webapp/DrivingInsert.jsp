<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table td, input[type="text"] {
		text-align: left;
	}
</style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<section>
		<h2>주행내역등록</h2>
		<form action="DrivingInsert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<th>주행일자</th>
					<td><input type="text" name="DRV_DATE"> 2023년01월01일 예)20230101</td>
				</tr>
				<tr>
					<th>차량번호</th>
					<td><input type="text" name="CAR_NO"> 예)10가0001</td>
				</tr>
				<tr>
					<th>출발Km</th>
					<td><input type="text" name="DRV_START">Km</td>
				</tr>
				<tr>
					<th>도착Km</th>
					<td><input type="text" name="DRV_END">Km</td>
				</tr>
				<tr>
					<th>부서코드</th>
					<td>
						<select name="DEPT_CODE">
							<option value="-">부서</option>
							<option value="10">[10]영업부</option>
							<option value="20">[20]총무부</option>
							<option value="30">[30]구매부</option>
							<option value="40">[40]개발부</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>주유금액</th>
					<td><input type="text" name="DRV_MONEY">원</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" value="주행내역등록" onclick="yhs()">
						<input type="reset" value="다시쓰기" onclick="alert('정보를 지우고 처음부터 다시 입력합니다!')">
					</th>
				</tr>
			</table>
		</form>
	</section>
	
	<script type="text/javascript">
		function yhs() {
			var f = document.form;
			if(f.DRV_DATE.value == ""){
				alert('주행일자가 입력되지 않았습니다!');
				f.DRV_DATE.focus();
			}
			else if(f.CAR_NO.value == ""){
				alert('차량번호가 입력되지 않았습니다!');
				f.CAR_NO.focus();				
			}
			else if(f.DRV_START.value == ""){
				alert('출발Km가 입력되지 않았습니다!');
				f.DRV_START.focus();				
			}
			else if(f.DRV_END.value == ""){
				alert('도착Km가 입력되지 않았습니다!');
				f.DRV_END.focus();				
			}
			else if(f.DEPT_CODE.value == "-"){
				alert('부서코드가 선택되지 않았습니다!');
				f.DEPT_CODE.focus();				
			}
			else if(f.DRV_MONEY.value == ""){
				alert('주유금액이 입력되지 않았습니다!');
				f.DRV_MONEY.focus();				
			} else {
				alert('주행내역이 정상적으로 등록 되었습니다!');
				f.submit();
			}
		}
	</script>
</body>
</html>