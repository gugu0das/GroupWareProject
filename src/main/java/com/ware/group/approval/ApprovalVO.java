package com.ware.group.approval;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApprovalVO {
	private Long id;
	private Long categoryId;
	private Long memberId;
	private String contents;
	private Date date;
	private String confirm;
	private Date fin;
	
	private ApprovalInfoVO approvalInfoVO;
	
	private List<ApprovalVO> ar;
}
