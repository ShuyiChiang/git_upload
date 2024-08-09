package com.cathybk1;

import java.util.Random;

public class DiceArray2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Random random = new Random();
		// index 0 1 2 3 4 5 6 7 8 9 10
		// 統計對象 2 3 4 5 6 7 8 9 10 11 12
		String[] results = new String[] { "", "", "", "", "", "", "", "", "", "", "" };

		int[] freuency = new int[11];

		for (int i = 0; i < 20; i++) {
			int dice1 = random.nextInt(6) + 1;
			int dice2 = random.nextInt(6) + 1;
			int sum = dice1 + dice2;
			results[sum - 2] += "*";// 把統計對象轉成index要-2
			freuency[sum - 2]++;
		}

		for (int i = 0; i < results.length; i++) {
			String resultFinalString = results[i];
			if ("".equals(resultFinalString)) {
				continue;
			}
			System.out.println((i + 2) + resultFinalString);// 把index轉成統計對象要+2
			System.out.println((i + 2) + " " + freuency[i]);
		}
	}

}
