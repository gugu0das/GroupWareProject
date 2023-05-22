package com.ware.group.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService implements UserDetailsService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.println("userDetail");
		System.out.println(username);
		MemberVO memberVO = new MemberVO();
		memberVO.setAccountId(username);
		try {
			memberVO = memberDAO.getMemberLogin(memberVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memberVO;
	}


	public MemberVO getMemberProfile(MemberVO memberVO) throws Exception{
		return memberDAO.getMemberProfile(memberVO);
	}

	public List<MemberVO> getMembers()throws Exception{
		return memberDAO.getMembers();
	}

	public int setMemeberJoin(MemberVO memberVO)throws Exception{

		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		int result =memberDAO.setMemberJoin(memberVO);
		
//		role insert하기 
		Map<String, Object> map = new HashMap<>();
		map.put("roleId", 3);
		map.put("memberId", memberVO.getId());

		result =  memberDAO.setMemberRole(map);
		return result;
	}

	public List<JobVO> getJobList()throws Exception{
		return memberDAO.getJobList();

	}
	public MemberVO getMemberLogin(MemberVO memberVO)throws Exception{
		return memberDAO.getMemberLogin(memberVO);
		
	}
	
	public int setMemberUpdate(MemberVO memberVO)throws Exception{
		return memberDAO.setMemberUpdate(memberVO);
	}
	//id중복 검증
	//true면 중복
	public boolean idDuplicateCheck(MemberVO memberVO)throws Exception{

		boolean check = false;
		
		memberVO=memberDAO.idDuplicateCheck(memberVO);
		if(memberVO==null) {
			check=true;
		}
		return check;
		
	}
	
}
