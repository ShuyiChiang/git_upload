package com.cathaybk.javaedu.lesson3.practice;

public class DiceArray {

    public static void main(String[] args) {
        diceArray();
    }

    private static void diceArray() {
        

        //                        index   0   1   2   3   4   5   6   7   8   9   10          
        //                        統計對象  2   3   4   5   6   7   8   9   10  11  12
        String[] results = new String[] { "", "", "", "", "", "", "", "", "", "", "" };

        for (int i = 1; i <= 20; i++) {
            results[dice() + dice() - 2] += "*";
        }

        for (int i = 0; i < results.length; i++) {
            String result = results[i];
            if (!"".equals(result)) {
                System.out.println((i + 2) + result);
            }
        }
    }

    private static int dice() {
        return (int) (Math.random() * 10 % 6) + 1;
        //     * 10 % 6        0 1 2 3 4 5
        //     * 10 % 6 + 1    1 2 3 4 5 6
    }

}
