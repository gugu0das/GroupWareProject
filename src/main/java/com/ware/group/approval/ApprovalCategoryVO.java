package com.ware.group.approval;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ApprovalCategoryVO {
	private long id;
	private String name;
	private long ref;
	
	
	
	private List<ApprovalCategoryVO> sub;
	private List<ApproverVO> approver;
	private List<ApprovalFormFileVO> file;
	
	
	
}
