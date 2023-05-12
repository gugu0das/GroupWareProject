package com.ware.group.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

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
}
