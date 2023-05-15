package com.ware.group.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentDAO departmentDAO;
	public List<DepartmentVO> getDepartmentList()throws Exception{
		return departmentDAO.getDepartmentList();
		
	}
}
