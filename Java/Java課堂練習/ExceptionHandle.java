package com.cathybk1;

import java.util.Random;

public class ExceptionHandle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Random random = new Random();
        int randomNumber = random.nextInt(100) + 1; // 生成 1 到 100 的隨機數

        try {
            if (randomNumber % 2 == 0) {
               throw new Exception("偶數：" + randomNumber);
            } else {
                System.out.println("奇數：" + randomNumber);
                
            }
        } catch (Exception e) {
           //System.out.println("java.lang.Exception: " + e.getMessage());
            e.printStackTrace();
        }
	}

}
