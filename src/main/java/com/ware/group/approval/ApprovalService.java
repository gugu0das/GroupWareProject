package com.ware.group.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ware.group.approval.MemberVO;
import com.ware.group.approval3.DepartmentVO;
import com.ware.group.approval3.JobVO;

@Service
@Transactional(rollbackFor=Exception.class)
public class ApprovalService {
	
	@Autowired
	private ApprovalDAO approvalDAO;
	
	public int setApprovalApplication(ApprovalVO approvalVO,String fileName) throws Exception{
		
		int result = approvalDAO.setApprovalApplication(approvalVO);
		if(result == 1) {
			ApprovalUploadFileVO approvalUploadFileVO = new ApprovalUploadFileVO();
			//결재 승인 번호
			approvalUploadFileVO.setApprovalId(approvalVO.getId());
			approvalUploadFileVO.setName(fileName);
			result = approvalDAO.setApprovalApplicationFileUpload(approvalUploadFileVO);
			if(result == 1) {
				ApprovalHistoryVO approvalHistoryVO = new ApprovalHistoryVO();
				approvalHistoryVO.setMemberId(approvalVO.getMemberId());
				approvalHistoryVO.setApprovalId(approvalVO.getId());
				approvalHistoryVO.setCheck("대기");
				result=approvalDAO.setApprovalApplicationHistory(approvalHistoryVO);
				if(result == 1) {
					List<ApproverVO> ar = approvalDAO.getApprover(approvalVO);
					for(ApproverVO approverVO : ar) {
						ApprovalInfoVO approvalInfoVO = new ApprovalInfoVO();
						//결재 승인 번호
						approvalInfoVO.setApprovalId(approvalVO.getId());
						MemberVO memberVO = approvalDAO.getApprovalInfo(approverVO);
						//결재자 id
						approvalInfoVO.setMemberId(memberVO.getId());
						approvalInfoVO.setCheck("대기");
						result = approvalDAO.setApprovalInfo(approvalInfoVO);
						
					}
				}
			}
		}
		
		return result;
	}
	
	public List<ApprovalVO> getApprovalList(MemberVO memberVO) throws Exception{
		List<ApprovalVO> ar = approvalDAO.getApprovalList(memberVO);
		
		return ar;
	}
	public ApprovalUploadFileVO getApprovalFile(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.getApprovalFile(approvalVO);
	}
	public int setApprovalApproval(MemberVO memberVO,ApprovalVO approvalVO,int approval) throws Exception{
		
		ApprovalHistoryVO approvalHistoryVO = new ApprovalHistoryVO();
		approvalHistoryVO.setMemberId(memberVO.getId());
		approvalHistoryVO.setApprovalId(approvalVO.getId());
		if(approval ==1) {
		approvalHistoryVO.setCheck("승인");
		}else {
			approvalHistoryVO.setCheck("거절");
		}
		
		return 1;
	}
	
	//
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