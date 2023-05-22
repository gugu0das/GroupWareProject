package com.ware.group.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ware.group.approval.MemberVO;
import com.ware.group.approval3.DepartmentVO;
import com.ware.group.approval3.JobVO;

@Mapper
public interface ApprovalDAO {
	
	public int setApprovalApplication(ApprovalVO approvalVO) throws Exception;
	
	public int setApprovalApplicationFileUpload(ApprovalUploadFileVO approvalUploadFileVO) throws Exception;
	
	public int setApprovalApplicationHistory(ApprovalHistoryVO approvalHistoryVO) throws Exception;
	
	public List<ApproverVO> getApprover(ApprovalVO approvalVO) throws Exception;
	
	public MemberVO getApprovalInfo(ApproverVO approverVO) throws Exception;
	
	public int setApprovalInfo(ApprovalInfoVO approvalInfoVO) throws Exception;
	
	public List<ApprovalVO> getApprovalList(MemberVO memberVO) throws Exception;
	
	public ApprovalUploadFileVO getApprovalFile(ApprovalVO approvalVO) throws Exception;
	
	//
	public int addCategory(ApprovalCategoryVO approvalCategoryVO) throws Exception;
	
	public int addApprover(ApproverVO approverVO) throws Exception;
	
	public int addApprovalFormFile(ApprovalFormFileVO approvalFormFileVO) throws Exception;
	
	public List<ApprovalCategoryVO> getCategoryOption() throws Exception;
	
	public int deleteCategory(ApprovalCategoryVO categoryVO) throws Exception;
	
	public int updateCategory(ApprovalCategoryVO categoryVO) throws Exception;
	
	public List<ApprovalCategoryVO> getListCategory() throws Exception;
	
	public ApprovalVO test() throws Exception;
	
	public List<DepartmentVO> getDepartmentList() throws Exception;
	
	public List<JobVO> getJobList(DepartmentVO departmentVO) throws Exception;
}
