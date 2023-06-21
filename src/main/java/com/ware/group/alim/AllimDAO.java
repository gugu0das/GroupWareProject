package com.ware.group.alim;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ware.group.member.MemberVO;

@Mapper
public interface AllimDAO {
	
	public Long getAllimcount(MemberVO memberVO)throws Exception;
	
	public int setAllim(AllimVO allimVO)throws Exception;
	
	public int setUpdateAllim(Long allimId)throws Exception;
	
	public List<AllimVO> getAllim(MemberVO memberVO) throws Exception;
	
	public AllimVO getRecentAllim(MemberVO memberVO) throws Exception;

}
