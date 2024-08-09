package com.cathaybk.javaedu.lesson3.practice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class AdvancedInsertTranscation {



	public static final String INSERT_CARS_SQL = "insert into STUDENT.CARS (MANUFACTURER, TYPE, MIN_PRICE, PRICE) values (?, ?, ?, ?)";

	public static final String CONN_URL = "jdbc:oracle:thin:@//localhost:1521/XE";

	public static void main(String[] args) {
	    

		doInsert();
		//doQuery();
	}

	public static void doInsert() {
		Integer branchCode = 12345; // 示例行編
	    String manufacturer = "CATHAYBK" + branchCode;
	    String type1 =Integer.toString(branchCode + 1);
	    String type2 = Integer.toString(branchCode + 2);
	    
	    
	    
		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
			try {
				Random rand = new Random();
				Integer price1=rand.nextInt(1000) + 1;
				Integer price2=rand.nextInt(1000) + 1;
				conn.setAutoCommit(false);//關掉自動Commit
				PreparedStatement pstmt = conn.prepareStatement(INSERT_CARS_SQL);
				// 新增第一筆資料
				pstmt.setString(1, manufacturer);
				pstmt.setString(2, type1);
				pstmt.setInt(3, price1>price2 ? price2 : price1);//底價
				pstmt.setInt(4, price1>price2 ? price1 : price2);//售價
				pstmt.executeUpdate();//執行更新動作

				Integer price3=rand.nextInt(1000) + 1;
				Integer price4=rand.nextInt(1000) + 1;
				// 新增第二筆資料
				pstmt.setString(1, manufacturer);
				pstmt.setString(2, type2);
				pstmt.setInt(3, price3>price4 ? price4 : price3);
				pstmt.setInt(4, price3>price4 ? price3 : price4);
				pstmt.executeUpdate();//執行更新動作

				conn.commit();//手動Commit
				System.out.println("新增成功");
				doQuery(conn, branchCode);
			} catch (Exception e) {
				System.out.println("新增失敗，原因：" + e.getMessage());
				try {
					conn.rollback();//發生例外 回到原始狀態
				} catch (SQLException sqle) {
//                    sqle.printStackTrace();
					System.out.println("rollback 失敗，原因：" + sqle.getMessage());
				}
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}

	}

//	public static void doQuery() {
//		
//		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
//
//			PreparedStatement pstmt = conn.prepareStatement("select * from STUDENT.CARS where MANUFACTURER = ? ");
//			pstmt.setString(1, "CATHAYBK12345");
//
//			// ResultSet物件儲存查詢結果
//			ResultSet rs = pstmt.executeQuery();
//
//			// 使用StringBuilder做字串串接
//			StringBuilder sb = new StringBuilder();
//			
//			while (rs.next()) {
//				sb.append("製造商： ").append(rs.getString("MANUFACTURER")).append("，型號：").append(rs.getString("TYPE"))
//						.append("，售價：").append(rs.getString("PRICE")).append("，底價：").append(rs.getString("MIN_PRICE"));
//				System.out.println(sb.toString());
//				sb.setLength(0);
//			}
//			
//			rs.close();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	private static void doQuery(Connection conn, Integer empId) {
		ResultSet rs = null;
		try (PreparedStatement pstmt = conn.prepareStatement("select * from STUDENT.CARS where MANUFACTURER = ? ");) {
			pstmt.setString(1, "CATHAYBK"+ empId);

			rs = pstmt.executeQuery(); // ResultSet 物件儲存查詢結果

			StringBuilder sb = new StringBuilder(); // 使用 StringBuilder 做字串串接
			while (rs.next()) {
				sb.append("製造商： ").append(rs.getString("MANUFACTURER")).append("，型號：").append(rs.getString("TYPE"))
						.append("，售價：").append(rs.getString("PRICE")).append("，底價：").append(rs.getString("MIN_PRICE"));
				System.out.println(sb.toString());
				sb.setLength(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
