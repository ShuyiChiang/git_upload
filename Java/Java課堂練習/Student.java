package com.cathybk1;

public class Student implements IPrint {

	private String name;
	private int id;
	private int grade;
	
	public Student() {}//建構子，初始化參數
	
	public Student(String name, int id, int grade) {//建構子
		this.name = name;
		this.id = id;
		this.grade = grade;
	}
	
	
	public String getName() {//拿名子
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}


	@Override//實作IPrint介面的print方法
	public void print() {
		System.out.println("學生姓名:"+name+",學號:"+id+",年級:"+grade);
	}



}
