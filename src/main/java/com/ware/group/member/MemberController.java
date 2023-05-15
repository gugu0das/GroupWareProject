package com.ware.group.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member/*")
@Slf4j
public class MemberController {

	@Autowired
	private MemberService memberService;

	@GetMapping("join")
	public ModelAndView setMemberJoin(ModelAndView mv)throws Exception{
		mv.setViewName("member/join");
		return mv;
	}

	@PostMapping("join")
	public ModelAndView setMemberJoin(ModelAndView mv, MemberVO memberVO)throws Exception{

		int result = memberService.setMemeberJoin(memberVO);
		
		
		mv.setViewName("/");
		return mv;
	}
	
	@GetMapping("list")
	public void getMembers()throws Exception{
		System.out.println("memberAcouontid : " + memberService.getMembers().get(0).getAccountId());
	}
	
}
