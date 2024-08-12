package com.cathaybk.practice.nt50334.b;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class Cars {

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
		Collections.sort(carList, new Comparator<Map<String, String>>() {
			@Override
			public int compare(Map<String, String> car1, Map<String, String> car2) {
				int priceComparison = new BigDecimal(car2.get("Price")).compareTo(new BigDecimal(car1.get("Price")));

				// 如果Price相同，再按Min.Price降序排序
				if (priceComparison == 0) {
					return new BigDecimal(car2.get("Min.Price")).compareTo(new BigDecimal(car1.get("Min.Price")));
				}

				return priceComparison;
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
		// 使用TreeMap來儲存分組的車輛資料，以便按字母順序排序廠商名稱
		Map<String, List<Map<String, String>>> groupedCars = new TreeMap<>();

		// 遍歷carList中的每一個車輛資料
		for (Map<String, String> car : carList) {
			String manufacturer = car.get("﻿Manufacturer");

			// 將車輛資料添加到對應廠商的分組中，若該廠商尚無資料，則創建一個新的清單
			// 如果該key不存在，則執行 k -> new ArrayList<>()，為這個key創建並返回一個新的 ArrayList，並將這個新創建的
			// ArrayList 作為該key的值插入到 groupedCars
			groupedCars.computeIfAbsent(manufacturer, k -> new ArrayList<>()).add(car);

		}

		// 初始化總計的最低價與價格為0
		BigDecimal totalMinPrice = BigDecimal.ZERO;
		BigDecimal totalPrice = BigDecimal.ZERO;

		// 印出標題列
		System.out.printf("%-12s %-12s %-12s %-12s%n", "Manufacturer", "TYPE", "Min.PRICE", "Price");

		// 遍歷每一個廠商（按字母順序排序後)
		for (String manufacturer : groupedCars.keySet()) {
			// 取得該廠商的所有車
			List<Map<String, String>> cars = groupedCars.get(manufacturer);

			// 初始化小計的最低價與價格為0
			BigDecimal subTotalMinPrice = BigDecimal.ZERO;
			BigDecimal subTotalPrice = BigDecimal.ZERO;

			// 遍歷該廠商的每一個車
			for (Map<String, String> car : cars) {
				// 取得該車輛的最低價與價格，並轉換為BigDecimal以進行運算
				BigDecimal minPrice = new BigDecimal(car.get("Min.Price"));
				BigDecimal price = new BigDecimal(car.get("Price"));

				// 將該車輛的價格加到小計
				subTotalMinPrice = subTotalMinPrice.add(minPrice);
				subTotalPrice = subTotalPrice.add(price);

				// 印出所有車輛
				System.out.printf("%-12s %-12s %9s %8s%n", car.get("﻿Manufacturer"), car.get("Type"), minPrice,
						price);
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
