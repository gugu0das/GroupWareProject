package com.ware.group.approval;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApproverVO {
	private Long categoryId;
	private Long jobId;
	private Long departmentId;
	private Integer depth;
}
