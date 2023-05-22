package com.ware.group.department;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DepartmentDAO {

	public List<DepartmentVO>getDepartmentList()throws Exception;


	public int setDepartmentAdd(DepartmentVO departmentVO)throws Exception;
}
