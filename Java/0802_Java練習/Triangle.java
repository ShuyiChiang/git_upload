package com.cathybk1;

public class Triangle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 印正方形1
		for(int i=0; i<5; i++) {
				System.out.println("* * * * *");
		}
		// 印正方形2
		for(int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				System.out.print("*");
			}
			System.out.print("\n");
		}
		
		// 印等腰直角三角形
		for(int i=0; i<10; i++) {
			for(int j=0; j<=i; j++) {
				System.out.print("* ");
			}
			System.out.print("\n");
		}
		
		// 印菱形
		int n=10;
		for(int i=0; i<n/2; i++) {
			for(int k=0; k<=n/2-1-i; k++) {
				System.out.print(" ");
			}
			
			for(int j=0; j<2*i-1; j++) {
				System.out.print("*");
			}
			
			System.out.print("\n");
		}
		
		for(int i=n/2; i>=1; i--) {
			for(int k=0;  k<=n/2-1-i; k++) {
				System.out.print(" ");
			}
			
			for(int j=0; j<2*i-1; j++) {
				System.out.print("*");
			}
			
			System.out.print("\n");
		}
	}	
}
