package com.cathybk1;

public class School {

	public static void main(String[] args) {
//		Student Jason=new Student("小明",88888,1);
//		Jason.print(); 
		
		LangStudent Lang = new LangStudent();
        ComStudent Com = new ComStudent();
        System.out.println("--------------");
        Student student1 = new LangStudent("小明", 88888, 1, "英文");
        Student student2 = new ComStudent("小華", 77777, 2, "Java");
        student1.print();
        student2.print();
	}

}
