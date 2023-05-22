package com.ware.group.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ware.group.approval.MemberVO;
import com.ware.group.approval3.DepartmentVO;
import com.ware.group.approval3.JobVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional(rollbackFor=Exception.class)
@Slf4j
public class ApprovalService {
	
	@Autowired
	private ApprovalDAO approvalDAO;
	
	public int setApprovalApplication(ApprovalVO approvalVO,String fileName) throws Exception{
		  System.out.println("=========================4=====================");
		log.error("들어옴");
		log.error("들어와");
		int result = approvalDAO.setApprovalApplication(approvalVO);
		int pendig = 0;
		if(result == 1) {
			ApprovalUploadFileVO approvalUploadFileVO = new ApprovalUploadFileVO();
			//결재 승인 번호
			//대기 하나 승인중 하나 씩 history 저장
			approvalUploadFileVO.setApprovalId(approvalVO.getId());
			approvalUploadFileVO.setName(fileName);
			result = approvalDAO.setApprovalApplicationFileUpload(approvalUploadFileVO);
			if(result == 1) {
				ApprovalHistoryVO approvalHistoryVO = new ApprovalHistoryVO();
				approvalHistoryVO.setMemberId(approvalVO.getMemberId());
				approvalHistoryVO.setApprovalId(approvalVO.getId());
				approvalHistoryVO.setCheck(ApprovalStatus.PENDING);
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
						approvalInfoVO.setCheck(ApprovalStatus.APPROVALING);
						approvalInfoVO.setDepth(approverVO.getDepth());
						log.error("{}::::::::",approverVO.getDepth());
						log.error("{}::::::::",approverVO.getDepth());
						log.error("{}::::::::",approverVO.getDepth());
						System.out.println(approverVO.getDepth());
						if(pendig >0) {
							approvalInfoVO.setCheck(ApprovalStatus.PENDING);
						}
						pendig++;
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
		int result;
		ApprovalHistoryVO approvalHistoryVO = new ApprovalHistoryVO();
		approvalHistoryVO.setMemberId(memberVO.getId());
		approvalHistoryVO.setApprovalId(approvalVO.getId());
		ApprovalInfoVO approvalInfoVO = new ApprovalInfoVO();
		if(approval ==1) {
		approvalHistoryVO.setCheck(ApprovalStatus.APPROVAL);
		//대기/승인 대입
				approvalInfoVO.setCheck(ApprovalStatus.APPROVAL);
				//결재 번호 대입
				approvalInfoVO.setApprovalId(approvalVO.getId());
				//회원 id  대입
				approvalInfoVO.setMemberId(memberVO.getId());
				result = approvalDAO.setInfoUpdate(approvalInfoVO);
				approvalInfoVO=approvalDAO.getInfoDetail(approvalInfoVO);
				approvalInfoVO.setDepth(approvalInfoVO.getDepth()+1);
				approvalInfoVO=approvalDAO.getInfoList(approvalInfoVO);
				
				if(approvalInfoVO != null) {
					approvalInfoVO.setCheck(ApprovalStatus.APPROVALING);
					result = approvalDAO.setInfoUpdate(approvalInfoVO);
					approvalHistoryVO.setMemberId(approvalInfoVO.getMemberId());
					approvalHistoryVO.setCheck(ApprovalStatus.APPROVALING);
					result=approvalDAO.setApprovalApplicationHistory(approvalHistoryVO);
				}
		}else {
			approvalHistoryVO.setCheck(ApprovalStatus.REFUSE);
			approvalInfoVO.setCheck(ApprovalStatus.REFUSE);
			approvalInfoVO.setApprovalId(approvalVO.getId());
			approvalInfoVO.setMemberId(memberVO.getId());
			result = approvalDAO.setInfoUpdate(approvalInfoVO);
		}
		
		result=approvalDAO.setApprovalApplicationHistory(approvalHistoryVO);
		
		
		
		
		
		
		return result;
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
