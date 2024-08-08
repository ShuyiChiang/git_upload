package com.cathaybk.practice.nt50334.b;

import java.math.BigDecimal;

public class Sales extends Employee{
	
	private BigDecimal bonus;
	private BigDecimal payment;

	
	public Sales(String name, String department, BigDecimal salary, BigDecimal bonus) {
		super(name, department, salary);// 調用父類別的建構子
		this.bonus = bonus.multiply(new BigDecimal("0.05"));//建構子
		this.payment =bonus.add(salary);
	}
	
	@Override//實作IWork介面的printInfo方法
	public void printInfo() {
		//int total=bonus+super.getSalary();
		int total=bonus.add(super.getSalary()).intValue();
		super.printInfo();// 父類別Employee的printInfo方法
		
		System.out.println("業績獎金: " + bonus.intValue());
		System.out.println("總計: " + total);
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
