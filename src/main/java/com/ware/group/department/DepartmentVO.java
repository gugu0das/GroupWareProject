package com.ware.group.department;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DepartmentVO {

	private Long id;
	private String name;
	private String manager;
	private Long upper;
	private Long level;
	private Date createDate;
	
}
