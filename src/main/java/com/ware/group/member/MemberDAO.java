package com.ware.group.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface MemberDAO {

	public List<MemberVO> getMembers() throws Exception;
	
	public int setMemberJoin(MemberVO memberVO) throws Exception;
	
	public List<JobVO> getJobList()throws Exception;
	
	public MemberVO idDuplicateCheck(MemberVO memberVO)throws Exception;
	
	public MemberVO getMemberLogin(MemberVO memberVO)throws Exception;
	
	public int setMemberRole(Map<String, Object> map)throws Exception;
	
	public MemberVO getMemberProfile(MemberVO memberVO)throws Exception;
	
	public int setMemberUpdate(MemberVO memberVO) throws Exception;
	
	public int setPasswordUpdate(MemberVO memberVO)throws Exception;
}
