package com.ware.group.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.CommonAnnotationBeanPostProcessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.annual.LeaveRecordVO;
import com.ware.group.common.CommonVO;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	
	@Autowired
	private MemberService memberService;
	
	
	@PostMapping("jobAdd")
	public ModelAndView jobAdd(JobVO jobVO,ModelAndView mv)throws Exception{
		int result = memberService.setJobAdd(jobVO);
		CommonVO.msg="실패";
		if(result>0) {
			CommonVO.msg = "성공";
			CommonVO.url="/department/add";
		}
		mv.addObject("url", CommonVO.url);
		mv.addObject("msg", CommonVO.msg);
		mv.addObject("result", result);
		mv.setViewName("common/alert");
		return mv;
	}
	//1.memberUpdate
	@PostMapping("memberUpdate")
	public ModelAndView memberUpdate(ModelAndView mv, MemberVO memberVO,WorkTimeVO workTimeVO, String memberStatus )throws Exception{
		
//		memberVO.setStatus(memberStatus);
		if(memberStatus==null) {
			memberVO.setStatus(false);
		}
		else {
			memberVO.setStatus(true);
		}
		int result = memberService.setMemberUpdateDetail(memberVO, workTimeVO);
		CommonVO.msg="오류가 있습니다.";
		CommonVO.url="/member/memberList";
		if(result>0) {
			CommonVO.msg = "정보가 수정되었습니다.";
			CommonVO.url="/member/update?id="+memberVO.getId();
		}
		
		
		mv.addObject("url", CommonVO.url);
		mv.addObject("msg", CommonVO.msg);
		mv.addObject("result", result);
		mv.setViewName("common/alert");
		return mv;
	}
//	2. pw 초기화
	@PostMapping("initSecurity")
	public ModelAndView initSecurity(ModelAndView mv, MemberVO memberVO)throws Exception{

		 int result = memberService.setPasswordUpdateinit(memberVO);
		
		CommonVO.msg="오류가 있습니다.";
		CommonVO.url="/member/memberList";
		if(result>0) {
			CommonVO.msg = memberVO.getName()+" 님의 비밀번호가 수정되었습니다.";
			CommonVO.url="/member/update?id="+memberVO.getId();
		}
		
		
		mv.addObject("url", CommonVO.url);
		mv.addObject("msg", CommonVO.msg);
		mv.addObject("result", result);
		mv.setViewName("common/alert");
		return mv;
	}
	//3. employeeStatus초기화
	@PostMapping("employeeStatusUpdate")
	public ModelAndView employeeStatusUpdate(ModelAndView mv, EmployeeStatusVO employeeStatusVO,String empStatus)throws Exception{
		employeeStatusVO.setStatus(empStatus);
		int result = memberService.setEmployeeStatusUpdate(employeeStatusVO);
		CommonVO.msg="오류가 있습니다.";
		CommonVO.url="/member/memberList";
		if(result>0) {
			CommonVO.msg = "근태정보가 수정되었습니다.";
			CommonVO.url="/member/update?id="+employeeStatusVO.getMemberId();
		}
		
		
		mv.addObject("url", CommonVO.url);
		mv.addObject("msg", CommonVO.msg);
		mv.addObject("result", result);
		mv.setViewName("common/alert");
		return mv;
	}
	//4. leaveRecode DATE변경
	@PostMapping("leaveUpdate")
	public ModelAndView leaveRecodeUpdate(ModelAndView mv, LeaveRecordVO leaveRecordVO)throws Exception{
		
		
		int result = memberService.setLeaveRecordUpdate(leaveRecordVO);
		result = 0;
		CommonVO.msg="오류가 있습니다.";
		CommonVO.url="/member/memberList";
		if(result>0) {
			CommonVO.msg = "연차가 수정되었습니다.";
			CommonVO.url="/member/update?id="+leaveRecordVO.getMemberId();
		}
		
		
		mv.addObject("url", CommonVO.url);
		mv.addObject("msg", CommonVO.msg);
		mv.addObject("result", result);
		mv.setViewName("common/alert");
		return mv;

	}
	
}
