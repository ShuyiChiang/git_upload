package com.cathybk1;

public class LangStudent extends Student {
	private String language;

	public LangStudent() {
		System.out.println("沒有傳入參數的LangStudent建構子");
	}

	public LangStudent(String name, int id, int grade, String language) {
		super(name, id, grade);// 調用父類別的建構子
		this.language = language;//建構子
	}

	@Override
	public void print() {
		super.print();// 父類別student的print方法
		System.out.println("外語:" + language);
	}

	public void writing() {
		System.out.println("寫文章");
	}
}
