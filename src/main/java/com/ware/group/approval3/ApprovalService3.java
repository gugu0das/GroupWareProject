package com.ware.group.approval3;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ware.group.approval.ApprovalCategoryVO;
import com.ware.group.approval.ApprovalFormFileVO;
import com.ware.group.approval.ApprovalVO;
import com.ware.group.approval.ApproverVO;

@Service
public class ApprovalService3 {

	@Autowired
	ApprovalDAO3 approvalDAO;
	
	public int updateFormFile(DocumentFilesVO documentFilesVO) throws Exception{
		return approvalDAO.updateFormFile(documentFilesVO);
	}
	public int updateCategoryName(ApprovalCategoryVO approvalCategoryVO) throws Exception{
		return approvalDAO.updateCategoryName(approvalCategoryVO);
	}
	public int updateApprover(ApproverVO approverVO) throws Exception{
		return approvalDAO.updateApprover(approverVO);
	}
	
	public List<ApprovalFormFileVO> getListFormFile() throws Exception{
		return approvalDAO.getListFormFile();
	};
	public List<ApproverVO> getListApprover() throws Exception{
		return approvalDAO.getListApprover();
	}
	
	public List<ApprovalCategoryVO> getListCategoryRef0() throws Exception{
		return approvalDAO.getListCategoryRef0();
	};
	
	public List<ApprovalCategoryVO> getListCategoryRef1() throws Exception{
		return approvalDAO.getListCategoryRef1();
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
	
	public int addFormFile(DocumentFilesVO documentFilesVO) throws Exception{
		return approvalDAO.addFormFile(documentFilesVO);
	};
	
	public long getFileId(String fileName) throws Exception{
		return approvalDAO.getFileId(fileName);
	}
	
	public List<String> getCategoryDuplication(String[] name) throws Exception{
		List<String> dup = new ArrayList<String>();
		for(String str : name) {
			str = approvalDAO.getCategoryDuplication(str);
			if(str != null) {
				dup.add(str);
			}
		}
		return dup;
	}
	
	public List<String> getFileDuplication(String[] formFileName) throws Exception{
		List<String> dup = new ArrayList<String>();
		for(String str : formFileName) {
			str = approvalDAO.getFileDuplication(str);
			if(str != null) {
				dup.add(str);
			}
		}
		
		return dup;
	}
}
