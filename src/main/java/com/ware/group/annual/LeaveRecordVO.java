package com.ware.group.annual;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LeaveRecordVO {

	private Long id;
	private String memberId;
	private String reason;
	private String type;
	private Long count;
	private Date date;
	
	
}
