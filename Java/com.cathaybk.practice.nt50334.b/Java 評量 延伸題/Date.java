package com.cathaybk.practice.nt50334.b;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.format.TextStyle;
import java.util.Locale;
import java.util.Scanner;

public class Date {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scanner = new Scanner(System.in);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDate date=null;

		while (true) {
			System.out.print("請輸入日期(yyyy/MM/dd):");
			String input = scanner.next();
			
			try {
				date = LocalDate.parse(input, formatter);
				break;
				
			} catch (DateTimeParseException e) {
				System.out.println("輸入的日期格式不正確，請輸入 yyyy/MM/dd 格式的日期");
			}
		}
		scanner.close();
		DayOfWeek weekDay = date.getDayOfWeek();
		System.out.println(weekDay.getDisplayName(TextStyle.FULL, Locale.getDefault()));
	}

}
