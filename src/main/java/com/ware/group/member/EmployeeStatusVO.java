package com.ware.group.member;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

public class EmployeeStatusVO {
	@Getter
	@Setter
	public class EmployeeStatus {

		private Long empNum;
		private Date empReg;
		private Date empOnTime;
		private Date empOffTime;
		private String empStatus;
		private String id;
		
	}
}
