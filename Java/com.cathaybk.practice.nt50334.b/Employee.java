package com.cathaybk.practice.nt50334.b;

import java.math.BigDecimal;

public class Employee implements IWork {

	private String name;
	private String department;
	private BigDecimal salary;

	public Employee() {
	}// 建構子，初始化參數

	public Employee(String name, String department, BigDecimal salary) {
		super();
		this.name = name;
		this.department = department;
		this.salary = salary;
	}

	@Override // 實作IWork介面的printInfo方法
	public void printInfo() {
		System.out.println("薪資單");
		System.out.println("姓名: " + name + " 工作部門: " + department);
		System.out.println("月薪: " + salary);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public BigDecimal getSalary() {
		return salary;
	}

	public void setSalary(BigDecimal salary) {
		this.salary = salary;
	}

}
