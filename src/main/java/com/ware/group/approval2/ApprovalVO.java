package com.ware.group.approval2;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApprovalVO {
	private long approvalNum;
	private long categoryNum;
	private String id;
	private String approvalContents;
	private Date approvalDate;
	private long approvalConfirm;
	private Date approvalFin;
}
