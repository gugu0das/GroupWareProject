package com.ware.group.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ware.group.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class NoticeService{

	
	public int setInsert(NoticeVO noticeVO, MultipartFile[] multipartFiles) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Autowired
	private NoticeDAO noticeDAO;
	
	//@Autowired
	//private FileManager fileManager;

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

	//@Override
	//public int setInsert(BoardVO boardVO, MultipartFile [] multipartFiles) throws Exception {
		//int result = noticeDAO.setInsert(boardVO);
		
//		Random random = new Random();
//		int num = random.nextInt(1);
//		
//		if(num == 0) {
//			throw new Exception();
//		}
		
	/*	if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
				if(!multipartFile.isEmpty()) {
					String fileName = fileManager.saveFile(path, multipartFile);
					BoardFileVO boardFileVO = new BoardFileVO();
					boardFileVO.setFileName(fileName);
					boardFileVO.setOriName(multipartFile.getOriginalFilename());
					boardFileVO.setNum(boardVO.getNum());
					
					result = noticeDAO.setBoardFileAdd(boardFileVO);
				}
			}
		}
		
		return result;
	}*/

	
	public int setUpdate(NoticeVO noticeVO) throws Exception {
		return 0;
	}

	
	public int setDelete(NoticeVO noticeVO) throws Exception {
		return noticeDAO.setDelete(noticeVO);
	}

	/*
	 * @Override public BoardFileVO getFileDetail(BoardFileVO boardFileVO) throws
	 * Exception { return noticeDAO.getFileDetail(boardFileVO); }
	 */
}
