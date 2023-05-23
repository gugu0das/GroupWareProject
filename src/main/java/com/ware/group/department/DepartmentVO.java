package com.ware.group.department;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DepartmentVO {

	private Long id;
	private String name;
	private Long manager;
	private Long upper;
	private Long level;
	private Date createDate;
	
	private List<DepartmentVO> departmentVOs;
	
}
