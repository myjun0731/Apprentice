<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section table th td {
	text-align: center;
}
</style>
</head>
<body>

	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	ResultSet rs;

	String sql = "select " + "st.studentid, " + "st.studentname, "
			+ "decode(subStr(st.jumin, 8,1), '3','남','2','여', '4','여'), " + "sub.subjectname, "
			+ "decode(sub.classification, '01','전공필수', '02','전공선택','03','교양필수','04','교양선택'), " + "sub.professorname, "
			+ "gr.mid, " + "gr.final, " + "gr.attend, " + "gr.report, " + "gr.etc, "
			+ "to_char(gr.mid*0.3 + gr.final*0.3 + gr.attend*0.2 + gr.report*0.1 + gr.etc*0.1, '9999.9'), "
			+ "to_char(gr.mid*0.3 + gr.final*0.3 + gr.attend*0.2 + gr.report*0.1 + gr.etc*0.1,'999') " + "from "
			+ "tbl_grade_202205 gr, " + "tbl_subject_202205 sub, " + "tbl_student_202205 st "
			+ "where gr.studentid = st.studentid and gr.subjectcode = sub.subjectcode "
			+ "order by sub.subjectname ,st.studentid";

	rs = conn.prepareStatement(sql).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2>전체 성적 조회</h2>
	<section style="text-align: center;">
		<table border="1">
			<tr>
				<td>학번</td>
				<td>성명</td>
				<td>성별</td>
				<td>과목명</td>
				<td>전공구분</td>
				<td>담당교수</td>
				<td>중간</td>
				<td>기말</td>
				<td>출석</td>
				<td>레포드</td>
				<td>기타</td>
				<td>점수</td>
				<td>등급</td>
			</tr>

			<%
			while (rs.next()) {
				int Scroe = rs.getInt(13);
				String Grade = "";
				switch (Scroe / 10) {
				case 10:
				case 9:
					Grade = "A";
					break;
				case 8:
					Grade = "B";
					break;
				case 7:
					Grade = "C";
					break;
				case 6:
					Grade = "D";
					break;
				default:
					Grade = "F";
					break;
				}
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(10)%></td>
				<td><%=rs.getString(11)%></td>
				<td><%=rs.getString(12)%></td>
				<td><%=Grade%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>