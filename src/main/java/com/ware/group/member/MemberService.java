package com.ware.group.member;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.ware.group.common.Util4calen;

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

	//session에 있는 Member정보의 일부분 받기
	public MemberVO getSessionAttribute(HttpSession session)throws Exception{
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		//id,accountID
		return memberVO;
	}

	//profile
	public MemberVO getMemberProfile(MemberVO memberVO, HttpSession session) throws Exception{

		memberVO = this.getSessionAttribute(session);

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

	//password change
	public int setPasswordUpdate(MemberVO memberVO,HttpSession session,BindingResult bindingResult)throws Exception{
		int result = 0; 
		//1. session Memeber 꺼내기
		memberVO.setAccountId(this.getSessionAttribute(session).getAccountId());
		
		//2, pw체크
		boolean check = this.pwCheck(memberVO);
		if(!check) {//false면 pw두개가 같음
			memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));

			result =  memberDAO.setPasswordUpdate(memberVO);//false일때 비번 변경

			//			bindingResult.rejectValue("passwordCheck", "member.password.notEqual");

		}
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
	// 검증----------------------------------------------------------------
	// id중복   true면 중복
	public boolean idDuplicateCheck(MemberVO memberVO)throws Exception{

		boolean check = false;

		memberVO=memberDAO.idDuplicateCheck(memberVO);
		if(memberVO==null) {
			check=true;
		}
		return check;

	}
	//pw체크 pw두개가 같으면 false 다르면 true
	public boolean pwCheck(MemberVO memberVO)throws Exception{
		boolean check = false;
		if(!memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
			check= true;
		}
		return check;
	}
	//검증 END------------------------------------------------

	//	EmployeeStatus 근태관련
	//	근태조회
	public EmployeeStatusVO getEmployeeStatus(HttpSession session)throws Exception{

		EmployeeStatusVO employeeStatusVO = new EmployeeStatusVO();
		
		employeeStatusVO.setMemberId(this.getSessionAttribute(session).getId());
		
		employeeStatusVO=memberDAO.getEmployeeStatus(employeeStatusVO);
		if(employeeStatusVO==null) {
			return null;
		}
		return employeeStatusVO;

	}
	//근태 업데이트
	public int setStatusUpdate(MemberVO memberVO, EmployeeStatusVO employeeStatusVO, HttpSession session)throws Exception{
		int result =0;

//		employeeStatusVO.setMemberId(this.getSessionAttribute(session).getId());
		//1. 빈테이블이면 출근버튼만 활성화
		//2. 근무시간이 초과하면 알아서 
		//3. 근무시간 초과 전에 버튼 누르면 외출, 조퇴 로 status='외출','조퇴'받음
		//4. if 조퇴 = 그상태로 status 조퇴로 끝
		
		//		---외출X 회사에선 외출개념이 아니라 외근느낌
		//
		//--------------------------------------------------------------

		//DB status에 나오는 것 : 초과근무, 외근, 조퇴   
		//퇴근버튼은 없는걸로
		//1.form 에서 받아온 status : 외근인지, 조퇴인지
		String getstatus = employeeStatusVO.getStatus();

		
		//현재시간
		Timestamp nowTime = Util4calen.getNowTime();
		
		// 현재 있는 근태 가져오기(오늘날짜)
		employeeStatusVO = this.getEmployeeStatus(session);
		EmployeeStatusVO defaultWork=memberDAO.getDefaultWork(employeeStatusVO);
		if(employeeStatusVO==null) {
			return 0;
		}
		

		// 1. 출근 안했을시 
		if(employeeStatusVO.getOnTime()==null) {
			
			employeeStatusVO.setOnTime(nowTime);
			Long diffTime = Util4calen.TimeDiff(nowTime,defaultWork.getOnTime());
			if(diffTime>10) {//기본시간보다 10분이 지나면
				employeeStatusVO.setStatus("지각");
			}
			else {
				employeeStatusVO.setStatus(getstatus);
			}
			
		}
		//2. 출근상태일때
		else {
			
			Long diffTime = Util4calen.TimeDiff(nowTime,defaultWork.getOffTime());

			employeeStatusVO.setOffTime(nowTime);	
			if(diffTime<0||diffTime>60) {//근무시간을 지나지 않았을때 혹은 근무시간이 지나고 1시간이 지났을때
				employeeStatusVO.setStatus(getstatus);
			}

			if(getstatus.equals("외근")) {//외근은 정상퇴근
				employeeStatusVO.setOffTime(Util4calen.getStatusTime(defaultWork.getOffTime(), employeeStatusVO.getReg()));
			}
		}
		
		result = memberDAO.setEmployeeStatusUpdate(employeeStatusVO);


		return result;
	}

	//	근태 버튼 생성
	public List<String> getEmployeeStatusBtn(EmployeeStatusVO employeeStatusVO, HttpSession session)throws Exception{
		
		//근무할 시간 가져오기(기본 근무시간)
		EmployeeStatusVO defaultWork=memberDAO.getDefaultWork(employeeStatusVO);

		employeeStatusVO =this.getEmployeeStatus(session);
		if(employeeStatusVO==null) {
			return null;
		}
		Timestamp nowTime = Util4calen.getNowTime();
		List<String> ar = new ArrayList<>();
		// 1. 출근 안했을시 
		if(employeeStatusVO.getOnTime()==null) {
			
			ar.add("출근");
		}
		//2. 출근상태일때
		else if(employeeStatusVO.getOffTime()==null){
			Long diffTime = Util4calen.TimeDiff(nowTime,defaultWork.getOffTime());
			
			if(diffTime<0) {//근무시간을 지나지 않았을때 혹은 근무시간이 지나고 1시간이 지났을때
				ar.add("조퇴");
				ar.add("외근");
			}
			else if(diffTime>60){
				ar.add("초과근무");
			}
			else {
				ar.add("퇴근");
			}
		}
		return ar;

	}

	
}
