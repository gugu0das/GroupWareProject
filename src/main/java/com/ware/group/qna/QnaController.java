package com.ware.group.qna;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.board.BoardFileVO;
import com.ware.group.member.MemberVO;
import com.ware.group.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private QnaCommentService qnaCommentService;
	
	@ModelAttribute("board")
	public String getQna() {
		return "qna";
	}
	
	@GetMapping("list")
	public ModelAndView getList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<QnaVO> ar = qnaService.getList(pager);
		for(QnaVO qnaVO : ar) {
		
			qnaVO.setCount(qnaService.getCount(qnaVO));
		}
		for(QnaVO qnaVO : ar) {
			
		}
		 if(pager.getLastNum()<5L) {
			 pager.setLastNum(5L);
		 }
		mv.addObject("list", ar);
		mv.setViewName("qna/list");
		
		return mv;
}
		@GetMapping("add")
		public ModelAndView setInsert(@ModelAttribute QnaVO qnaVO,HttpSession session) throws Exception {
			ModelAndView mv = new ModelAndView();
			
			Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
			SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		    MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
				
			qnaVO.setWriter(memberVO.getAccountId());
			
			
			
			mv.setViewName("qna/add");
			
			return mv;
		}
		
//		@PostMapping("add")
//		public ModelAndView setInsert(@Valid NoticeVO noticeVO, BindingResult bindingResult, MultipartFile [] files,HttpSession session) throws Exception {
//			ModelAndView mv = new ModelAndView();
//			
//			if(bindingResult.hasErrors()) {
//				log.warn("================ 검증 실패 ================");
//				mv.setViewName("notice/add");
//				System.out.println("여긴가지냐?");
//				return mv;
//			}
//			System.out.println(files[0].getName());
//			System.out.println(files[0].getOriginalFilename());
//			for(MultipartFile multipartFile : files) {
//				log.error("{} ::",multipartFile.getOriginalFilename());
//				}
//			int result = noticeService.setInsert(noticeVO, files);
//			
//			mv.setViewName("redirect:./list");
//			
//			return mv;
//		}
		
		  @PostMapping("add") 
		  public ModelAndView setInsert(@Valid QnaVO qnaVO,BindingResult bindingResult, MultipartFile [] files,HttpSession session) throws Exception {
		  
	      ModelAndView mv = new ModelAndView();
	      Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
	      SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
	      MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
	      log.error("{}",memberVO.getId());
		  
	      
	      
	      if(bindingResult.hasErrors()) {
		  
		  mv.setViewName("qna/add");
		  
		  return mv; 
		  
		  }
		  
		  for(MultipartFile multipartFile : files) {
		  log.error("{} ::",multipartFile.getOriginalFilename()); 
		} 
		  qnaVO.setMemberId(memberVO.getId());
		  int result = qnaService.setInsert(qnaVO, files);
		  
		  mv.setViewName("redirect:./list");
		  
		  return mv; 
		  
		  }
		 
		
		
		@GetMapping("detail")
		public ModelAndView getDetail(QnaVO qnaVO,HttpSession session) throws Exception {
			ModelAndView mv = new ModelAndView();
			
			Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
			SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		    MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
			
			
			qnaVO = (QnaVO)qnaService.getDetail(qnaVO);
			
			int result = qnaService.setQnaHit(qnaVO);
			
			mv.addObject("memberVO", memberVO);
			mv.addObject("qnaVO", qnaVO);
		
			mv.setViewName("qna/detail");
			
			return mv;
		}
		
		
		  @GetMapping("fileDown") 
		  public ModelAndView getFileDown(BoardFileVO boardFileVO) throws Exception { 
			  
		  ModelAndView mv = new ModelAndView();
		  
		  boardFileVO = qnaService.getFileDetail(boardFileVO);
		  
		  mv.addObject("boardFileVO", boardFileVO); 
		  mv.setViewName("fileManager");
		  
		  return mv; 
		  }
		  
		 
		
		@GetMapping("delete")
		public ModelAndView setDelete(QnaVO qnaVO,QnaCommentVO qnaCommentVO,HttpSession session) throws Exception {
			ModelAndView mv = new ModelAndView();
			
			int result = qnaService.setDelete(qnaVO);
						 qnaCommentService.setQnaCommentDelete(qnaCommentVO, session);
			
							
			mv.setViewName("redirect:./list");
			
			return mv;
		}
		
		@PostMapping("filedelete")
		@ResponseBody
		public int setDelete(QnaVO qnaVO,HttpSession session) throws Exception {
			log.error("{}",qnaVO.getId());
			int result = qnaService.setFileDelete(qnaVO);
			
			
			
			return result;
		}
		
		
		@GetMapping("update")
		public ModelAndView setUpdate(@ModelAttribute QnaVO qnaVO,HttpSession session) throws Exception{
			ModelAndView mv = new ModelAndView();
			
			Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
			SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		    MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
				
			qnaVO.setWriter(memberVO.getAccountId());
			log.error("{}",qnaVO.getId());
			qnaVO = (QnaVO)qnaService.getDetail(qnaVO);
			log.info(qnaVO.getTitle());
			 
			mv.addObject("qnaVO", qnaVO);
			mv.setViewName("qna/update");
			
			return mv;
		}
		@PostMapping("update")
		public ModelAndView setUpdate(@Valid QnaVO qnaVO,MultipartFile [] files,BindingResult bindingResult,HttpSession session)throws Exception{
			ModelAndView mv = new ModelAndView();
			
			Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
			SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		    MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		    
			
			int result = qnaService.setUpdate(qnaVO,files);
			if(bindingResult.hasErrors()) {
				
				mv.setViewName("notice/update");
				
				return mv;
			}
			
			for(MultipartFile multipartFile : files) {
				log.error("{} ::",multipartFile.getOriginalFilename());
				}
			qnaVO.setMemberId(memberVO.getId());
			
			/* result = noticeService.setInsert(noticeVO, files); */
			
			mv.setViewName("redirect:./list");
			
			return mv;			 
			
		}
		 
}