package com.ware.group.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ware.group.board.BoardFileVO;
import com.ware.group.notice.NoticeFileVO;
import com.ware.group.notice.NoticeVO;
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
		
//		Random random = new Random();
//		int num = random.nextInt(1);
//		
//		if(num == 0) {
//			throw new Exception();
//		}
		
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

	
	public int setUpdate(QnaVO qnaVO,MultipartFile multipartFiles) throws Exception {
		return qnaDAO.setUpdate(qnaVO);
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
	 
	//reply Insert
	/*
	 * public int setReplyAdd(QnaVO qnaVO)throws Exception{
	 * 
	 * QnaVO parent = (QnaVO)qnaDAO.getDetail(qnaVO);
	 * 
	 * qnaVO.setRef(parent.getRef());
	 * 
	 * qnaVO.setStep(parent.getStep()+1);
	 * 
	 * qnaVO.setDepth(parent.getDepth()+1);
	 * 
	 * int result = qnaDAO.setStepUpdate(parent);
	 * 
	 * result = qnaDAO.setReplyAdd(qnaVO);
	 * 
	 * return result; }
	 */
	 
		/*
		 * public int setRefUpdate(QnaVO qnaVO)throws Exception{
		 * 
		 * return qnaDAO.setRefUpdate(qnaVO); }
		 */
	 
}
