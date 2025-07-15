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
	<h2 style="text-align: center; padding: 20px;">타자 성적 등록</h2>
	<section
		style="justify-content: center; display: flex; text-align: center;">
		<form action="1Insert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<td>타자선택</td>
					<td><input type="checkbox" name="registration_code"
						value="A001" onclick="OnlyOne(this)">[A001]김길동<br> <input
						type="checkbox" name="registration_code" value="A005"
						onclick="OnlyOne(this)">[A005]이길동<br> <input
						type="checkbox" name="registration_code" value="B002"
						onclick="OnlyOne(this)">[B002]홍길동<br> <input
						type="checkbox" name="registration_code" value="B006"
						onclick="OnlyOne(this)">[B006]조길동<br></td>
				</tr>
				<tr>
					<td colspan="2">공격 포인트</td>
				</tr>
				<tr>
					<td>게임 수</td>
					<td><input type="text" name="game_numbers">게임</td>
				</tr>
				<tr>
					<td>타석 수</td>
					<td><input type="text" name="appearance">타수</td>
				</tr>
				<tr>
					<td>안타 수</td>
					<td><input type="text" name="hit_numbers">안타</td>
				</tr>
				<tr>
					<td>홈런 수</td>
					<td><input type="text" name="home_runs">홈런</td>
				</tr>

				<tr>
					<td colspan="2">수비 포인트</td>
				</tr>
				<tr>
					<td>아웃카운트 수</td>
					<td><input type="text" name="put_out"> 회</td>
				</tr>
				<tr>
					<td>더블플레이 수</td>
					<td><input type="text" name="double_play"> 회</td>
				</tr>
				<tr>
					<td>에러</td>
					<td><input type="text" name="error_count"> 회</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="등록"
						onclick="yhs(); return false;"> <input type="reset"
						value="다시쓰기"></td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.form;
			var num = 0;

			if (f.game_numbers.value == "") {
				alert("선수 등록 코드를 선택하세요.(1개만)");
				f.registration_code.focus();
				return false;
			} else if (f.game_numbers.value == "") {
				alert("게임 수를 입력하세요.");
				f.game_numbers.focus();
				return false;
			} else if (f.appearance.value == "") {
				alert("타석 수를 입력하세요.");
				f.appearance.focus();
				return false;
			} else if (f.hit_numbers.value == "") {
				alert("안타 수를 입력하세요.");
				f.hit_numbers.focus();
				return false;
			} else if (f.home_runs.value == "") {
				alert("홈런 수를 입력하세요.");
				f.home_runs.focus();
				return false;
			} else if (f.put_out.value == "") {
				alert("아웃 카운트 수를 입력하세요.");
				f.put_out.focus();
				return false;
			} else if (f.double_play.value == "") {
				alert("더블 플레이 수를 입력하세요.");
				f.double_play.focus();
				return false;
			} else if (f.error_count.value == "") {
				alert("에러를 입력하세요.");
				f.error_count.focus();
				return false;
			} else {
				alert("등록이 정상적으로 되었습니다!");
				f.submit();
				return true;
			}
		}

		function OnlyOne(a) {
			var obj = document.getElementsByName("registration_code");

			for (var i = 0; i < obj.length; i++) {
				if (obj[i] != a) {
					obj[i].checked = false;
				}
			}
		}
	</script>
</body>
</html>