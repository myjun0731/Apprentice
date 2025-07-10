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
	<h2 style="text-align: center; padding: 20px;">판매등록</h2>
	<section style="justify-content: center; display: flex;">
		<form action="1Insert_detail.jsp" name="form">
			<table border="1" style="text-align: center;">
				<tr>
					<td>판매번호</td>
					<td><input type="text" name="saleno"></td>
				</tr>
				<tr>
					<td>상품코드</td>
					<td><input type="text" name="pcode"></td>
				</tr>
				<tr>
					<td>판매날짜</td>
					<td><input type="text" name="saledate"></td>
				</tr>
				<tr>
					<td>매장코드</td>
					<td><input type="text" name="scode"></td>
				</tr>
				<tr>
					<td>판매수량</td>
					<td><input type="text" name="amount"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록" onclick="yhs(); return false;"> <input
						type="reset" value="다시쓰기"></td>
				</tr>
			</table>
		</form>
	</section>
	
		<script type="text/javascript">
		function yhs() {
			var f = document.forms["form"];

			if (f["saleno"].value === "") {
				alert("판매번호가 입력되지 않았습니다.");
				f["saleno"].focus();
				return false;
			} else if (f["pcode"].value === "") {
				alert("상품코드가 입력되지 않았습니다.");
				f["pcode"].focus();
				return false;
			} else if (f["saledate"].value === "") {
				alert("판매날짜가 입력되지 않았습니다.");
				f["saledate"].focus();
				return false;
			} else if (f["scode"].value === "") {
				alert("매장코드가 입력되지 않았습니다.");
				f["scode"].focus();
				return false;
			} else if (f["amount"].value === "") {
				alert("수량이 입력되지 않았습니다.");
				f["amount"].focus();
				return false;
			} else {
				alert("등록이 되었습니다.");
				f.submit();
			}
			return true;
		}
	</script>
</body>
</html>