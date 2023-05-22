package com.ware.group.approval3;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class DepartmentVO {

	private long id;
	private String name;
	private long manager;
	private long upper;
	private long level;
	private Date createDate;
	
}
