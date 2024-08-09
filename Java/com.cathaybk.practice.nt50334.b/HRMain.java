package com.cathaybk.practice.nt50334.b;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;

public class HRMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		List<Employee> employeeList = new ArrayList<>();
		employeeList.add(new Sales("張志誠", "信用卡部", new BigDecimal("35000"), new BigDecimal("6000")));
		employeeList.add(new Sales("林大鈞", "保代部", new BigDecimal("38000"), new BigDecimal("4000")));
		employeeList.add(new Supervisor("李中白", "資訊部", new BigDecimal("65000")));
		employeeList.add(new Supervisor("林小中", "理財部", new BigDecimal("80000")));

		for (Employee employee : employeeList) {
			employee.printInfo();

		}

		// 使用BufferedWriter寫入CSV文件，指定UTF-8
		try (BufferedWriter writer = new BufferedWriter(
				new OutputStreamWriter(new FileOutputStream("C:\\Users\\Admin\\Desktop\\output.csv"), "UTF-8"))) {

			for (Employee employee : employeeList) {

				if (employee instanceof Supervisor) {// 寫入Supervisor
					int total = employee.getSalary().intValue();
					writer.write(employee.getName() + "," + total + "\n");
				} else if (employee instanceof Sales) {// 寫入Sales
					int total = (((Sales) employee).getBonus().add(employee.getSalary())).intValue();
					writer.write(employee.getName() + "," + total + "\n");
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
