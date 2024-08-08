package com.cathaybk.practice.nt50334.b;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.swing.plaf.basic.BasicPasswordFieldUI;

import oracle.jdbc.driver.utils.StringUtils;

public class RandomLotto {

	public static void main(String[] args) {
		Set<Integer> RandomNumberSet = new HashSet<>();
		Random random = new Random();
		while (RandomNumberSet.size() < 6) {
			int randomNumber = random.nextInt(49) + 1; // 生成1到49的隨機數
			RandomNumberSet.add(randomNumber);
		}

		List<Integer> SortedNumberList = new ArrayList<>(RandomNumberSet);// set轉list
		Collections.sort(SortedNumberList);

		String resultSet = RandomNumberSet.toString().replace("[", "").replace("]", "").replace(",", "");// 去掉中括號和逗號
		String resultList = SortedNumberList.toString().replace("[", "").replace("]", "").replace(",", "");

		System.out.println("排序前：" + resultSet);
		System.out.println("排序後：" + resultList);

	}

}
