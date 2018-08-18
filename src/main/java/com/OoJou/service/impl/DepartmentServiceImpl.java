package com.OoJou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.OoJou.mapper.DepartmentMapper;
import com.OoJou.pojo.Department;
import com.OoJou.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	DepartmentMapper departmentMapper;
	
	@Override
	public List<Department> getDepts() {
		List<Department> list = departmentMapper.selectByExample(null);
		return list;
	}

}
