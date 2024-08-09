package com.cathybk1;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

public class RandomNum {

    public static void main(String[] args) {
       Set<Integer> set = new TreeSet<>();
        Random random = new Random();
        
        while (set.size() < 5) {
            int randomNumber = random.nextInt(10) + 1; // 生成1到10的隨機數
            set.add(randomNumber);
        }
        System.out.println("用TreeSet:");
        System.out.println(set);
        
        
        List<Integer> list = new ArrayList<>(set);//set轉list
        Collections.sort(list);
        System.out.println("用ArrayList:");
        System.out.println(list);
    }
}
