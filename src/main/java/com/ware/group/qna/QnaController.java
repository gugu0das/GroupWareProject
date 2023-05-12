package com.ware.group.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	
	@ModelAttribute("qna")
	public String getBoard() {
		return "qna";
	}
	
	@GetMapping(value = "list")
	public ModelAndView getList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<QnaVO> ar = qnaService.getList(pager);
		
		mv.addObject("list", ar);
		mv.setViewName("qna/list");
		
		return mv;
	}
}
