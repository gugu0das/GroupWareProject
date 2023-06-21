package com.ware.group;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.ware.group.approval.ApprovalCategoryVO;
import com.ware.group.approval.ApprovalService;
import com.ware.group.member.EmployeeStatusVO;
import com.ware.group.member.MemberService;
import com.ware.group.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {

	@Autowired
	ApprovalService approvalService;

	@Autowired
	MemberService memberService;
	
	
    

    
	
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView mv, HttpServletRequest request,EmployeeStatusVO employeeStatusVO) throws Exception{
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		List<ApprovalCategoryVO> list0 = approvalService.getListCategoryRef0();
		List<ApprovalCategoryVO> list1 = approvalService.getListCategoryRef1();
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		session.setAttribute("categoryList0", list0);
		session.setAttribute("categoryList1", list1);
		session.setAttribute("id", memberVO.getAccountId());
		
		

		//근태
		employeeStatusVO =  memberService.getEmployeeStatus(session);
		mv.addObject("employeeVO", employeeStatusVO);
		List<String> ar = memberService.getEmployeeStatusBtn(employeeStatusVO, session);
		if(ar!=null&&ar.size()>0) {

			mv.addObject("btns",ar);
		}
		mv.setViewName("index");
		
		return mv;

	}
	

}
