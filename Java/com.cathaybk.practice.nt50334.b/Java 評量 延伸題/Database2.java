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

public class Database2 {

	public static final String QUERY_CARS_SQL = "select MANUFACTURER, TYPE, MIN_PRICE, PRICE from STUDENT.CARS where MANUFACTURER = ? and TYPE = ?";

	public static final String INSERT_CARS_SQL = "insert into STUDENT.CARS (MANUFACTURER, TYPE, MIN_PRICE, PRICE) values (?, ?, ?, ?)";

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
				BigDecimal price = new BigDecimal(map.get("PRICE"));

				sb.append("製造商： ").append(map.get("MANUFACTURER")).append("，型號：").append(map.get("TYPE")).append("，售價：")
						.append(price.toPlainString()).append("，底價：").append(minPrice.toPlainString());

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
			String selectManufacturer = getInput("請輸入製造商:", scanner);
			String selectType = getInput("請輸入類型:", scanner);
			doQuery(selectManufacturer, selectType);
			scanner.close();
			return;

		case "insert":
			String insertManufacturer = getInput("請輸入製造商:", scanner);
			String insertType = getInput("請輸入類型:", scanner);
			BigDecimal insertMinPrice = getBigDecimalInput("請輸入底價:", scanner);
			BigDecimal insertPrice = getBigDecimalInput("請輸入售價:", scanner);
			doInsert(insertManufacturer, insertType, insertMinPrice, insertPrice);
			scanner.close();
			return;

		case "update":
			BigDecimal updateMinPrice = null;
			BigDecimal updatePrice = null;

			String updateManufacturer = getInput("請輸入製造商:", scanner);
			String updateType = getInput("請輸入類型:", scanner);
			System.out.print("是否更新底價? (yes/no): ");
			if (scanner.next().equalsIgnoreCase("yes")) {
				updateMinPrice = getBigDecimalInput("請輸入底價:", scanner);
			}
			System.out.print("是否更新售價? (yes/no): ");
			if (scanner.next().equalsIgnoreCase("yes")) {
				updatePrice = getBigDecimalInput("請輸入售價:", scanner);
			}

			doUpdate(updateManufacturer, updateType, updateMinPrice, updatePrice);
			scanner.close();
			return;

		case "delete":
			String deleteManufacturer = getInput("請輸入製造商:", scanner);
			String deleteType = getInput("請輸入類型:", scanner);
			doDelete(deleteManufacturer, deleteType);
			scanner.close();
			return;

		default:
			scanner.close(); // 關閉scanner
			break;
		}

	}

	private static String getInput(String prompt, Scanner scanner) {
		System.out.print(prompt);
		return scanner.next();
	}

	private static BigDecimal getBigDecimalInput(String prompt, Scanner scanner) {
		System.out.print(prompt);
		return scanner.nextBigDecimal();
	}

	public static void doQuery(String manufacturer, String type) throws SQLException {
		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
			try (PreparedStatement pstmt = conn.prepareStatement(QUERY_CARS_SQL);) {

				pstmt.setString(1, manufacturer);
				pstmt.setString(2, type);

				// ResultSet物件儲存查詢結果
				ResultSet rs = pstmt.executeQuery();

				// 使用StringBuilder做字串串接
				StringBuilder sb = new StringBuilder();

				// 檢查是否有資料
				// 如果沒有此資料就報錯
				if (rs.next()) {
					sb.append("製造商： ").append(rs.getString("MANUFACTURER")).append("，類型：").append(rs.getString("TYPE"))
							.append("，售價：").append(rs.getString("PRICE")).append("，底價：")
							.append(rs.getString("MIN_PRICE"));
				} else {
					throw new Exception("查無此廠商與類型的資料");
				}

				System.out.println(sb.toString());

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void doInsert(String manufacturer, String type, BigDecimal minPrice, BigDecimal price) {
		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
			try (PreparedStatement pstmt = conn.prepareStatement(INSERT_CARS_SQL);) {
				conn.setAutoCommit(false);
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
		StringBuilder sql = new StringBuilder("UPDATE STUDENT.CARS SET ");
		List<Object> params = new ArrayList<>();
		if (minPrice != null) {
			sql.append("MIN_PRICE = ?, ");
			params.add(minPrice);
		}
		if (price != null) {
			sql.append("PRICE = ?, ");
			params.add(price);
		}
		sql.delete(sql.length() - 2, sql.length());// 去掉最后一个逗号和空格
		sql.append(" where MANUFACTURER = ? and TYPE = ?");
		params.add(manufacturer);
		params.add(type);

		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
			try (PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
				conn.setAutoCommit(false);
				for (int i = 0; i < params.size(); i++) {
					pstmt.setObject(i + 1, params.get(i));
				}
				pstmt.executeUpdate();

				// 如果沒有此資料就報錯
				// 返回值為0表示沒有任何資料異動的紀錄
				if (pstmt.executeUpdate() == 0) {
					throw new Exception("查無此廠商與類型的資料");
				}

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
			try (PreparedStatement pstmt = conn.prepareStatement(DELETE_CARS_SQL);) {
				conn.setAutoCommit(false);
				pstmt.setString(1, manufacturer);
				pstmt.setString(2, type);

				// 如果沒有此資料就報錯
				// 返回值為0表示沒有任何資料異動的紀錄
				if (pstmt.executeUpdate() == 0) {
					throw new Exception("查無此廠商與類型的資料");
				} else {
					pstmt.executeUpdate();
				}

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