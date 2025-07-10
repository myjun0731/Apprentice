<%@page import="DTO.PriceDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.PriceDAO"%>
<%@page import="java.text.DecimalFormat"%>
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
	List<PriceDTO> Pricelist = new ArrayList<>();
	try{
	
	// 객체 생성
	PriceDAO dao = new PriceDAO();
	
	// DAO의...
	
	Pricelist = dao.PriceList();
	} catch(Exception e) {
		out.print("오류 발생 : "+e.getMessage());
	}
	%>
	<jsp:include page="Header.jsp"></jsp:include>

	<h2 style="text-align: center; padding: 20px;">상품별판매액</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center;">
			<tr>
				<td>상품코드</td>
				<td>상품명</td>
				<td>상품별 판매액</td>
			</tr>
			<%
			// 리스트에 담긴 판매현황 정보를 하나씩 꺼내어 테이블에 출력
			for(PriceDTO s : Pricelist){
				String allTotal = de.format(s.getTotal()); 
			%>
			<tr>
				<td><%=s.getPcode()%></td>
				<td><%=s.getName()%></td>
				<td><%=allTotal%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>