package com.OoJou.service;

import java.util.List;

import com.OoJou.pojo.Employee;

public interface EmployeeService {

		public List<Employee> getAll();

		public void deleteBatch(List<Integer> del_ids);

		public void deleteEmp(Integer id);

		public void updateEmp(Employee employee);

		public Employee getEmp(Integer id);

		public boolean checkUser(String empName);

		public void saveEmp(Employee employee);
		
		
		
}
