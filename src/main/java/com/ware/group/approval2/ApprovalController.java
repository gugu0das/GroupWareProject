package com.ware.group.approval2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping("/approval/*")
public class ApprovalController {
	
	@GetMapping("application")
	public ModelAndView setApprovalApplication() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("approval/application");
		return mv;
	}
	@PostMapping("application")
	public ModelAndView setApprovalApplication(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:./myInformation");
		return mv;
	}
	@GetMapping("information")
	//list
	public ModelAndView setApprovalInformation() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("approval/information");
		return mv;
	}
	@GetMapping("check")
	//detail
	public ModelAndView setApprovalCheck() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("approval/check");
		return mv;
	}
	@PostMapping("approval")
	public ModelAndView setApprovalApproval() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("approval/approval");
		//mv.setViewName("approval/refuse");
		return mv;
	}
	
	@GetMapping("myInformation")
	public ModelAndView getMyInformation(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("approval/myInformation");
		return mv;
	}
}
