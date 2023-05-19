package com.ware.group.member;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	private DepartmentService departmentService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
//	@GetMapping("info")
//	public void info(HttpSession session) {
////		String pw="5";
////		
////		MemberVO memberVO=(MemberVO)memberService.loadUserByUsername("5");
////		
////		log.error("{} ::::: ", memberVO.getPassword());
////		log.error("{} ::::: ", passwordEncoder.encode(pw));
////		log.error("{} :::::", memberVO.getPassword().equals(passwordEncoder.encode(pw)));
////		
////		boolean check = passwordEncoder.matches(pw, memberVO.getPassword());
////		log.error("{} :::: ", check);
////		
////		
////		log.error("======== Login Info ===========");
//		//SPRING_SECURITY_CONTEXT
//		Enumeration<String> names = session.getAttributeNames();
//		while(names.hasMoreElements()) {
//			log.error("==== {} === ", names.nextElement());
//		}
//		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
//		log.error("========== {} =========", obj);
//		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
//		Authentication authentication= contextImpl.getAuthentication();
//
//		
//		log.error("====== USERNAME :  {} ======", authentication.getName());
//		log.error("====== Detail :  {} ======", authentication.getDetails());
//		log.error("====== MemberVO :  {} ======", authentication.getPrincipal());
//		MemberVO  meb =  (MemberVO)authentication.getPrincipal();
//		System.out.println(meb.getAccountId());
//		
//	}

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
//		MemberVO memberVO = new MemberVO();
//		memberVO.setAccountId("D");
//		memberVO = memberService.getMemberLogin(memberVO);
//		System.out.println("getID : "+memberVO.getId());
//		System.out.println("getROLEID : "+memberVO.getRoleVOs().get(0).getId());
//		
//		
		
		
		mv.setViewName("member/login");
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
	
}
