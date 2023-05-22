package com.ware.group.approval;

import java.sql.Date;



import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApprovalVO {
	private long id;
	private long categoryId;
	private long memberId;
	private String contents;
	private Date date;
	private String confirm;
	private Date fin;
	
	private ApprovalInfoVO approvalInfoVO;
}
