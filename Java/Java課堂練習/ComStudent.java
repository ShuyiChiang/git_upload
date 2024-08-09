package com.cathybk1;

public class ComStudent extends Student{
	private String program;
	
	public ComStudent() {
		System.out.println("沒有傳入參數的ComStudent建構子");
	}

	public ComStudent(String name, int id, int grade,String program) {
		super(name, id, grade);//調用父類別的建構子
		this.program = program;
	}

	@Override
	public void print() {
		super.print();//父類別student的print方法
		System.out.println("程式語言:" + program);
	}
	
	public void programming() {
		System.out.println("寫程式");
	}

}
