package com.ware.group.approval;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApprovalFormFileVO {
	private long categoryId;
	private long fileId;
	private String fileName;
	private String oriName;
}