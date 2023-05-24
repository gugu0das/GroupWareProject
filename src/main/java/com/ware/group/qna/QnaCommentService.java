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
	public QnaCommentVO getQnaCommentDetail(QnaCommentVO qnaCommentVO)throws Exception{
		
		return qnaCommentDAO.getQnaCommentDetail(qnaCommentVO);
	}
	
	
	//reply
	public int setReplyAdd(QnaCommentVO qnaCommentVO)throws Exception{
		
		 QnaCommentVO parent = (QnaCommentVO)qnaCommentDAO.getQnaCommentDetail(qnaCommentVO);
		 //ref :  부모의 ref
		
		 System.out.println(parent);
		 qnaCommentVO.setRef(parent.getRef());
		 //step : 부모의 step+1
		 System.out.println(parent);
		 qnaCommentVO.setStep(parent.getStep()+1);
		 //depth : 부모의 depth+1
		 qnaCommentVO.setDepth(parent.getDepth()+1);
		 //2. Step update
		 int result = qnaCommentDAO.setStepUpdate(parent);
		 //3. 답글 insert
		 result = qnaCommentDAO.setReplyAdd(qnaCommentVO);
		 
		 return result;
		 
	 }
 
	
}
