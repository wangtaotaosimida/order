package com.jsjk.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsjk.dao.DepartmentDao;
import com.jsjk.model.Department;
import com.jsjk.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService{

	@Autowired
	private DepartmentDao departmentDao;
	
	public List<Department> selectDepartment() {
		return departmentDao.selectDepartment();
	}

}
