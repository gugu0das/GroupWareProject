package com.ware.group.notice;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.board.BoardFileVO;
import com.ware.group.member.MemberVO;
import com.ware.group.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice/*")
@Slf4j
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	
	
	@ModelAttribute("board")
	public String getNotice() {
		return "notice";
	}
	
	
	@GetMapping("importantList")
	public ModelAndView getImportantList(NoticeVO noticeVO,Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<NoticeVO> ar = noticeService.getList(pager);
		
		mv.addObject("importantList", ar);
		mv.setViewName("notice/importantList");
		
		return mv;
	}
	
	//메인화면에 공지사항 리스트 뜨게 하는 컨트롤러
	@GetMapping("listTop")
	public ModelAndView getNoticeListTop(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		pager.setPerPage(5L);
		;
		List<NoticeVO> ar = noticeService.getList(pager);
		
		
		
		
		mv.addObject("list", ar);
		mv.setViewName("common/noticeResult");
		
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView getList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		log.info("search : {}", pager.getSearch());
		log.info("kind : {}", pager.getKind());
		pager.setPerPage(5L);
		List<NoticeVO> ar = noticeService.getList(pager);
		 log.error("{}",pager.isImportant());
		/* log.error("{}",pager.getImportant()); */
		 if(pager.getLastNum()<5L) {
			 pager.setLastNum(5L);
		 }
		mv.addObject("list", ar);
		mv.addObject("pager",pager);
		mv.setViewName("notice/list");
		
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setInsert(@ModelAttribute NoticeVO noticeVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		//session.getAttribute 를 하고싶지만 SEcurity Session으로 바뀌어서 이렇게 받아와야 session에 있는 데이터를 얻을 수 있다.
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		
		
		noticeVO.setWriter(memberVO.getAccountId());
		mv.setViewName("notice/add");
		
		return mv;
	}
	
//	@PostMapping("add")
//	public ModelAndView setInsert(@Valid NoticeVO noticeVO, BindingResult bindingResult, MultipartFile [] files,HttpSession session) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		
//		if(bindingResult.hasErrors()) {
//			log.warn("================ 검증 실패 ================");
//			mv.setViewName("notice/add");
//			System.out.println("여긴가지냐?");
//			return mv;
//		}
//		System.out.println(files[0].getName());
//		System.out.println(files[0].getOriginalFilename());
//		for(MultipartFile multipartFile : files) {
//			log.error("{} ::",multipartFile.getOriginalFilename());
//			}
//		int result = noticeService.setInsert(noticeVO, files);
//		
//		mv.setViewName("redirect:./list");
//		
//		return mv;
//	}
	@PostMapping("add")
	public ModelAndView setInsert(@Valid NoticeVO noticeVO, BindingResult bindingResult, MultipartFile [] files,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		
		
		if(bindingResult.hasErrors()) {
			
			mv.setViewName("notice/add");
			
			return mv;
		}
		
		for(MultipartFile multipartFile : files) {
			log.error("{} ::",multipartFile.getOriginalFilename());
			}
		noticeVO.setMemberId(memberVO.getId());
		int result = noticeService.setInsert(noticeVO, files);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(NoticeVO noticeVO,HttpSession session,MultipartFile [] files) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
	    MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
	    
	    log.error("{}",noticeVO.getId());
	    log.error("{}",noticeVO.getContents());
	    noticeVO = (NoticeVO)noticeService.getDetail(noticeVO);
		
	    
		int result = noticeService.setNoticeHit(noticeVO);
		
		mv.addObject("filess",noticeService.getFileList(noticeVO));
		mv.addObject("memberVO", memberVO);
		mv.addObject("noticeVO", noticeVO);
		mv.setViewName("notice/detail");
		
		return mv;
	}
	
	
	  @GetMapping("fileDown") 
	  public ModelAndView getFileDown(BoardFileVO boardFileVO,String notice) throws Exception {
		  
	  ModelAndView mv = new ModelAndView();
	  
	  boardFileVO = noticeService.getFileDetail(boardFileVO);
	  mv.addObject("boardFileVO", boardFileVO); 
	  mv.setViewName("fileManager");
	  
	  return mv; 
	  }
	  
	 
	
	@GetMapping("delete")
	public ModelAndView setDelete(NoticeVO noticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		log.error("{}",noticeVO.getId());
		int result = noticeService.setDelete(noticeVO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@PostMapping("filedelete")
	@ResponseBody
	public int setFileDelete(NoticeVO noticeVO) throws Exception {
		
		log.error("{}",noticeVO.getId());
		int result = noticeService.setFileDelete(noticeVO);
		
		
		
		return result;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(@ModelAttribute NoticeVO noticeVO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
	    MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
			
		noticeVO.setWriter(memberVO.getAccountId());
		log.error("{}",noticeVO.getId());
		noticeVO = (NoticeVO)noticeService.getDetail(noticeVO);
		log.error(noticeVO.getTitle());
		for(BoardFileVO boardFileVO:noticeVO.getBoardFileVOs()) {
			log.error("=============================={}======================",boardFileVO.getId());;
		}
		
		
		mv.addObject("noticeVO", noticeVO);
		
		mv.setViewName("notice/update");
		return mv;
	}
	
	
	@PostMapping("update")
	public ModelAndView setUpdate(@Valid NoticeVO noticeVO,BindingResult bindingResult, MultipartFile [] files,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		log.error("{}",noticeVO.getId());
		
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
	    MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
	    
		
		int result = noticeService.setUpdate(noticeVO,files);
		if(bindingResult.hasErrors()) {
			
			mv.setViewName("notice/update");
			
			return mv;
		}
		
		for(MultipartFile multipartFile : files) {
			log.error("{} ::",multipartFile.getOriginalFilename());
			}
		noticeVO.setMemberId(memberVO.getId());
		
		/* result = noticeService.setInsert(noticeVO, files); */
		
		mv.setViewName("redirect:./list");
		
		return mv;			 
		
		
	
		
	}
}
