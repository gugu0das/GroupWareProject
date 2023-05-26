package com.ware.group.notice;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.board.BoardFileVO;
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
	
	@PostMapping("moveToTop")
	public ModelAndView moveToTop(@RequestParam("postId") Long postId) throws Exception {
	    ModelAndView mv = new ModelAndView();
	    
	    // 게시글 조회
	    NoticeVO noticeVO = new NoticeVO();
	    noticeVO.setId(postId);
	    NoticeVO targetPost = noticeService.getDetail(noticeVO);
	    
	    // 게시글을 리스트에서 삭제
	    noticeService.setDelete(noticeVO);
	    
	    // 리스트의 맨 앞에 게시글 추가
	    Pager pager = new Pager();
	    pager.setPerPage(2L); // 최근 게시글 1개만 조회
	    List<NoticeVO> currentPosts = noticeService.getList(pager);
	    currentPosts.add(0, targetPost);
	    
	    mv.addObject("list", currentPosts);
	    mv.setViewName("common/noticeTop");
	    
	    return mv;
	}
	
	//메인화면에 공지사항 리스트 뜨게 하는 컨트롤러
	@GetMapping("listTop")
	public ModelAndView getNoticeListTop(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		pager.setPerPage(5L);
		
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
		
		List<NoticeVO> ar = noticeService.getList(pager);
		
		mv.addObject("list", ar);
		mv.setViewName("notice/list");
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setInsert(@ModelAttribute NoticeVO noticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
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
		
		/*
		 * MemberVO memberVO = (MemberVO)session.getAttribute("member");
		 * noticeVO.setMemberId(memberVO.getId());
		 */
		
		
		if(bindingResult.hasErrors()) {
			
			mv.setViewName("notice/add");
			
			return mv;
		}
		
		for(MultipartFile multipartFile : files) {
			log.error("{} ::",multipartFile.getOriginalFilename());
			}
		int result = noticeService.setInsert(noticeVO, files);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(NoticeVO noticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		noticeVO = (NoticeVO)noticeService.getDetail(noticeVO);
		
		int result = noticeService.setNoticeHit(noticeVO);
	
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
		
		int result = noticeService.setDelete(noticeVO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(@ModelAttribute NoticeVO noticeVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		log.debug("안녕");
		/*
		 * noticeVO = noticeService.getDetail(noticeVO);
		 * 
		 * mv.addObject("noticeVO", noticeVO);
		 */
		mv.addObject("notice", noticeVO);
		
		mv.setViewName("notice/update");
		return mv;
	}
	
	
	@PostMapping("update")
	public ModelAndView setUpdate(@Valid NoticeVO noticeVO,BindingResult bindingResult, MultipartFile [] files,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setUpdate(noticeVO,files);
		
		mv.addObject("noticeVO", noticeVO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
		
	}
}
