package com.cathaybk.practice.nt50334.b;

public class Diamond {

	public static void main(String[] args) {
		// 印菱形
		int n = 10;
		for (int i = 1; i <= n / 2; i++) {
			for (int k = 0; k <= n / 2 - 1 - i; k++) {
				System.out.print(" ");
			}

			for (int j = 0; j < 2 * i - 1; j++) {
				System.out.print("*");
			}

			System.out.print("\n");
		}

		for (int i = n / 2 - 1; i >= 1; i--) {
			for (int k = 0; k <= n / 2 - 1 - i; k++) {
				System.out.print(" ");
			}

			for (int j = 0; j < 2 * i - 1; j++) {
				System.out.print("*");
			}

			System.out.print("\n");
		}
	}

}
