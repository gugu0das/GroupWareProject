package com.ware.group.qna;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ware.group.alim.AllimDAO;
import com.ware.group.alim.AllimVO;
import com.ware.group.member.MemberVO;
import com.ware.group.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaCommentService {
	
	@Autowired
	private QnaCommentDAO qnaCommentDAO;
	
	@Autowired 
	private AllimDAO allimDAO;
	@Autowired
	private QnaDAO qnaDAO;
	

	public List<QnaCommentVO> getQnaCommentList(Pager pager) throws Exception {
		pager.makeStartRow();
		
		pager.makeNum(qnaCommentDAO.getTotalCount(pager));
		
		return qnaCommentDAO.getQnaCommentList(pager);
	}
	
	
	
	//그냥 댓글
	public List<Integer> setQnaCommentAdd(QnaCommentVO qnaCommentVO,MultipartFile[] multipartFiles,HttpSession session) throws Exception {
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
	    MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
	    
	    
	    QnaVO qnaVO = new QnaVO();
	    List<Integer> al = new ArrayList<>();
	    
	    qnaCommentVO.setWriter(memberVO.getAccountId());
	    int result = qnaCommentDAO.setQnaCommentAdd(qnaCommentVO);
	   
	    
	    
	    qnaVO.setId(qnaCommentVO.getQnaId());
	    qnaVO =qnaDAO.getDetail(qnaVO);
		
		

		AllimVO allimVO = new AllimVO();
		allimVO.setMemberId(qnaVO.getMemberId());
		allimVO.setQnaId(qnaCommentVO.getQnaId());
		allimVO.setType(3);
		result = allimDAO.setAllim(allimVO);
		al.add(result);
		al.add(qnaVO.getMemberId().intValue());
		return al;
		
	}
	
	public int setQnaCommentUpdate(QnaCommentVO qnaCommentVO) throws Exception {
		return qnaCommentDAO.setQnaCommentUpdate(qnaCommentVO);
	}
	//댓글 삭제시 대댓글도 같이 삭제됨
	public int setQnaCommentDelete(QnaCommentVO qnaCommentVO, HttpSession session) throws Exception {
		
		qnaCommentDAO.setQnaCommentDeleteDelete(qnaCommentVO);
		return qnaCommentDAO.setQnaCommentDelete(qnaCommentVO);
	}
	public QnaCommentVO getQnaCommentDetail(QnaCommentVO qnaCommentVO)throws Exception{
		
		return qnaCommentDAO.getQnaCommentDetail(qnaCommentVO);
	}
	
	
	//reply 대댓글
	public int setReplyAdd(QnaCommentVO qnaCommentVO,HttpSession session)throws Exception{
		
		 QnaCommentVO parent = (QnaCommentVO)qnaCommentDAO.getQnaCommentDetail(qnaCommentVO);
		 //ref :  부모의 ref
		 qnaCommentVO.setQnaId(parent.getQnaId());
		 System.out.println(parent);//여기부분에서 에러 발생
		 qnaCommentVO.setRef(parent.getId());
		 //step : 부모의 step+1
		 
		 if(parent.getStep() !=0) {
		 qnaCommentVO.setStep(parent.getStep()+1);
		 }else {
			 qnaCommentVO.setStep(parent.getStep()+1);
		 }
		 //depth : 부모의 depth+1
		 qnaCommentVO.setDepth(parent.getDepth()+1);
		 //2. Step update
		 int result = qnaCommentDAO.setStepUpdate(parent);
		 //3. 답글 insert
		 result = qnaCommentDAO.setReplyAdd(qnaCommentVO);
		 
		 Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		 SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		 MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		 
		    QnaVO qnaVO = new QnaVO();
		    qnaVO.setId(qnaCommentVO.getQnaId());
		    qnaVO =qnaDAO.getDetail(qnaVO);
			qnaCommentVO.setWriter(memberVO.getAccountId());
			

			AllimVO allimVO = new AllimVO();
			allimVO.setMemberId(parent.getMemberVO().getId());
			allimVO.setQnaId(qnaCommentVO.getQnaId());
			
			allimVO.setType(4);
			result =allimDAO.setAllim(allimVO);
			if(result >0){
				result = parent.getMemberVO().getId().intValue();
			}
			
		 return result;
		 
	 }
 
	
}
