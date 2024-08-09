package com.cathaybk.practice.nt50334.b;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

public class RandomLotto {

	public static void main(String[] args) {
		Set<Integer> randomNumberSet = new HashSet<>();
		Random random = new Random();
		while (randomNumberSet.size() < 6) {
			int randomNumber = random.nextInt(49) + 1; // 生成1到49的隨機數
			randomNumberSet.add(randomNumber);
		}
		List<Integer> numberList = new ArrayList<>(randomNumberSet); // set轉list
		System.out.print("排序前：");
		printInfo(numberList);
		Collections.sort(numberList);
		System.out.print("排序後：");
		printInfo(numberList);

	}

	public static void printInfo(List<Integer> numberList) {
		for (Integer num : numberList) {
			System.out.print(num + " ");
		}

		System.out.println("");
	}
}
