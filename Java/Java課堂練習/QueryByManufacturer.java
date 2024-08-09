package com.cathaybk.javaedu.lesson3.practice;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

public class QueryByManufacturer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String connUrl = "jdbc:oracle:thin:@//localhost:1521/XE";

		try (Connection conn = DriverManager.getConnection(connUrl, "student", "student123456");
				PreparedStatement pstmt = conn.prepareStatement("select * from STUDENT.CARS where MANUFACTURER=?");) {

			pstmt.setString(1, "Toyota");

			// ResultSet物件儲存查詢結果
			ResultSet rs = pstmt.executeQuery();

			// 使用StringBuilder做字串串接
			StringBuilder sb = new StringBuilder();

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
				BigDecimal minPrice=new BigDecimal(map.get("MIN_PRICE"));
				BigDecimal Price=new BigDecimal(map.get("PRICE"));
				BigDecimal diff = Price.subtract(minPrice);
				sb.append("製造商： ").append(map.get("MANUFACTURER")).append("，型號：").append(map.get("TYPE"))
						.append("，售價：").append(Price.toPlainString()).append("，底價：").append(minPrice.toPlainString())
						.append("，售價高於底價：").append(diff.toPlainString());

				System.out.println(sb.toString());
				sb.setLength(0);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
