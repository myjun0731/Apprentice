<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>onchange 테스트</title>
    <script>
        function changeCode(selectObj) {
            var selectedName = selectObj.value;

            if (selectedName === "홍길동") {
                document.getElementsByName("c_no")[0].value = "000";
            } else if (selectedName === "이순신") {
                document.getElementsByName("c_no")[0].value = "001";
            } else {
                document.getElementsByName("c_no")[0].value = "";
            }
        }
    </script>
</head>
<body>

    <h3>회원 선택</h3>
    <select name="c_name" onchange="changeCode(this)">
        <option value="">-- 선택 --</option>
        <option value="홍길동">홍길동</option>
        <option value="이순신">이순신</option>
    </select>

    <br><br>
    회원번호: <input type="text" name="c_no">

</body>
</html>
