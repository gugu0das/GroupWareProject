package com.ware.group.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ware.group.board.BoardFileVO;
import com.ware.group.notice.NoticeFileVO;
import com.ware.group.notice.NoticeVO;
import com.ware.group.util.Pager;



@Mapper
public interface QnaDAO {
	
	//글 갯수
	public Long getTotalCount(Pager pager) throws Exception;
	
	// 글조회
	public List<QnaVO> getList(Pager pager) throws Exception;
	
	// 글 하나 조회
	public QnaVO getDetail(QnaVO qnaVO) throws Exception;
	
	// 글쓰기
	public int setInsert(QnaVO qnaVO) throws Exception;
	
	// 글수정
	public int setUpdate(QnaVO qnaVO) throws Exception;
	
	// 글삭제
	public int setDelete(QnaVO qnaVO) throws Exception;
	
	// 파일 등록
	public int setQnaFileAdd(QnaFileVO qnaFileVO) throws Exception;
	
	// 파일조회
	public BoardFileVO getFileDetail(BoardFileVO boardFileVO) throws Exception;
	
	// 조회수
	public int setQnaHit(QnaVO qnaVO) throws Exception;
	
	public Long getCount(QnaVO qnaVO) throws Exception;
	
	//사진 파일삭제
	public int setFileDelete(QnaVO qnaVO) throws Exception;
}
