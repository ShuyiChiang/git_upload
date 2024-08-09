package com.cathaybk.practice.nt50334.b;

import java.math.BigDecimal;

public class Sales extends Employee {

	private BigDecimal bonus;
	private BigDecimal payment;
	private static final BigDecimal NUM = new BigDecimal("0.05");

	public Sales(String name, String department, BigDecimal salary, BigDecimal bonus) {
		super(name, department, salary);// 調用父類別的建構子
		this.bonus = bonus.multiply(NUM);// 建構子
		this.payment = bonus.add(salary);
	}

	@Override // 實作IWork介面的printInfo方法
	public void printInfo() {

		super.printInfo();// 父類別Employee的printInfo方法

		System.out.println("業績獎金: " + bonus.stripTrailingZeros().toPlainString());
		System.out.println("總計: " + bonus.add(super.getSalary()).stripTrailingZeros().toPlainString());
	}

	public BigDecimal getBonus() {
		return bonus;
	}

	public void setBonus(BigDecimal bonus) {
		this.bonus = bonus;
	}

	public BigDecimal getPayment() {
		return payment;
	}

	public void setPayment(BigDecimal payment) {
		this.payment = payment;
	}

}
