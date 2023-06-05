package com.ware.group.approval2;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ware.group.util.Pager;

@Mapper
public interface ApprovalDAOs {
	
	public int setApprovalApplication(ApprovalVO approvalVO) throws Exception;
	
	public int setApprovalApplicationFileUpload(ApprovalUploadFileVO approvalUploadFileVO) throws Exception;
	
	public int setApprovalApplicationHistory(ApprovalHistoryVO approvalHistoryVO) throws Exception;
	
	public List<ApproverVO> getApprover(ApprovalVO approvalVO) throws Exception;
	
	public MemberVO getApprovalInfo(ApproverVO approverVO) throws Exception;
	
	public int setApprovalInfo(ApprovalInfoVO approvalInfoVO) throws Exception;
	
	public List<ApprovalVO> getApprovalList(Pager pager) throws Exception;
	
	public ApprovalUploadFileVO getApprovalFile(ApprovalVO approvalVO) throws Exception;
	
	public Long getTotalCount(Pager pager) throws Exception;
}
