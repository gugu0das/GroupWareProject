package com.ware.group.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ware.group.util.Pager;



@Mapper
public interface QnaDAO {
	
	//글 갯수
	public Long getTotalCount(Pager pager) throws Exception;
	
	// 글조회
	public List<QnaVO> getList(Pager pager) throws Exception;
	
	// 글 하나 조회
	public QnaVO getDetail(QnaVO qnaVO) throws Exception;
	
}
