package com.ware.group.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ware.group.board.BoardFileVO;
import com.ware.group.util.Pager;



@Mapper
public interface NoticeDAO {
		
	
	// 글갯수
		public Long getTotalCount(Pager pager) throws Exception;
		
		// 글조회
		public List<NoticeVO> getList(Pager pager) throws Exception;
		
		// 글 하나 조회
		public NoticeVO getDetail(NoticeVO noticeVO) throws Exception;
		
		// 글쓰기
		public int setInsert(NoticeVO noticeVO) throws Exception;
		
		// 글수정
		public int setUpdate(NoticeVO noticeVO) throws Exception;
		
		// 글삭제
		public int setDelete(NoticeVO noticeVO) throws Exception;
		
		// 파일 등록
		public int setNoticeFileAdd(NoticeFileVO noticeFileVO) throws Exception;
		
		// 파일조회
		public BoardFileVO getFileDetail(BoardFileVO boardFileVO) throws Exception;
		
		// 조회수
		public int setNoticeHit(NoticeVO noticeVO) throws Exception;
		
		// 중요글 맨위 상단으로 올리고 색변화
		/*
		 * public List<NoticeVO> getImportantList(NoticeVO noticeVO) throws Exception;
		 */
		
		public List<NoticeFileVO> getFileList(NoticeVO noticeVO) throws Exception;
		//파일 삭제
		public int setFileDelete(NoticeVO noticeVO)throws Exception;
}
