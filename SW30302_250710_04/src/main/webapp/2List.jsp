<%@page import="java.text.DecimalFormat"%>
<%@page import="DTO.SalesDTO"%>
<%@page import="java.util.*"%>
<%@page import="DAO.SalesDAO"%>
<%@page import="Util.DButil"%>
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
	<%
	
	DecimalFormat de = new DecimalFormat("###,###");
	// 판매 현황 목록 저장 리스트 선언
	List<SalesDTO> salelist = new ArrayList<>();
	
	try{
	
	// 객체 생성
	SalesDAO dao = new SalesDAO();
	
	// DAO의...
	
	salelist = dao.getAllSalesList(); // 결과는 List<SalesDTO> 형태
	} catch(Exception e) {
		out.print("판매 목록 조회 중 오류 발생 : "+e.getMessage());
	}
	%>
	<jsp:include page="Header.jsp"></jsp:include>

	<h2 style="text-align: center; padding: 20px;">판매현황</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center;">
			<tr>
				<td>판매번호</td>
				<td>판매코드</td>
				<td>판매일</td>
				<td>매장코드</td>
				<td>수량</td>
				<td>총판매액</td>
			</tr>
			<%
			// 리스트에 담긴 판매현황 정보를 하나씩 꺼내어 테이블에 출력
			for(SalesDTO s : salelist){
				String allTotal = de.format(s.getTotal()); 
			%>
			<tr>
				<td><%=s.getSalesno()%></td>
				<td><%=s.getPcode()%></td>
				<td><%=s.getSaledate().substring(0,10)%></td>
				<td><%=s.getScode()%></td>
				<td><%=s.getP_name()%></td>
				<td><%=s.getAmount()%></td>
				<td><%=allTotal%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>