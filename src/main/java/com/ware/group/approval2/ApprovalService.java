package com.ware.group.approval2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor=Exception.class)
public class ApprovalService {
	
	@Autowired
	private ApprovalDAO approvalDAO;
	
	public int setApprovalApplication(ApprovalVO approvalVO,String fileName) {
		
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
}
