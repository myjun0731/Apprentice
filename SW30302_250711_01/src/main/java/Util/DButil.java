package Util;

import java.sql.*;

public class DButil {
	// DButil 클래스는 오라큰 DB에 연결하는 기능을 담당하는 클래스.
	// 정적 메소드 getConn을 통해 어디서든 DB 연결을 얻을 수 있음.
	// getConn 메소드를 이용하여 DB에 접속, 객체를 반환.
	// 성공 시 커넥션 객체 반환 / 실패시 null 반환

	public static Connection getConnection() {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@//localhost:1521/xe";
			String user = "system";
			String password = "1234";

			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			// 클래스 이름이 틀렸거나 JDBC드라이버를 못찾을 때
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			// 주소, 포트, DB 상태 등 여러 원인이 있을 수 있음.
			e.printStackTrace();
		}
		return conn;
		// 성공 시 커넥션 객체 반환 / 실패시 null 반환
	}
}