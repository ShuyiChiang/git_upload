package com.cathybk1;

import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

public class Randomtest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Random random = new Random();
		Set<Integer> uniqueNumbersSet = new TreeSet<>();// 存不重複&自然排序的數字

		while (uniqueNumbersSet.size() < 15) {
			int randomNumber = random.nextInt(100) + 1; // 生成1到100的隨機數
			uniqueNumbersSet.add(randomNumber);
		}

		System.out.println(uniqueNumbersSet);

		// 計算平均值
		int sum = 0;
		for (int number : uniqueNumbersSet) {
			sum += number;
		}
		int avg = sum / uniqueNumbersSet.size();

		// 印出平均值
		System.out.println("平均值:" + avg);
	}

}