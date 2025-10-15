<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
h2 {
	text-align: center;
	padding: 20px;
}

section {
	display: flex;
	justify-content: center;
}

table th {
text-align: center;
}

</style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>오디션 등록</h2>
	<section>
		<form action="Insert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<th>참가번호</th>
					<td><input type="text" name="artist_id">*참가번호는
						(A001)4자리입니다</td>
				</tr>
				<tr>
					<th>참가자명</th>
					<td><input type="text" name="artist_name"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="artist_birth"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="artist_gender" value="M">남성
						<input type="radio" name="artist_gender" value="F">여성</td>
				</tr>
				<tr>
					<th>특기</th>
					<td><select name="talent">
							<option>특기선택</option>
							<option value="1">보컬</option>
							<option value="2">댄스</option>
							<option value="3">랩</option>
					</select></td>
				</tr>
				<tr>
					<th>소속사</th>
					<td><input type="text" name="agency"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" value="오디션 등록" onclick="yhs()">
						<input type="reset" value="다시쓰기" onclick="alert('정보를 지우고 다시 입력합니다!')">
					</th>
				</tr>
			</table>
		</form>
	</section>
<script type="text/javascript">
function yhs() {
	var f = document.form;
	
	if(f.artist_id.value.trim() == ""){
		alert("참가번호가 입력되지 않았습니다!");
		f.artist_id.focus();
	}
	else if(f.artist_name.value.trim() == ""){
		alert("참가자명이 입력되지 않았습니다!");
		f.artist_id.focus();
	}
	else if(f.artist_birth.value.trim() == ""){
		alert("생년월일이 입력되지 않았습니다!");
		f.artist_name.focus();
	}
	else if(f.artist_gender.value.trim() == ""){
		alert("성별이 입력되지 않았습니다!");
		f.artist_gender.focus();
	}
	else if(f.talent.value.trim() == ""){
		alert("특기가 입력되지 않았습니다!");
		f.talent.focus();
	}
	else if(f.agency.value.trim() == ""){
		alert("소속사가 입력되지 않았습니다!");
		f.agency.focus();
	} else {
		alert("참가신청이 정상적으로 등록 되었습니다!");
		f.submit();
	}
}
</script>
</body>
</html>