package com.ware.group.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ware.group.util.Pager;

@Service
public class QnaCommentService {
	
	@Autowired
	private QnaCommentDAO qnaCommentDAO;
	
	public List<QnaCommentVO> getQnaCommentList(Pager pager) throws Exception {
		pager.makeStartRow();
		
		pager.makeNum(qnaCommentDAO.getTotalCount(pager));
		
		return qnaCommentDAO.getQnaCommentList(pager);
	}
	
	public int setQnaCommentAdd(QnaCommentVO qnaCommentVO,MultipartFile[] multipartFiles,HttpSession session) throws Exception {
		return qnaCommentDAO.setQnaCommentAdd(qnaCommentVO);
	}
	
	public int setQnaCommentUpdate(QnaCommentVO qnaCommentVO) throws Exception {
		return qnaCommentDAO.setQnaCommentUpdate(qnaCommentVO);
	}
	
	public int setQnaCommentDelete(QnaCommentVO qnaCommentVO, HttpSession session) throws Exception {
		return qnaCommentDAO.setQnaCommentDelete(qnaCommentVO);
	}
	
	
}
