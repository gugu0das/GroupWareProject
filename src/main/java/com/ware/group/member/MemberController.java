package com.ware.group.member;

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
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.common.ScheduleService;
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
	public ModelAndView setMemberJoin(ModelAndView mv, @Valid MemberVO memberVO, BindingResult bindingResult)throws Exception{

		int result = memberService.setMemeberJoin(memberVO);
		
		
		mv.setViewName("redirect:/");
		return mv;
	}
//	
	@GetMapping("login")
	public ModelAndView getLogin(ModelAndView mv, HttpSession session)throws Exception{
		
		mv.setViewName("member/login");
		return mv;
		
	}
	
	@PostMapping("update")
	public ModelAndView setMemberUpdate(ModelAndView mv, MemberVO memberVO)throws Exception{
		int result = memberService.setMemberUpdate(memberVO);
		
		mv.setViewName("redirect:/member/logout");
		return mv;
	}
	
	@GetMapping("profile")
	public ModelAndView getProfile(@ModelAttribute MemberVO memberVO, ModelAndView mv,HttpSession session)throws Exception{

		memberVO = memberService.getMemberProfile(memberVO, session);
		
		mv.addObject("memberVO", memberVO);
		mv.setViewName("member/profile");
		return mv;
		
	}
	@GetMapping("security")
	public ModelAndView getSecurity(@ModelAttribute MemberVO memberVO, ModelAndView mv)throws Exception{
		
		mv.setViewName("member/security");
		return mv;
	}
	
	@PostMapping("security")
	public ModelAndView setPasswordUpdate(ModelAndView mv, MemberVO memberVO,HttpSession session, BindingResult bindingResult)throws Exception{
		
//		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
//		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
//		MemberVO memberVO2 =(MemberVO)contextImpl.getAuthentication().getPrincipal(); 
//		memberVO.setId(memberVO2.getId());
		memberService.setPasswordUpdate(memberVO,session, bindingResult);
		mv.setViewName("redirect:/member/logout");
		return mv;
	}
	
//	-------------검증------------------------------------------
	@GetMapping("idDuplicateCheck")
	@ResponseBody
	public boolean idDuplicateCheck(MemberVO memberVO)throws Exception{
		boolean check;
		check = memberService.idDuplicateCheck(memberVO);

		return check;
		
	}
	//
	
	@PostMapping("statusUpdate")
	public ModelAndView employeeStatusUpdate(ModelAndView mv,MemberVO memberVO,EmployeeStatusVO employeeStatusVO,HttpSession session,String timeStatus)throws Exception{
		employeeStatusVO.setStatus(timeStatus);
		int result =  memberService.setStatusUpdate(memberVO, employeeStatusVO, session);
		
		mv.setViewName("redirect:/");
		return mv;
	}
	@PostMapping("testStatusUp")
	public void testStatusUp(ModelAndView mv,MemberVO memberVO, HttpSession session, EmployeeStatusVO employeeStatusVO) throws Exception{
		int result = employeeService.testTimeStempInsert(memberVO, employeeStatusVO, session);
		
	}
	
}
