package com.ware.group.department;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DepartmentVO {

	private Long deptNum;
	private String deptName;
	private String deptManager;
	private Long deptUpper;
	private Long deptLevel;
	private Date deptCreateDate;
	
}
