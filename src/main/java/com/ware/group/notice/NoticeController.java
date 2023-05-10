package com.ware.group.notice;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.ware.group.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice/*")
@Slf4j
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("notice")
	public String getBoard() {
		return "notice";
	}
	
	@GetMapping(value = "list")
	public ModelAndView getList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		log.info("search : {}", pager.getSearch());
		log.info("kind : {}", pager.getKind());
		
		List<NoticeVO> ar = noticeService.getList(pager);
		
		mv.addObject("list", ar);
		mv.setViewName("notice/list");
		
		return mv;
	}
	
	@GetMapping(value = "add")
	public ModelAndView setInsert(@ModelAttribute NoticeVO noticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notice/add");
		
		return mv;
	}
	
	@PostMapping(value = "add")
	public ModelAndView setInsert(@Valid NoticeVO noticeVO, BindingResult bindingResult, MultipartFile [] boardFiles) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(bindingResult.hasErrors()) {
			log.warn("================ 검증 실패 ================");
			mv.setViewName("notice/add");
			return mv;
		}
		
		int result = noticeService.setInsert(noticeVO, boardFiles);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping(value = "detail")
	public ModelAndView getDetail(NoticeVO noticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		noticeVO = (NoticeVO)noticeService.getDetail(noticeVO);
		
		mv.addObject("noticeVO", noticeVO);
		mv.setViewName("notice/detail");
		
		return mv;
	}
	
	/*
	 * @GetMapping(value = "fileDown") public ModelAndView getFileDown(BoardFileVO
	 * boardFileVO) throws Exception { ModelAndView mv = new ModelAndView();
	 * 
	 * boardFileVO = noticeService.getFileDetail(boardFileVO);
	 * 
	 * mv.addObject("boardFileVO", boardFileVO); mv.setViewName("fileManager");
	 * 
	 * return mv; }
	 */
	
	@GetMapping(value = "delete")
	public ModelAndView setDelete(NoticeVO noticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setDelete(noticeVO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
}
