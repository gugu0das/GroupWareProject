package com.ware.group.approval;


import java.util.List;

import com.ware.group.department.DepartmentVO;
import com.ware.group.member.JobVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApproverVO {
	private long categoryId;
	private long jobId;
	private long departmentId;
	private long depth;
	
	private List<DepartmentVO> departmentVOs;
	private List<JobVO> jobVOs;
	
}
