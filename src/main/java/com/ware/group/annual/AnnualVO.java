package com.ware.group.annual;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AnnualVO {

	private Long annualNum;
	private Long annualCount;
	private Long annualType;
	private Date annualReg;
	private String id;
	
}
