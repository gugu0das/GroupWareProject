package com.ware.group.department;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.common.CommonVO;
import com.ware.group.member.JobVO;
import com.ware.group.member.MemberService;
import com.ware.group.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/department/*")
@Slf4j
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;

	@Autowired
	private MemberService memberService;
	CommonVO commonVO = new CommonVO();
	
	@GetMapping("list")
	public ModelAndView getDepartmentList(ModelAndView mv,HttpSession session,MemberVO memberVO) throws Exception{
		List<JobVO> jobList= memberService.getJobList();
		memberVO = memberService.getSessionAttribute(session);
		mv.addObject("memberVO", memberVO);
		mv.addObject("jobList", jobList);
		return mv;
	}

	@GetMapping("tree")
	@ResponseBody
	public List<DepartmentVO> getDepartmentTreeList(DepartmentVO departmentVO)throws Exception{
		List<DepartmentVO> ar=  departmentService.getDepartmentTreeList(departmentVO);	
		return ar;
	}
	@GetMapping("add")
	public ModelAndView setDepartmentAdd(ModelAndView mv, DepartmentVO departmentVO,MemberVO memberVO, HttpSession session) throws Exception {
		
		List<DepartmentVO>  ar= departmentService.getDepartmentList();
		memberVO = memberService.getSessionAttribute(session);
		mv.addObject("departmentVOs", ar);
		mv.addObject("memberVO", memberVO);
		mv.setViewName("department/add");
		return mv;
	}
	@PostMapping("add")
	public ModelAndView setDepartmentAdd( DepartmentVO departmentVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = departmentService.setDepartmentAdd(departmentVO);
		
		commonVO.setMsg("부서를 추가할 수 없습니다.");
		commonVO.setUrl("/department/add");
		commonVO.setTextMsg("다시 확인해주세요.");
		if(result>0) {
			commonVO.setMsg("부서가 추가되었습니다.");
			commonVO.setTextMsg("");
			
		}
		mv.addObject("commonVO",commonVO);
		mv.addObject("result", result);
		mv.setViewName("member/memberAlert");

		
		return mv;
	}
	@GetMapping("detail")
	public ModelAndView getDepartmentDetail(ModelAndView mv, DepartmentVO departmentVO,MemberVO memberVO,HttpSession session)throws Exception{
		departmentVO = departmentService.getDepartmentDetail(departmentVO);
		List<DepartmentVO>  ar= departmentService.getDepartmentList();
		memberVO = memberService.getSessionAttribute(session);
		mv.addObject("memberVO", memberVO);
		mv.addObject("departmentVOs", ar);
		mv.addObject("vo", departmentVO);
		mv.setViewName("department/detail");
		return mv;
	}
	@PostMapping("delete")
	public ModelAndView setDepartmentDelete(ModelAndView mv, DepartmentVO departmentVO)throws Exception{
		int result = departmentService.setDepartmentDelete(departmentVO);
		mv.setViewName("department/list");
		return mv;
	}
	@PostMapping("update")
	public ModelAndView setDepartmentUpdate(ModelAndView mv, DepartmentVO departmentVO)throws Exception{
		int result = departmentService.setDepartmentUpdate(departmentVO);
		
		mv.setViewName("department/list");
		return mv;
	}

}
