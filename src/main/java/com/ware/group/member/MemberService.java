package com.ware.group.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public List<MemberVO> getMembers()throws Exception{
		return memberDAO.getMembers();
	}
	
	public int setMemeberJoin(MemberVO memberVO)throws Exception{
		int result =memberDAO.setMemberJoin(memberVO);
		return result;
	}
	
}
