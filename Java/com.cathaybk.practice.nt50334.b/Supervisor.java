package com.cathaybk.practice.nt50334.b;

import java.math.BigDecimal;

public class Supervisor extends Employee {

	private BigDecimal payment;

	public Supervisor(String name, String department, BigDecimal payment) {
		super(name, department, payment);// 調用父類別的建構子
		this.payment = payment;// 建構子
	}

	@Override // 實作IWork介面的printInfo方法
	public void printInfo() {
		super.printInfo();// 父類別Employee的printInfo方法
		System.out.println("總計: " + payment);

	}

	public BigDecimal getPayment() {
		return payment;
	}

	public void setPayment(BigDecimal payment) {
		this.payment = payment;
	}

}
