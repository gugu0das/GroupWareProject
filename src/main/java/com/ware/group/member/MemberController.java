package com.ware.group.member;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.annual.AnnualVO;
import com.ware.group.common.CommonVO;
import com.ware.group.common.ScheduleService;
import com.ware.group.common.Util4calen;
import com.ware.group.department.DepartmentService;
import com.ware.group.department.DepartmentVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member/*")
@Slf4j
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ScheduleService employeeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private MemberDAO memberDAO;
	
	
	CommonVO commonVO = new CommonVO();

	@GetMapping("memberList")
	public ModelAndView getMemeberList(ModelAndView mv, MemberVO memberVO, HttpSession session)throws Exception{
		List<MemberVO> ar = memberService.getMemberList();
		memberVO = memberService.getSessionAttribute(session);
		mv.addObject("memberVO", memberVO);
		
		mv.addObject("memberVOs", ar);
		return mv;
	}
	
	@GetMapping("join")
	public ModelAndView setMemberJoin(@ModelAttribute MemberVO memberVO, ModelAndView mv)throws Exception{
		
		List<DepartmentVO> departmentVOs =   departmentService.getDepartmentList();
		List<JobVO> jobVOs = memberService.getJobList();
		mv.addObject("jobVOs", jobVOs);
		mv.addObject("departmentVOs", departmentVOs);
		
		mv.setViewName("member/join");
		return mv;
		
	}
	
	@PostMapping("join")
	public ModelAndView setMemberJoin(ModelAndView mv, @Valid MemberVO memberVO, BindingResult bindingResult,WorkTimeVO workTimeVO)throws Exception{

		boolean check  = memberService.pwCheck(memberVO, bindingResult);
		if(check) {
			
			mv.setViewName("member/join");
			
			return mv; 
		}
		int result = memberService.setMemeberJoin(memberVO,bindingResult, workTimeVO);
		
		commonVO.setMsg("계정을 생성할 수 없습니다.");
		commonVO.setUrl("/member/join");
		commonVO.setTextMsg("다시 확인해주세요.");
		if(result>0) {
			commonVO.setMsg("계정을 생성하였습니다.");
			commonVO.setTextMsg("");
		}
		mv.addObject("commonVO",commonVO);
		mv.addObject("result", result);
		mv.setViewName("member/memberAlert");
		
		
		return mv;
	}
 
	@PostMapping("jobDelete")
	@ResponseBody
	public int setJobDelete(JobVO jobVO)throws Exception{
		return memberService.setJobDelete(jobVO);
		
	}
	@GetMapping("login")
	public ModelAndView getLogin(ModelAndView mv, HttpSession session)throws Exception{
	
		MemberVO memberVO = memberService.getSessionAttribute(session);
		if(memberVO!=null) {
			int result = 0;
			commonVO.setMsg("로그아웃 후 이용해주세요.");
			commonVO.setUrl("/");
			mv.addObject("commonVO",commonVO);
			mv.addObject("result", result);
			mv.setViewName("member/memberAlert");
			return mv;
		}
		mv.setViewName("/member/login");
		return mv;
	}
	@GetMapping("update")
	public ModelAndView setMemberUpdate(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO =memberService.getMemberDetail(memberVO);
		List<DepartmentVO> departmentVOs =   departmentService.getDepartmentList();
		List<JobVO> jobVOs = memberService.getJobList();
 
		List<EmployeeStatusVO> employeeStatusVOs =  memberService.getEmployeeStatusList(memberVO);
		
		mv.addObject("employeeStatusVOs", employeeStatusVOs);
		mv.addObject("jobVOs", jobVOs);
		mv.addObject("departmentVOs", departmentVOs);
		mv.addObject("memberVO", memberVO);
		mv.setViewName("member/update");
		return mv;
	}
	@PostMapping("update")
	public ModelAndView setMemberUpdate(ModelAndView mv, MemberVO memberVO)throws Exception{
		int result = memberService.setMemberUpdate(memberVO);	
		commonVO.setMsg("계정을 수정할 수 없습니다.");
		commonVO.setUrl("/member/profile");
		commonVO.setTextMsg("다시 확인해주세요.");
		if(result>0) {
			commonVO.setMsg("계정을 수정하였습니다.");
			commonVO.setTextMsg("다시 로그인해주세요");
			commonVO.setUrl("/member/logout");
			commonVO.setTextMsg("");
		}
		mv.addObject("commonVO",commonVO);
		mv.addObject("result", result);
		mv.setViewName("member/memberAlert");

		return mv;
	}
	
	@GetMapping("profile")
	public ModelAndView getProfile(@ModelAttribute MemberVO memberVO, ModelAndView mv,HttpSession session)throws Exception{

		memberVO = memberService.getMemberProfile(memberVO, session);
		
		mv.addObject("memberVO", memberVO);
		mv.setViewName("member/profile");
		return mv;
		
	}
	@PostMapping("memberProfileAdd")
	public ModelAndView setProfile(ModelAndView mv,MemberProfileVO memberProfileVO,HttpSession session,MultipartFile file)throws Exception{
		
		int result =memberService.setProfileAdd(memberProfileVO, session, file);
		
		
		commonVO.setMsg("프로필을 변경할 수 없습니다.");
		commonVO.setUrl("/member/profile");
		
		commonVO.setTextMsg("");
		if(result>0) {
			commonVO.setMsg("프로필을 변경하였습니다.");
			
		}
		

		mv.addObject("commonVO",commonVO);
		mv.addObject("result", result);
		mv.setViewName("member/memberAlert");
		return mv;
	}
	
	 
	@GetMapping("detail")
	public ModelAndView getMemberDetail(@ModelAttribute MemberVO memberVO,ModelAndView mv)throws Exception{
		
		memberVO = memberService.getMemberDetail(memberVO);
		mv.addObject("memberVO", memberVO);
		mv.setViewName("member/memberDetailResult");
		return mv;
	}
	@GetMapping("leaveRecode")
	public ModelAndView getLeaveRecode(ModelAndView mv,MemberVO memberVO,HttpSession session,AnnualVO annualVO)throws Exception{
		
		memberVO = memberService.getMemberDetail(memberService.getSessionAttribute(session));
		mv.addObject("memberVO",memberVO);
		
		
		return mv;
	}
	
	@GetMapping("security")
	public ModelAndView getSecurity(@ModelAttribute MemberVO memberVO, ModelAndView mv,HttpSession session)throws Exception{

		memberVO = memberService.getMemberProfile(memberVO, session);
		
		mv.addObject("memberVO", memberVO);
		mv.setViewName("member/security");
		return mv;
	}
	
	@PostMapping("security")
	public ModelAndView setPasswordUpdate(ModelAndView mv, MemberVO memberVO,HttpSession session)throws Exception{
		

		int result  = memberService.setPasswordUpdate(memberVO,session);
		
		commonVO.setMsg("비밀번호를 변경할 수 없습니다.");
		commonVO.setUrl("/member/security");
		commonVO.setTextMsg("다시 확인해주세요.");
		if(result>0) {
			commonVO.setMsg("비밀번호를 변경하였습니다.");
			commonVO.setTextMsg("다시 로그인해주세요.");
			commonVO.setUrl("/member/logout");
		}
		mv.addObject("commonVO",commonVO);
		mv.addObject("result", result);
		mv.setViewName("member/memberAlert");
		
		return mv;
	}
	@GetMapping("beforePwCheck")
	@ResponseBody
	public boolean getBeforePwCheck(MemberVO memberVO)throws Exception{
		return memberService.pwCheck(memberVO);
	}
 
	@GetMapping("idDuplicateCheck")
	@ResponseBody
	public boolean idDuplicateCheck(MemberVO memberVO)throws Exception{
		
		boolean check = memberService.joinCheck(memberVO);

		return check;
		
	}
	@GetMapping("idDuplicateCheckAccount")
	@ResponseBody
	public boolean idDuplicateCheckAccount(MemberVO memberVO)throws Exception{
		
		boolean check = memberService.idDuplicateCheck(memberVO);

		return check;
		
	}
	 

	@PostMapping("statusUpdate")
	public ModelAndView employeeStatusUpdate(ModelAndView mv,MemberVO memberVO,EmployeeStatusVO employeeStatusVO,HttpSession session,String timeStatus,WorkTimeVO workTimeVO)throws Exception{
		employeeStatusVO.setStatus(timeStatus);
		int result =  memberService.setStatusUpdate(memberVO, employeeStatusVO,workTimeVO, session);
		
		mv.setViewName("redirect:/");
		return mv;
	}
	@PostMapping("testStatusUp")
	public void testStatusUp(ModelAndView mv,MemberVO memberVO, HttpSession session, EmployeeStatusVO employeeStatusVO) throws Exception{
		int result = employeeService.testTimeStempInsert(memberVO, employeeStatusVO, session);
		
	}
	@GetMapping("statusList")
	public ModelAndView getStatusList(ModelAndView mv,MemberVO memberVO, HttpSession session, EmployeeStatusVO employeeStatusVO,WorkTimeVO workTimeVO)throws Exception{
		
		 
		 
		memberVO = memberService.getMemberProfile(memberVO, session);
		mv.addObject("memberVO",memberVO);
		 
		employeeStatusVO =  memberService.getEmployeeStatus(session);
		mv.addObject("employeeVO", employeeStatusVO);
		 
		List<String> ar = memberService.getEmployeeStatusBtn(employeeStatusVO, session);
		if(ar!=null&&ar.size()>0) {
			
			mv.addObject("btns",ar);
		}
		mv.setViewName("member/statusList");
		
//		if(employeeStatusVO==null) {
//			return mv;
//		}
		List<EmployeeStatusVO> employeeStatusVOs = memberService.getEmployeeStatusList(employeeStatusVO, session);
		 
		List<String> years = memberService.getEmployeeStatusYears(employeeStatusVOs);
		mv.addObject("years",years);
		
		 
		List<WorkTimeStatusVO> workTimeStatusVOs =  memberService.getWorkTimeStatusTotal(workTimeVO,employeeStatusVO, session);
		mv.addObject("workTimeStatusVOs",workTimeStatusVOs);
		
		return mv;
	}
	@GetMapping("testData")
	public void sampleData(MemberVO memberVO,HttpSession session) throws Exception{
		memberVO=memberService.getSessionAttribute(session);
		for(int i= 1; i<31; i++) {
			EmployeeStatusVO employeeStatusVO = new EmployeeStatusVO();
			employeeStatusVO.setMemberId(memberVO.getId());
			LocalDate localDate = LocalDate.of(2023, 4, i);
			
			
			Date date = Util4calen.setLocalDateToDate(localDate);
			if(date.getDay()==0||date.getDay()==6) {
				continue;
			}
			employeeStatusVO.setReg(date);
			Time startTime = new Time(9, 0, 0);
			Time finishTime = new Time(18, 0, 0);
			
			employeeStatusVO.setOnTime(Util4calen.getStatusTime(startTime, date));
			employeeStatusVO.setOffTime(Util4calen.getStatusTime(finishTime, date));
			employeeStatusVO.setStatus("퇴근");
			memberDAO.sampleData(employeeStatusVO);
		}
	}

}
