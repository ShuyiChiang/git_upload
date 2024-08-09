package com.cathaybk.practice.nt50334.b;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class Database {

	public static final String QUERY_CARS_SQL = "select * from STUDENT.CARS where MANUFACTURER = ? and TYPE = ?";

	public static final String INSERT_CARS_SQL = "insert into STUDENT.CARS (MANUFACTURER, TYPE, MIN_PRICE, PRICE) values (?, ?, ?, ?)";

	public static final String UPDATE_CARS_SQL = "update STUDENT.CARS set MIN_PRICE = ?,PRICE = ? where MANUFACTURER = ? and TYPE = ?";

	public static final String DELETE_CARS_SQL = "delete from STUDENT.CARS where MANUFACTURER = ? and TYPE = ?";

	public static final String CONN_URL = "jdbc:oracle:thin:@//localhost:1521/XE";

	public static void main(String[] args) throws SQLException {
		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");
				PreparedStatement pstmt = conn.prepareStatement("select * from STUDENT.CARS");) {

			// ResultSet物件儲存查詢結果
			ResultSet rs = pstmt.executeQuery();

			// 使用StringBuilder做字串串接
			StringBuilder sb = new StringBuilder();

			// 取得CARS table內所有資料存成List<Map> 並一一印出。
			List<Map<String, String>> carList = new ArrayList<>();

			while (rs.next()) {

				Map<String, String> carMap = new HashMap<>();
				carMap.put("MANUFACTURER", rs.getString("MANUFACTURER"));
				carMap.put("TYPE", rs.getString("TYPE"));
				carMap.put("MIN_PRICE", rs.getString("MIN_PRICE"));
				carMap.put("PRICE", rs.getString("PRICE"));
				carList.add(carMap);

			}

			for (Map<String, String> map : carList) {
				BigDecimal minPrice = new BigDecimal(map.get("MIN_PRICE"));
				BigDecimal Price = new BigDecimal(map.get("PRICE"));

				sb.append("製造商： ").append(map.get("MANUFACTURER")).append("，型號：").append(map.get("TYPE")).append("，售價：")
						.append(Price.toPlainString()).append("，底價：").append(minPrice.toPlainString());

				System.out.println(sb.toString());
				sb.setLength(0);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		Scanner scanner = new Scanner(System.in);
		String method;

		while (true) { // 無限迴圈，直到輸入正確指令為止
			System.out.print("請選擇以下指令輸入:select、insert、update、delete：");
			method = scanner.next();

			if (method.equals("select") || method.equals("insert") || method.equals("update")
					|| method.equals("delete")) {
				break; // 如果輸入的是正確指令，跳出迴圈
			} else {
				System.out.println("錯誤請重新輸入。");
			}
		}

		switch (method) {
		case "select":
			System.out.print("請輸入製造商:");
			String selectManufacturer = scanner.next();

			System.out.print("請輸入類型:");
			String selectType = scanner.next();
			doQuery(selectManufacturer, selectType);
			break;
		case "insert":
			System.out.print("請輸入製造商:");
			String insertManufacturer = scanner.next();

			System.out.print("請輸入類型:");
			String insertType = scanner.next();

			System.out.print("請輸入底價:");
			BigDecimal insertMinPrice = scanner.nextBigDecimal();

			System.out.print("請輸入售價:");
			BigDecimal insertPrice = scanner.nextBigDecimal();
			doInsert(insertManufacturer, insertType, insertMinPrice, insertPrice);
			break;

		case "update":
			System.out.print("請輸入製造商:");
			String updateManufacturer = scanner.next();

			System.out.print("請輸入類型:");
			String updateType = scanner.next();

			System.out.print("請輸入底價:");
			BigDecimal updateMinPrice = scanner.nextBigDecimal();

			System.out.print("請輸入售價:");
			BigDecimal updatePrice = scanner.nextBigDecimal();
			doUpdate(updateManufacturer, updateType, updateMinPrice, updatePrice);
			break;

		case "delete":
			System.out.print("請輸入製造商:");
			String deleteManufacturer = scanner.next();

			System.out.print("請輸入類型:");
			String deleteType = scanner.next();
			doDelete(deleteManufacturer, deleteType);
			break;

		}

		// 關閉scanner
		if (scanner != null) {
			scanner.close();//
		}
	}

	public static void doQuery(String manufacturer, String type) throws SQLException {
		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {

			PreparedStatement pstmt = conn.prepareStatement(QUERY_CARS_SQL);
			pstmt.setString(1, manufacturer);
			pstmt.setString(2, type);

			// ResultSet物件儲存查詢結果
			ResultSet rs = pstmt.executeQuery();

			// 使用StringBuilder做字串串接
			StringBuilder sb = new StringBuilder();
			while (rs.next()) {
				sb.append("製造商： ").append(rs.getString("MANUFACTURER")).append("，型號：").append(rs.getString("TYPE"))
						.append("，售價：").append(rs.getString("PRICE")).append("，底價：").append(rs.getString("MIN_PRICE"));
			}
			System.out.println(sb.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void doInsert(String manufacturer, String type, BigDecimal minPrice, BigDecimal price) {
		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
			try {
				conn.setAutoCommit(false);
				PreparedStatement pstmt = conn.prepareStatement(INSERT_CARS_SQL);
				pstmt.setString(1, manufacturer);
				pstmt.setString(2, type);
				pstmt.setBigDecimal(3, minPrice);
				pstmt.setBigDecimal(4, price);
				pstmt.executeUpdate();

				conn.commit();
				System.out.println("新增成功");
			} catch (Exception e) {
				System.out.println("新增失敗，原因：" + e.getMessage());
				try {
					conn.rollback();
				} catch (SQLException sqle) {
					System.out.println("rollback 失敗，原因：" + sqle.getMessage());
				}
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}

	public static void doUpdate(String manufacturer, String type, BigDecimal minPrice, BigDecimal price) {
		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
			try {
				conn.setAutoCommit(false);
				PreparedStatement pstmt = conn.prepareStatement(UPDATE_CARS_SQL);
				;
				pstmt.setBigDecimal(1, minPrice);
				pstmt.setBigDecimal(2, price);
				pstmt.setString(3, manufacturer);
				pstmt.setString(4, type);
				pstmt.executeUpdate();

				conn.commit();
				System.out.println("修改成功");
			} catch (Exception e) {
				System.out.println("修改失敗，原因：" + e.getMessage());
				try {
					conn.rollback();
				} catch (SQLException sqle) {
					System.out.println("rollback 失敗，原因：" + sqle.getMessage());
				}
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}

	public static void doDelete(String manufacturer, String type) {
		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
			try {
				conn.setAutoCommit(false);
				PreparedStatement pstmt = conn.prepareStatement(DELETE_CARS_SQL);
				;
				pstmt.setString(1, manufacturer);
				pstmt.setString(2, type);
				pstmt.executeUpdate();

				conn.commit();
				System.out.println("刪除成功");
			} catch (Exception e) {
				System.out.println("刪除失敗，原因：" + e.getMessage());
				try {
					conn.rollback();
				} catch (SQLException sqle) {
					System.out.println("rollback 失敗，原因：" + sqle.getMessage());
				}
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}

}
