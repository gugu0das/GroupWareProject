package com.ware.group.annual;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LeaveRecordVO {

	private Long leaveNum;
	private String id;
	private String leaveReason;
	private String leaveType;
	private Long leaveCount;
	private Date leaveDate;
	
	
}
