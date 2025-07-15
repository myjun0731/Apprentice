<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th {
	text-align: center;
}
</style>
</head>
<body>

	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	ResultSet rs;
	String sql =
			"select " +
			"c.regist_month, " +
			"m.c_name, " +
			"m.phone, " +
			"c.class_area, " +
			"t.class_name, " +
			"t.class_price " +
			"from " +
			"tbl_member_202201 m, tbl_class_202201 c, tbl_teacher_202201 t " +
			"where m.c_no = c.c_no and t.teacher_code = c.teacher_code";
	
	rs = conn.prepareStatement(sql).executeQuery();
%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">수강신청</h2>
	<section style="justify-content: center; display: flex;">
		<form action="2Insert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<td>수강월</td>
					<td><input type="text" name="regist_month"> 202203</td>
				</tr>
				<tr>
					<td>회원명</td>
					<td><select name="c_name" onchange="changeCode(this)">
							<option value="">선택</option>
							<option value="홍길동">홍길동</option>
							<option value="장발장">장발장</option>
							<option value="임꺽정">임꺽정</option>
							<option value="성춘향">성춘향</option>
							<option value="이몽룡">이몽룡</option>
					</select></td>
				</tr>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="c_no">예)10001</td>
				</tr>
				<tr>
					<td>강의장소</td>
					<td><select name="class_area">
							<option value="">선택</option>
							<option value="서울본원">서울본원</option>
							<option value="성남본원">성남본원</option>
							<option value="대전본원">대전본원</option>
							<option value="부산본원">부산본원</option>
							<option value="대구본원">대구본원</option>
					</select></td>
				</tr>
				<tr>
					<td>강의명</td>
					<td><select name="class_name" onchange="changePrice(this)">
							<option value="">선택</option>
							<option value="초급반">초급반</option>
							<option value="중급반">중급반</option>
							<option value="고급반">고급반</option>
							<option value="심화반">심화반</option>
					</select></td>
				</tr>
				<tr>
					<td>수강료</td>
					<td><input type="text" name="tuition" value="0">원</td>
				</tr>
				<tr>
					<th colspan="2"><input type="button" value="수강신청"
						onclick="yhs(); return false;"> <input type="reset"
						value="다시쓰기"></th>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.form;

			if (f.regist_month.value == "") {
				alert("수강월을 입력하세요.");
				f.regist_month.focus();
				return false;
			} else if (f.c_name.value == "") {
				alert("회원명을 입력하세요.");
				f.c_name.focus();
				return false;
			} else if (f.c_no.value == "") {
				alert("회원번호를 입력하세요.");
				f.c_no.focus();
				return false;
			} else if (f.class_area.value == "") {
				alert("강의장소 입력하세요.");
				f.class_area.focus();
				return false;
			} else if (f.class_name.value == "") {
				alert("강의명을 입력하세요.");
				f.class_name.focus();
				return false;
			} else if (f.tuition.value == "") {
				alert("수강료를 입력하세요.");
				f.tuition.focus();
				return false;
			} else {
				alert("수강신청 완료!");
				f.submit();
				return true;
			}
		}

		function changeCode(selectObj) {
			var selectedName = selectObj.value;

			if (selectedName === "홍길동") {
				document.getElementsByName("c_no")[0].value = "10001";
			} else if (selectedName === "장발장") {
				document.getElementsByName("c_no")[0].value = "10002";
			} else if (selectedName === "임꺽정") {
				document.getElementsByName("c_no")[0].value = "10003";
			} else if (selectedName === "성춘향") {
				document.getElementsByName("c_no")[0].value = "20001";
			} else if (selectedName === "이몽룡") {
				document.getElementsByName("c_no")[0].value = "20002";
			}
		}

		function changePrice(obj) {
			var selectedName = obj.value;
			var tuition = document.getElementsByName("tuition")[0].value;
			var c_no = document.getElementsByName("c_no")[0].value;

			if (20000 <= c_no) {
				if (selectedName === "초급반") {
					document.getElementsByName("tuition")[0].value = 50000;
				} else if (selectedName === "중급반") {
					document.getElementsByName("tuition")[0].value = 100000;
				} else if (selectedName === "고급반") {
					document.getElementsByName("tuition")[0].value = 150000;
				} else if (selectedName === "심화반") {
					document.getElementsByName("tuition")[0].value = 200000;
				}
			} else {
				if (selectedName === "초급반") {
					document.getElementsByName("tuition")[0].value = 100000;
				} else if (selectedName === "중급반") {
					document.getElementsByName("tuition")[0].value = 200000;
				} else if (selectedName === "고급반") {
					document.getElementsByName("tuition")[0].value = 300000;
				} else if (selectedName === "심화반") {
					document.getElementsByName("tuition")[0].value = 400000;
				}
			}
		}
	</script>
</body>
</html>