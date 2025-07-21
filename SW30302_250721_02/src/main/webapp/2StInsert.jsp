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
	<h2 style="text-align: center; padding: 20px 0;">학생 성적 등록</h2>
	<section>
		<form action="2StInsert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>국어</td>
					<td><input type="text" name="korean"></td>
				</tr>
				<tr>
					<td>수학</td>
					<td><input type="text" name="math"></td>
				</tr>
				<tr>
					<td>영어</td>
					<td><input type="text" name="english"></td>
				</tr>
				<tr>
					<td>역사</td>
					<td><input type="text" name="history"></td>
				</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="등록" onclick="yhs();">
						</td>
					</tr>
			</table>
		</form>
	</section>
	
	<script type="text/javascript">
		function yhs() {
			var f = document.form;
			
			if(f.id.value ==""){
				alert('학번을 입력해주세요.');
				f.id.focus();
			}
			else if(f.korean.value ==""){				
				alert('국어를 입력해주세요.');
				f.korean.focus();
			}
			else if(f.math.value ==""){				
				alert('수학을 입력해주세요.');
				f.math.focus();
			}
			else if(f.english.value ==""){				
				alert('영어를 입력해주세요.');
				f.english.focus();
			}
			else if(f.history.value ==""){				
				alert('역사를 입력해주세요.');
				f.history.focus();
			} else {
				alert('등록이 정상적으로 완료되었습니다.');
				f.submit();
				
			}
		}
	</script>
</body>
</html>