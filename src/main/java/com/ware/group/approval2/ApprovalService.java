package com.ware.group.approval2;

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
			approvalUploadFileVO.setApprovalId(approvalVO.getId());
			approvalUploadFileVO.setName(fileName);
			result = approvalDAO.setApprovalApplicationFileUpload(approvalUploadFileVO);
		}
		
		return result;
	}
}
