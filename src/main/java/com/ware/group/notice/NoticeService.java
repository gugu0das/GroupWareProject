package com.ware.group.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ware.group.board.BoardFileVO;

import com.ware.group.util.FileManager;
import com.ware.group.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class NoticeService{

	
	

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;

	@Value("${app.upload.notice}")
	private String path;
	
	public List<NoticeVO> getList(Pager pager) throws Exception {
		pager.makeStartRow();
		
		pager.makeNum(noticeDAO.getTotalCount(pager));
		
		return noticeDAO.getList(pager);
	}

	public NoticeVO getDetail(NoticeVO noticeVO) throws Exception {
		return noticeDAO.getDetail(noticeVO);
		
		
	}

	
	public int setInsert(NoticeVO noticeVO, MultipartFile [] multipartFiles) throws Exception {
		int result = noticeDAO.setInsert(noticeVO);
		
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
					NoticeFileVO noticeFileVO = new NoticeFileVO();
					noticeFileVO.setFileName(fileName);
					noticeFileVO.setOriName(multipartFile.getOriginalFilename());
					noticeFileVO.setNoticeNum(noticeVO.getNoticeNum());
					System.out.println("힘들다");
					result = noticeDAO.setNoticeFileAdd(noticeFileVO);
				}
			}
		}
		
		return result;
	}

	
	public int setUpdate(NoticeVO noticeVO) throws Exception {
		return 0;
	}

	
	public int setDelete(NoticeVO noticeVO) throws Exception {
		return noticeDAO.setDelete(noticeVO);
	}

	
	 
	 public BoardFileVO getFileDetail(BoardFileVO boardFileVO) throws Exception { 
		 return noticeDAO.getFileDetail(boardFileVO); 
		 
	 }
	 // 조회수
	 public int setNoticeHit(NoticeVO noticeVO)throws Exception{
		 return noticeDAO.setNoticeHit(noticeVO);
	 }
	 
	 
}
