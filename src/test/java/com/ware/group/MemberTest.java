package com.ware.group;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.properties.PropertyMapping;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;

import com.ware.group.member.MemberDAO;
import com.ware.group.member.MemberVO;

@SpringBootTest
@Rollback(true)
@TestPropertySource(locations = "classpath:application-dev.properties")
public class MemberTest {

	@Autowired
	private MemberDAO memberDAO;
	
//	@Test
	public void getMembers() throws Exception{
		List<MemberVO> ar = memberDAO.getMembers();
		
		assertEquals(0, ar.size());
	}
//	@TES
	public void setMemberJoin()throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setId("ad");
		memberVO.setPassword("asdf");
	}
}
