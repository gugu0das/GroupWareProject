package com.ware.group.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ware.group.board.BoardFileVO;
import com.ware.group.notice.NoticeFileVO;
import com.ware.group.util.FileManager;
import com.ware.group.util.Pager;

@Service
public class QnaService {
		
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${app.upload.qna}")
	private String path;
	
	
	public List<QnaVO> getList(Pager pager) throws Exception {
		pager.makeStartRow();
		
		pager.makeNum(qnaDAO.getTotalCount(pager));
		
		return qnaDAO.getList(pager);
	}
	public QnaVO getDetail(QnaVO qnaVO) throws Exception {
		return qnaDAO.getDetail(qnaVO);
		
		
	}

	
	public int setInsert(QnaVO qnaVO, MultipartFile [] multipartFiles) throws Exception {
		int result = qnaDAO.setInsert(qnaVO);
		
		if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
				
				if(!multipartFile.isEmpty()) {
					String fileName = fileManager.saveFile(path, multipartFile);
					QnaFileVO qnaFileVO = new QnaFileVO();
					qnaFileVO.setFileName(fileName);
					qnaFileVO.setOriName(multipartFile.getOriginalFilename());
					qnaFileVO.setId(qnaVO.getId());
					System.out.println("힘들다");
					result = qnaDAO.setQnaFileAdd(qnaFileVO);
				}
			}
		}
		
		return result;
	}

	
	public int setUpdate(QnaVO qnaVO,MultipartFile [] multipartFiles) throws Exception {
		
		int result =  qnaDAO.setUpdate(qnaVO);
		if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
			
			//1. File을 HDD에 저장 경로
			// Project 경로가 아닌 OS가 이용하는 경로
			/*
			 * String realPath= servletContext.getRealPath("resources/images");
			 * System.out.println(realPath); String fileName =
			 * fileManager.saveFile(realPath, pic);
			 */
	if(!multipartFile.isEmpty()) {
		String fileName = fileManager.saveFile(path, multipartFile);
		QnaFileVO qnaFileVO = new QnaFileVO();
		qnaFileVO.setFileName(fileName);
		qnaFileVO.setOriName(multipartFile.getOriginalFilename());
		qnaFileVO.setId(qnaVO.getId());
	
		result = qnaDAO.setQnaFileAdd(qnaFileVO);
		System.out.println("Service");
		}
	
	 }
   }
		return result;
	}

	
	public int setDelete(QnaVO qnaVO) throws Exception {
		return qnaDAO.setDelete(qnaVO);
	}

	
	 
	 public BoardFileVO getFileDetail(BoardFileVO boardFileVO) throws Exception { 
		 return qnaDAO.getFileDetail(boardFileVO); 
		 
	 }
	 // 조회수
	 public int setQnaHit(QnaVO qnaVO)throws Exception{
		
		 return qnaDAO.setQnaHit(qnaVO);
	 }
	 public Long getCount(QnaVO qnaVO) throws Exception{
		 return qnaDAO.getCount(qnaVO);
		 
		 }
	 
}
