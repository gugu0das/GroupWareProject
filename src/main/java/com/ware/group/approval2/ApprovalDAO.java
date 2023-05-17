package com.ware.group.approval2;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalDAO {
	
	public int setApprovalApplication(ApprovalVO approvalVO);
	
	public int setApprovalApplicationFileUpload(ApprovalUploadFileVO approvalUploadFileVO);
}
