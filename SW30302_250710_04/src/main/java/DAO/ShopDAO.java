package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DTO.SalesDTO;
import DTO.ShopDTO;
import Util.DButil;

public class ShopDAO {
	
	public List<ShopDTO> ShopList() {
		List<ShopDTO> list = new ArrayList<>();

		try {
			Connection conn = DButil.getConnection();

			String sql = 
					"select sh.scode, sh.sname, sum(pr.cost*sa.amount) as total " +
					"from tbl_shop_01 sh, tbl_salelist_01 sa, tbl_product_01 pr " +
					"where pr.pcode = sa.pcode and sh.scode = sa.scode " +
					"group by sh.scode, sh.sname " +
					"order by sh.scode";
			
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			// 결과를 한줄씩 읽어서 오는 코드
			while (rs.next()) {
				ShopDTO dto = new ShopDTO();

				dto.setSalesno(rs.getString("scode"));
				dto.setSname(rs.getString("sname"));
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
