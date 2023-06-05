package com.ware.group.department;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DepartmentDAO {

	public List<DepartmentVO>getDepartmentList()throws Exception;

	public int setDepartmentAdd(DepartmentVO departmentVO)throws Exception;

	public DepartmentVO getDepartmentDetail(DepartmentVO departmentVO)throws Exception;

	public int setDepartmentDelete(DepartmentVO departmentVO)throws Exception;

	public List<DepartmentVO> getDepartmentChildId(DepartmentVO departmentVO)throws Exception;

	public int setDepartmentUpdate(DepartmentVO departmentVO)throws Exception;

	public List<DepartmentVO> getDeparmentTree(DepartmentVO departmentVO)throws Exception;

}
