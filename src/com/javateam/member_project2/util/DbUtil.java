package com.javateam.member_project2.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbUtil {

	private static final String driver="oracle.jdbc.OracleDriver";
	private static final String url ="jdbc:oracle:thin:@localhost:1521:xe";
	private static final String id="jsp";
	private static final String pw="jsp";
	
	
	
	/**
	 * DB 연결
	 * @return DB
	 * 
	 * */
	
	public static Connection connect() {
		
		Connection con=null;
		
		try {
			Class.forName(driver); // jdbc driver 검색 / 등록 
			con=DriverManager.getConnection(url, id, pw);
			// 연결 객체 (Connection) 생성 
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
			
		}
		
		return con;	
	}
	
	
	/**
	 * 
	 * DB 연결 해제 
	 * @param con DB 연결 객체 
	 *  @param pstmt SQL 처리 객체 
	 *  @param rs SQL 결과셋 객체 
	 * */
	

	
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		
		// 닫는 것은 역순으로 하는 것이 좋습니다아
		
		//if(rs.isClosed()==false) rs.close();

			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close(); // 생성이 되어있는 상태니까 닫아주기 
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
	}
	
	
}
