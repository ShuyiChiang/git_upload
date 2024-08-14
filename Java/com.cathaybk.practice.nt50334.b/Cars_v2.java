package com.cathaybk.practice.nt50334.b;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.math.BigDecimal;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

public class Cars {

	protected static final BigDecimal BigDecimal = null;

	public static void main(String[] args) {
		String inputFilePath = "C:\\Users\\Admin\\Desktop\\cars.csv";
		String outputFilePath = "C:\\Users\\Admin\\Desktop\\cars2.csv";

		List<Map<String, String>> carList = new ArrayList<>();

		// 讀CSV文件
		try (BufferedReader reader = new BufferedReader(new FileReader(inputFilePath))) {
			String line = reader.readLine(); // 讀表頭
			String[] headers = line.split(",");

			while ((line = reader.readLine()) != null) {// 讀數據
				String[] values = line.split(",");
				Map<String, String> carMap = new HashMap<>();
				for (int i = 0; i < headers.length; i++) {
					carMap.put(headers[i], values[i]);
				}
				carList.add(carMap);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 按Price降序
//		Collections.sort(carList, new Comparator<Map<String, String>>() {
//			@Override
//			public int compare(Map<String, String> car1, Map<String, String> car2) {
//				int priceComparison = new BigDecimal(car2.get("Price")).compareTo(new BigDecimal(car1.get("Price")));
//
//				// 如果Price相同，再按Min.Price降序排序
//				if (priceComparison == 0) {
//					return new BigDecimal(car2.get("Min.Price")).compareTo(new BigDecimal(car1.get("Min.Price")));
//				}
//
//				return priceComparison;
//			}
//		});

		Collections.sort(carList, new Comparator<Map<String, String>>() {
			@Override
			public int compare(Map<String, String> car1, Map<String, String> car2) {
				int priceComparison = getBigDecimal(car2.get("Price")).compareTo(getBigDecimal(car1.get("Price")));

				// 如果Price相同，再按Min.Price降序排序
				if (priceComparison == 0) {
					return getBigDecimal(car2.get("Min.Price")).compareTo(getBigDecimal(car1.get("Min.Price")));
				}

				return priceComparison;
			}

			public BigDecimal getBigDecimal(String str) {
				return (str != null) ? new BigDecimal(str) : java.math.BigDecimal.ZERO;
			}
		});

		// 排序後寫入CSV文件
		try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputFilePath))) {
			// 寫表頭
			writer.write("Manufacturer,Type,Min.Price,Price");
			writer.newLine();

			// 寫數據
			for (Map<String, String> carMap : carList) {
				writer.write(String.join(",", carMap.values()));
				writer.newLine();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 按Manufacturer分組算小計
		Map<String, List<Map<String, String>>> groupedCars = carList.stream()
				.collect(Collectors.groupingBy(car -> car.get("﻿Manufacturer"), // 指定分組的標準，從每個Map<String,
																				// String>中提取Manufacturer為key
						TreeMap::new, // 使用TreeMap儲存分組結果(字母順序)
						Collectors.toList()));// 收集器，相同﻿Manufacturer收集為一個List

		// 初始化總計的最低價與價格為0
		BigDecimal totalMinPrice = java.math.BigDecimal.ZERO;
		BigDecimal totalPrice = java.math.BigDecimal.ZERO;

		// 印出標題列
		System.out.printf("%-12s %-12s %-12s %-12s%n", "Manufacturer", "TYPE", "Min.PRICE", "Price");

		// 遍歷每一個廠商（按字母順序排序後)
		for (String manufacturer : groupedCars.keySet()) {
			// 取得該廠商的所有車
			List<Map<String, String>> cars = groupedCars.get(manufacturer);

			// 初始化小計的最低價與價格為0
			BigDecimal subTotalMinPrice = java.math.BigDecimal.ZERO;
			BigDecimal subTotalPrice = java.math.BigDecimal.ZERO;

			// 遍歷該廠商的每一個車
			for (Map<String, String> car : cars) {
				// 取得該車輛的最低價與價格，並轉換為BigDecimal以進行運算
				BigDecimal minPrice = new BigDecimal(car.get("Min.Price"));
				BigDecimal price = new BigDecimal(car.get("Price"));

				// 將該車輛的價格加到小計
				subTotalMinPrice = subTotalMinPrice.add(minPrice);
				subTotalPrice = subTotalPrice.add(price);

				// 印出所有車輛
				System.out.printf("%-12s %-12s %9s %8s%n", car.get("﻿Manufacturer"), car.get("Type"), minPrice, price);
			}

			// 印出小計列
			System.out.printf("%-11s %-12s %9s %8s%n", "小計", "", subTotalMinPrice, subTotalPrice);

			// 將該廠商的小計加到合計
			totalMinPrice = totalMinPrice.add(subTotalMinPrice);
			totalPrice = totalPrice.add(subTotalPrice);
		}

		// 印出合計列
		System.out.printf("%-11s %-12s %9s %8s%n", "合計", "", totalMinPrice, totalPrice);

	}

}
