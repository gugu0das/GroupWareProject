package com.ware.group.approval2;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApprovalUploadFileVO {
	private long fileNum;
	private long approvalNum;
	private String fileName;
	private String originalName;
}
