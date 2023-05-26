package com.ware.group.approval3;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.ware.group.approval.ApprovalCategoryVO;
import com.ware.group.approval.ApprovalFormFileVO;
import com.ware.group.approval.ApprovalVO;
import com.ware.group.approval.ApproverVO;



@Mapper
public interface ApprovalDAO3 {

	public int addCategory(ApprovalCategoryVO approvalCategoryVO) throws Exception;
	
	public int addApprover(ApproverVO approverVO) throws Exception;
	
	public int addApprovalFormFile(ApprovalFormFileVO approvalFormFileVO) throws Exception;
	
	public List<ApprovalCategoryVO> getCategoryOption() throws Exception;
	
	public int deleteCategory(ApprovalCategoryVO categoryVO) throws Exception;
	
	public int updateCategory(ApprovalCategoryVO categoryVO) throws Exception;
	
	public List<ApprovalCategoryVO> getListCategoryRef0() throws Exception;
	
	public List<ApprovalCategoryVO> getListCategoryRef1() throws Exception;
	
	public ApprovalVO test() throws Exception;
	
	public List<DepartmentVO> getDepartmentList() throws Exception;
	
	public List<JobVO> getJobList(DepartmentVO departmentVO) throws Exception;
	
	public int addFormFile(DocumentFilesVO documentFilesVO) throws Exception;
	
	public long getFileId(String fileName) throws Exception;
	
	public String getCategoryDuplication(String name) throws Exception;
	
	public String getFileDuplication(String formFileName) throws Exception;
	
	public List<ApprovalFormFileVO> getListFormFile() throws Exception;
	
	public List<ApproverVO> getListApprover() throws Exception;
	
	public int updateFormFile(DocumentFilesVO documentFilesVO) throws Exception;
	
	public int updateCategoryName(ApprovalCategoryVO approvalCategoryVO) throws Exception;
	
	public int updateApprover(ApproverVO approverVO) throws Exception;
}
