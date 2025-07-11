/*
 * 이 클래스는 '서블릿'이라고 불리는 특별한 자바 클래스.
 * 이 클래스는 웹에서 누군가가 요청을 보냈을 때, 그 요청을 받아서 처리해주는 역할.
 * 아래 코드는 '/...'이라는 주소로 요청이 들어오면 서블릿이 처리해주는 과정
 * 
 * http://localhost:8080/SW30302_250710_01/sales?action=list
*/
package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.SalesDAO;
import DTO.SalesDTO;

//@WebServlet("/sales")는 주소창에 '/sale'이라고 쓰면 이 클래스가 실행 된다는 의미!
@WebServlet("/sales")
public class SalesController extends HttpServlet {
	// doGet() 메소드는 주소창에 정보를 붙여서 요청 할 때 실행 됨.
	// 예 : /sales?action=list처럼 주소에 물음표로 정보가 붙는 방식
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		// 만약에 list=action라면, 판매목록을 보여달라는 요청.
		if ("list".equals(action)) {
			try {
				// 판매목록 가져올 준비
				SalesDAO dao = new SalesDAO();
				// 판매목록 불러와서 리스트에 저장
				List<SalesDTO> list = dao.getAllSalesList();

				// 가져온 판매 목록을 request라는 박스에 넣어 JSP페이지로 넘겨줄거임.
				request.setAttribute("salesList", list);

				// 이 데이터를 들고 2List.jsp라는 화면으로 이동
				request.getRequestDispatcher("2List.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().println("<script>alert('목록 조회 오류 발생'); history.back();</script>");
			}
		}
		if ("Plist".equals(action)) {
			try {
				// 판매목록 가져올 준비
				SalesDAO dao = new SalesDAO();
				// 판매목록 불러와서 리스트에 저장
				List<SalesDTO> list = dao.getAllSalesList();

				// 가져온 판매 목록을 request라는 박스에 넣어 JSP페이지로 넘겨줄거임.
				request.setAttribute("PriceList", list);

				// 이 데이터를 들고 4Price_List.jsp라는 화면으로 이동
				request.getRequestDispatcher("4Price_List.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().println("<script>alert('목록 조회 오류 발생'); history.back();</script>");
			}
		}
		
		if ("Slist".equals(action)) {
			try {
				// 판매목록 가져올 준비
				SalesDAO dao = new SalesDAO();
				// 판매목록 불러와서 리스트에 저장
				List<SalesDTO> list = dao.getAllSalesList();

				// 가져온 판매 목록을 request라는 박스에 넣어 JSP페이지로 넘겨줄거임.
				request.setAttribute("ShopList", list);

				// 이 데이터를 들고 3Shop_List.jsp라는 화면으로 이동
				request.getRequestDispatcher("3Shop_List.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().println("<script>alert('목록 조회 오류 발생'); history.back();</script>");
			}
		}
	}

	// dopost()는 정보를 숨겨서 보내는 방식
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자가 어떤 행동을 하고 싶은지(action값)을 가져옴
		String action = request.getParameter("action");

		if ("insert".equals(action)) {
			SalesDTO dto = new SalesDTO();
			// 메소드 호출을 통해 setter 변수 내 파라미터 값 저장
			dto.setSalesno(request.getParameter("saleno"));
			dto.setPcode(request.getParameter("pcode"));
			dto.setSaledate(request.getParameter("saledate"));
			dto.setScode(request.getParameter("scode"));
			dto.setAmount(request.getParameter("amount"));

			SalesDAO dao = new SalesDAO(); // 성공 시 1, 실패 시 0

			int result = dao.InsertSales(dto);

			if (result == 1) {
				response.sendRedirect("2List.jsp");
			} else {
				response.getWriter().println("<script>alert('판매 등록 오류 발생'); history.back();</script>");
			}
		}
	}
}