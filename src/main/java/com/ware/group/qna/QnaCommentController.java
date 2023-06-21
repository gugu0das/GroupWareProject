package com.ware.group.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.alim.AllimService;
import com.ware.group.member.MemberVO;
import com.ware.group.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/qnaComment/*")
public class QnaCommentController {

	@Autowired
	private QnaCommentService qnaCommentService;
	
	@Autowired
	private AllimService allimService;
	
	@GetMapping("list")
	public ModelAndView getQnaCommentList(@ModelAttribute QnaCommentVO qnaCommentVO, Pager pager,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
	    MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
	 
	    pager.setPerPage(5L);
		List<QnaCommentVO> ar = qnaCommentService.getQnaCommentList(pager);
		log.error("{}",pager.getPage());
		mv.addObject("memberVO", memberVO);
		mv.addObject("list", ar);
		mv.setViewName("common/commentList");

		return mv;
	}

	@PostMapping("add")
	@ResponseBody
	public int setQnaCommentAdd(QnaCommentVO qnaCommentVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//int result = qnaCommentService.setQnaCommentAdd(qnaCommentVO, null, session);
		 List<Integer> al = qnaCommentService.setQnaCommentAdd(qnaCommentVO, null, session);
		 String msg = "글 실패";
	        int result = al.get(0);
	        if(result > 0) {
	        	 result = al.get(1);
	        }
//		mv.addObject("result", result);
//		 mv.addObject("msg", msg);
//	
////	        mv.addObject("url", "./qna/detail");
////	        mv.addObject("SSEurl", "/trigger-event");
////	        mv.addObject("name", al.get(1)); //memberId List 2번쨰
//		mv.setViewName("common/ajaxResult");
		
		return result;
	}

	@PostMapping("delete")
	public ModelAndView setQnaCommentDelete(QnaCommentVO qnaCommentVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = qnaCommentService.setQnaCommentDelete(qnaCommentVO, session);

		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");

		return mv;
	}

	@PostMapping("update")
	public ModelAndView setQnaCommentUpdate(QnaCommentVO qnaCommentVO) throws Exception {
		ModelAndView mv = new ModelAndView();
	
		int result = qnaCommentService.setQnaCommentUpdate(qnaCommentVO);

		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");

		return mv;
	}

	@GetMapping("detail2")
	public ModelAndView getQnaCommentDetail(QnaCommentVO qnaCommentVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		qnaCommentVO = (QnaCommentVO) qnaCommentService.getQnaCommentDetail(qnaCommentVO);

		mv.addObject("qnaCommentVO", qnaCommentVO);
		mv.setViewName("qna/detail");

		return mv;
	}

	@GetMapping("reply")
	public ModelAndView setReplyAdd(@ModelAttribute QnaCommentVO qnaCommentVO, ModelAndView modelAndView,
			HttpSession session,Long allimId) throws Exception {

		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl) obj;
		MemberVO memberVO = (MemberVO) contextImpl.getAuthentication().getPrincipal();
		 if(allimId !=null) {
				allimService.setUpdateAllim(allimId);
			}
		
		qnaCommentVO.setWriter(memberVO.getAccountId());

		modelAndView.setViewName("/qna/reply");
		return modelAndView;
	}

	@PostMapping("reply")
	@ResponseBody
	public int setReplyAdd(QnaCommentVO qnaCommentVO,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl) obj;
		MemberVO memberVO = (MemberVO) contextImpl.getAuthentication().getPrincipal();
		 
		qnaCommentVO.setWriter(memberVO.getAccountId());
		
		
		qnaCommentVO.setContents(qnaCommentVO.getContents().replaceAll("<p>", ""));
		qnaCommentVO.setContents(qnaCommentVO.getContents().replaceAll("</p>", ""));
		
		
		int result = qnaCommentService.setReplyAdd(qnaCommentVO,session);

		
		
	

		return result;
	}
}
