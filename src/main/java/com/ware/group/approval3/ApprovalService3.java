package com.ware.group.approval3;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.ware.group.approval.ApprovalCategoryVO;
import com.ware.group.approval.ApprovalFormFileVO;
import com.ware.group.approval.ApprovalVO;
import com.ware.group.approval.ApproverVO;

@Service
public class ApprovalService3 {

	@Autowired
	ApprovalDAO3 approvalDAO;
	
	public List<ApprovalCategoryVO> getListCategory() throws Exception{
		return approvalDAO.getListCategory();
	};
	public int addCategory(ApprovalCategoryVO approvalCategoryVO) throws Exception{
		return approvalDAO.addCategory(approvalCategoryVO);
	}
	public int addApprover(ApproverVO approverVO) throws Exception{
		return approvalDAO.addApprover(approverVO);
	}
	public int addApprovalFormFile(ApprovalFormFileVO approvalFormFileVO) throws Exception{
		return approvalDAO.addApprovalFormFile(approvalFormFileVO);
	}
	public List<ApprovalCategoryVO> getCategoryOption() throws Exception{
		return approvalDAO.getCategoryOption();
	};
	public int deleteCategory(ApprovalCategoryVO categoryVO) throws Exception{
		return approvalDAO.deleteCategory(categoryVO);
	};
	
	public ApprovalVO test() throws Exception{
		return approvalDAO.test();
	};
	
	public List<DepartmentVO> getDepartmentList() throws Exception{
		return approvalDAO.getDepartmentList();
	};
	public List<JobVO> getJobList(DepartmentVO departmentVO) throws Exception{
		return approvalDAO.getJobList(departmentVO);
	};
}
