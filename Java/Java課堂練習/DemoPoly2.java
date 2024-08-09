package com.cathybk1;

import java.util.ArrayList;
import java.util.List;

public class DemoPoly2 {

	public static void main(String[] args) {

        List<Student> list = new ArrayList<>();
        list.add(new LangStudent("小明", 88888, 1, "英文"));
        list.add(new ComStudent("小華", 77777, 2, "Java"));
        
        Student aStudent=new Student();
        Student bStudent=new LangStudent("B", 9999, 2, "中文");
        Student cStudent=new ComStudent("C", 00000, 3, "C++");

        for (Student std : list) {
            if (std instanceof ComStudent) {
                ((ComStudent) std).programming();
            } else if (std instanceof LangStudent) {
                ((LangStudent) std).writing();
            }
        }
        
        System.out.println(aStudent instanceof ComStudent);
        System.out.println(aStudent instanceof LangStudent);
        
        System.out.println(bStudent instanceof ComStudent);
        System.out.println(bStudent instanceof LangStudent);
        
        System.out.println(cStudent instanceof ComStudent);
        System.out.println(cStudent instanceof LangStudent);
        
        
    }
}
