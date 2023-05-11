package com.ware.group.approval;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApprovalLogVO {
	private long logNum;
	private long approvalNum;
	private String id;
	private Date approvalDate;
	private long approvalCheck;
}
