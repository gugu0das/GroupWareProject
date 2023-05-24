package com.ware.group.department;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DepartmentDAO {

	public List<DepartmentVO>getDepartmentList()throws Exception;

	public int setDepartmentAdd(DepartmentVO departmentVO)throws Exception;
	
	public DepartmentVO getDepartmentDetail(DepartmentVO departmentVO)throws Exception;
	
	
	
	
	public List<DepartmentVO> getDepartmentLevel0()throws Exception;
	public List<DepartmentVO> getDepartmentLevel1(DepartmentVO departmentVO)throws Exception;
	public List<DepartmentVO> getDepartmentLevel2(DepartmentVO departmentVO)throws Exception;
	public List<DepartmentVO> getDepartmentLevel3(DepartmentVO departmentVO)throws Exception;
	public List<DepartmentVO> getDepartmentLevel4(DepartmentVO departmentVO)throws Exception;
	public List<DepartmentVO> getDepartmentLevel5(DepartmentVO departmentVO)throws Exception;
	
	
}
