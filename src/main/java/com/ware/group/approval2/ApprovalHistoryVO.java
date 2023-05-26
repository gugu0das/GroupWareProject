package com.ware.group.approval2;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApprovalHistoryVO {
	private long id;
	private long approvalId;
	private long memberId;
	private Date date;
	private String check;
}
