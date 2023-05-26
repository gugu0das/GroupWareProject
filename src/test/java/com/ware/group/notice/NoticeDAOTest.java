package com.ware.group.notice;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;



@SpringBootTest
public class NoticeDAOTest {
		
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Test
	void setInsertTest()throws Exception{
		for(int i=0;i<120;i++) {
			NoticeVO noticeVO  = new NoticeVO();
			
			noticeVO.setWriter("iu"+i);
			noticeVO.setTitle("Insert Test"+i);
			noticeVO.setContents("Insert Test"+i);
			
			int result = noticeDAO.setInsert(noticeVO);
			if(i%10==0) {
				Thread.sleep(500);
			}
		}
		System.out.println("종료");
	}
}
