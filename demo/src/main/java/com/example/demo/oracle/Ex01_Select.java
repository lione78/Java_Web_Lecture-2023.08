package com.example.demo.oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 * 파라메터가 없는 SQL을 사용하여, Madang/customer 테이블 조회
 */
public class Ex01_Select {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",  // 모든 DB와 코드 동일하나 localhost가 달라짐.
					"hmuser", "hmpass");
			stmt = conn.createStatement();
			String sql = "select * from customer";
			
			// sql 실행
			ResultSet rs = stmt.executeQuery(sql);		// select시
			while (rs.next()) {			// 리턴값이 남아있는 동안 줄단위로 들어옴.
				int custid = rs.getInt(1);		// oracle index 1부터
				String name = rs.getString(2);
				String addr = rs.getString(3);
				String phone = rs.getString(4);
				System.out.printf("%d, %s, %s, %s%n", custid, name, addr, phone);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
