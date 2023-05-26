package com.ware.group.approval2;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApprovalInfoVO {
	private Long id;
	private Long approvalId;
	private Long memberId;
	private Date date;
	private String check;
}
