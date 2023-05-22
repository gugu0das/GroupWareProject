package com.ware.group.member;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

public class EmployeeStatusVO {
	@Getter
	@Setter
	public class EmployeeStatus {

		private Long id;
		private Date reg;
		private Date onTime;
		private Date offTime;
		private String status;
		private String memberId;
		
	}
}
