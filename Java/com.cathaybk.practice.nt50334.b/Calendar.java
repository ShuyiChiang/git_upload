package com.cathaybk.practice.nt50334.b;

import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.Locale;
import java.util.Scanner;

import javax.sql.rowset.JoinRowSet;

public class Calendar {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		int month = 0;

		while (true) {
			System.out.print("請輸入介於1到12之間的整數: ");
			if (scanner.hasNextInt()) {// 判斷是否為整數
				month = scanner.nextInt();

				if (month >= 1 && month <= 12) {// 判斷是否介於1~12
					break;
				} else {
					System.out.println("輸入錯誤，請輸入介於1到12之間的整數。");
				}

			} else {
				System.out.println("輸入錯誤，請輸入整數。");
				scanner.next();
			}

		}

		int year = LocalDate.now().getYear();

		// 該年該月的第一天
		LocalDate firstDayOfMonth = LocalDate.of(year, month, 1);

		// 該月有幾天
		int daysOfMonth = firstDayOfMonth.lengthOfMonth();

		// 第一天在星期幾
		int weekDay = firstDayOfMonth.getDayOfWeek().getValue();

		System.out.println(
				"     " + year + "年 " + firstDayOfMonth.getMonth().getDisplayName(TextStyle.FULL, Locale.getDefault()));
		System.out.println("---------------------");
		System.out.println(" 日 一 二 三 四 五 六");
		System.out.println("=====================");
		// 印空白位置
		for (int i = 0; i < weekDay % 7; i++) {
			System.out.print("   ");
		}

		// 印日期
		for (int day = 1; day <= daysOfMonth; day++) {
			System.out.printf("%2d ", day);
			if ((day + weekDay) % 7 == 0) {
				System.out.println();
			}
		}

	}

}
