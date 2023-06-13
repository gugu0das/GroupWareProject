package com.ware.group.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.CommonAnnotationBeanPostProcessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	@GetMapping("memberList")
	public ModelAndView getMemeberList(ModelAndView mv)throws Exception{
		
		
		
		
		return mv;
	}
	
}
