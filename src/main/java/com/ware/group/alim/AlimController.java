package com.ware.group.alim;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping
@Slf4j
public class AlimController {
	
	@Autowired
	public AllimService allimService;
	
	
	@GetMapping("/allimCount")
	@ResponseBody
    public Long sse(HttpSession session) throws Exception {
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		
		Long result = allimService.getAllimcount(memberVO);
		log.error("{}",result);
	return result;
	}
	@GetMapping("/allim")
    public ModelAndView getAllim(HttpSession session, int c) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		log.error("========{}==========",c);
		List<AllimVO> ar= allimService.getAllim(memberVO);
		if(c >0) {
			mv.addObject("c", 1);
		}
		mv.addObject("list", ar);
		
		mv.setViewName("common/allim");
		return mv;
	}
	
}
