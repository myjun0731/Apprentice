package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DTO.PriceDTO;
import Util.DButil;

public class PriceDAO {
	
	public List<PriceDTO> PriceList() {
		List<PriceDTO> list = new ArrayList<>();

		try {
			Connection conn = DButil.getConnection();

			String sql = "select pr.pcode, pr.name, sum(cost*amount) as total "
					+ "from tbl_product_01 pr, tbl_salelist_01 sa " + "where pr.pcode = sa.pcode " + "group by pr.pcode, pr.name";

			
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			// 결과를 한줄씩 읽어서 오는 코드
			while (rs.next()) {
				PriceDTO dto = new PriceDTO();

				dto.setPcode(rs.getString("pcode"));
				dto.setName(rs.getString("name"));
				dto.setTotal(rs.getInt("total"));
				
				list.add(dto); // 리스트에 담기
			}

			// 자원 정리
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("ShopList 오류 : " + e.getMessage());
		}
		return list;
	}
}
