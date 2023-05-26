package com.ware.group.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ware.group.util.Pager;

@Mapper
public interface QnaCommentDAO {
	
	public Long getTotalCount(Pager pager) throws Exception;
	
	public List<QnaCommentVO> getQnaCommentList(Pager pager) throws Exception;
	
	public int setQnaCommentAdd(QnaCommentVO qnaCommentVO) throws Exception;
	
	public int setQnaCommentUpdate(QnaCommentVO qnaCommentVO) throws Exception;
	
	public int setQnaCommentDelete(QnaCommentVO qnaCommentVO) throws Exception;
	
	//댓글 하나 조회
	public QnaCommentVO getQnaCommentDetail(QnaCommentVO qnaCommentVO) throws Exception;
	
	//REF 댓글
	public  int setStepUpdate(QnaCommentVO qnaCommentVO)throws Exception;
		
	//댓글 더하기
	public int setReplyAdd(QnaCommentVO qnaCommentVO)throws Exception;
	
	
	
}
