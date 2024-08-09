package com.cathybk1;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

public class RandomList {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Random random = new Random();
		Set<Integer> uniqueNumbersSet = new HashSet<>();// 存不重複的數字
		List<Integer> numberList = new ArrayList<>();// 存排序過的數字

		while (uniqueNumbersSet.size() < 15) {
			int randomNumber = random.nextInt(100) + 1; // 生成1到100的隨機數
			uniqueNumbersSet.add(randomNumber);
		}

		// 方法1:將Set轉換為List
		// numberList.addAll(uniqueNumbersSet);
		// 方法2:使用 for 循環將 Set 中的元素添加到 List 中
//        for (int number : uniqueNumbersSet) {
//            numberList.add(number);
//        }
		// 方法3:
		numberList = new ArrayList<>(uniqueNumbersSet);

		// 將List中的數字按從小到大排序
		Collections.sort(numberList);

		System.out.println(numberList);

		// 計算平均值
		double sum = 0;
		for (int number : numberList) {
			sum += number;
		}
		double avg = sum / numberList.size();

		// 印出平均值
		System.out.println("平均值:" + avg);
	}

}
