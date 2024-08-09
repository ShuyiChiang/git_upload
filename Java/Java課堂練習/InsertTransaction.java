package com.cathaybk.javaedu.lesson3.practice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class InsertTransaction {

    public static final String UPDATE_MEMBER_SQL = "update STUDENT.MEMBER set NAME = ? where ID = ? and PWD = ?";

    public static final String INSERT_CARS_SQL = "insert into STUDENT.CARS (MANUFACTURER, TYPE, MIN_PRICE, PRICE) values (?, ?, ?, ?)";

    public static final String CONN_URL = "jdbc:oracle:thin:@//localhost:1521/XE";

    public static void main(String[] args) {
        doInsert();
        doQuery();
    }

    public static void doInsert() {
        try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
            try {
                Random rand = new Random();
                conn.setAutoCommit(false);
                PreparedStatement pstmt = conn.prepareStatement(INSERT_CARS_SQL);
                pstmt.setString(1, "ABCD");
                pstmt.setString(2, "DEFG");
                pstmt.setInt(3, rand.nextInt(1000) + 1);
                pstmt.setInt(4, rand.nextInt(1000) + 1);
                pstmt.executeUpdate();
                
                conn.commit();
                System.out.println("新增成功");
            } catch (Exception e) {
                System.out.println("新增失敗，原因：" + e.getMessage());
                try {
                    conn.rollback();
                } catch (SQLException sqle) {
//                    sqle.printStackTrace();
                    System.out.println("rollback 失敗，原因：" + sqle.getMessage());
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }

    public static void doQuery() {

        try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {

            PreparedStatement pstmt = conn.prepareStatement("select * from STUDENT.CARS where MANUFACTURER = ? and TYPE = ?");
            pstmt.setString(1, "ABCD");
            pstmt.setString(2, "DEFG");

            //ResultSet物件儲存查詢結果
            ResultSet rs = pstmt.executeQuery();

            //使用StringBuilder做字串串接
            StringBuilder sb = new StringBuilder();
            sb.append("查詢結果： ");
            while (rs.next()) {
                sb.append("製造商： ").append(rs.getString("MANUFACTURER")).append("，型號：").append(rs.getString("TYPE"))
                        .append("，售價：").append(rs.getString("PRICE")).append("，底價：").append(rs.getString("MIN_PRICE"));
            }
            System.out.println(sb.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
