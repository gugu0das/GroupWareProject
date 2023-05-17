package com.ware.group.approval;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApprovalUploadFileVO {
	private long id;
	private long approvalId;
	private String name;
	private String originalName;
}
