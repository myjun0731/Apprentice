package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.SalesDTO;
import Util.DButil;

public class SalesDAO {

	/*
	 * DAO로 만들어야 하는 것들 1. InsertDetail 2. 판매현황 3. 매장별 판매액 4. 상품별 판매액
	 * 
	 * Q.DAO 쓰는 이유 : A. 지금까지 JSP에서 일회성 코드로만 쓰였는데 DAO를 쓴다면 DB 처리를맡아줄 "전담 클래스 역할"로
	 * 분리하는 구조
	 */

	// InsertDetail
	public int InsertSales(SalesDTO dto) {
		// TODO Auto-generated method stub
		int Result = 0;
		try {
			// DB 연결 코드
			Connection conn = DButil.getConnection();

			String sql = "insert into tbl_salelist_01 values(?,?,?,?,?)";

			// SQL 실행 준비
			PreparedStatement pstmt = conn.prepareStatement(sql);

			// DTO 객체에서 get(변수)를 불러와 데이터를 꺼내서 SQL문 '?'에 넣기
			pstmt.setString(1, dto.getSalesno());
			pstmt.setString(2, dto.getPcode());
			pstmt.setString(3, dto.getSaledate());
			pstmt.setString(4, dto.getScode());
			pstmt.setString(5, dto.getAmount());

			// 성공 시 Result 값이 0에서 1로 됨.
			Result = pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			// 오류 발생 시, 콘솔에 메시지 출력
			System.out.println("InsertSales 오류 : " + e.getMessage());
		}
		return Result;
	}

	public List<SalesDTO> getAllSalesList() {
		List<SalesDTO> list = new ArrayList<>();

		try {
			Connection conn = DButil.getConnection();

			String sql = "select ts.saleno, ts.pcode, ts.saledate, ts.scode, tp.name, ts.amount, sum(tp.cost * ts.amount) as total "
					+ "from tbl_salelist_01 ts, tbl_product_01 tp " + "where ts.pcode = tp.pcode "
					+ "group by ts.saleno, ts.pcode, ts.saledate, ts.scode, tp.name, ts.amount " + "order by ts.saleno";

			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			// 결과를 한줄씩 읽어서 오는 코드
			while (rs.next()) {
				SalesDTO dto = new SalesDTO();

				dto.setSalesno(rs.getString("saleno"));
				dto.setPcode(rs.getString("pcode"));
				dto.setSaledate(rs.getString("saledate"));
				dto.setScode(rs.getString("scode"));
				dto.setAmount(rs.getString("amount"));
				dto.setP_name(rs.getString("name"));
				dto.setTotal(rs.getInt("total"));

				list.add(dto); // 리스트에 담기
			}

			// 자원 정리
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("getAllSalesList 오류 : " + e.getMessage());
		}
		return list;
	}
}