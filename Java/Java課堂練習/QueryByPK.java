package com.cathaybk.javaedu.lesson3.practice;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class QueryByPK {

    public static void main(String[] args) {
        String connUrl = "jdbc:oracle:thin:@//88.8.125.32:1521/XE";

        try (Connection conn = DriverManager.getConnection(connUrl, "STUDENT", "CATHAYBK654321");
                PreparedStatement pstmt = conn.prepareStatement("select * from STUDENT.CARS where MANUFACTURER = ? and TYPE = ?");) {

            pstmt.setString(1, "Toyota123");
            pstmt.setString(2, "R8");

            //ResultSet物件儲存查詢結果
            ResultSet rs = pstmt.executeQuery();

            Map<String, String> map = new HashMap<>();
            while (rs.next()) {
                map.put("MANUFACTURER", rs.getString("MANUFACTURER"));
                map.put("TYPE", rs.getString("TYPE"));
                map.put("MIN_PRICE", rs.getString("MIN_PRICE"));
                map.put("PRICE", rs.getString("PRICE"));
            }

            StringBuilder sb = new StringBuilder();
            if (!map.isEmpty()) {
                BigDecimal price = new BigDecimal(map.get("PRICE"));
                sb.append("製造商：").append(map.get("MANUFACTURER")).append("，型號：").append(map.get("TYPE")).append("，售價：$").append(price)
                        .append("，底價：$").append(map.get("MIN_PRICE"));
            } else {
                sb.append("查無結果");
            }
            System.out.println(sb.toString());

            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
