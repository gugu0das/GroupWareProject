package com.ware.group;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

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
//
//		List<ApprovalCategoryVO> list0 = approvalService.getListCategoryRef0();
//		List<ApprovalCategoryVO> list1 = approvalService.getListCategoryRef1();
//		session.setAttribute("categoryList0", list0);
//		session.setAttribute("categoryList1", list1);

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
