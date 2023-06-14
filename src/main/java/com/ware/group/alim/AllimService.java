package com.ware.group.alim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ware.group.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional(rollbackFor=Exception.class)
@Slf4j
public class AllimService {
	
	@Autowired
	public AllimDAO allimDAO;
	
	
	public Long getAllimcount(MemberVO memberVO)throws Exception{
		return allimDAO.getAllimcount(memberVO);
	}
	public int setAllim(AllimVO allimVO)throws Exception{
		return allimDAO.setAllim(allimVO);
	}
	public int setUpdateAllim(Long allimId)throws Exception{
		return allimDAO.setUpdateAllim(allimId);
	}
	public List<AllimVO> getAllim(MemberVO memberVO) throws Exception{
		return allimDAO.getAllim(memberVO);
	}
}
