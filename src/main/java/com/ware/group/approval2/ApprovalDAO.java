package com.ware.group.approval2;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalDAO {
	
	public int setApprovalApplication(ApprovalVO approvalVO);
	
	public int setApprovalApplicationFileUpload(ApprovalUploadFileVO approvalUploadFileVO);
	
	public int setApprovalApplicationHistory(ApprovalHistoryVO approvalHistoryVO);
	
	public List<ApproverVO> getApprover(ApprovalVO approvalVO);
	
	public MemberVO getApprovalInfo(ApproverVO approverVO);
	
	public int setApprovalInfo(ApprovalInfoVO approvalInfoVO);
}
