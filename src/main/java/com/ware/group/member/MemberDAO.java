package com.ware.group.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	public List<MemberVO> getMembers() throws Exception;
	
	public int setMemberJoin(MemberVO memberVO) throws Exception;
	
}
