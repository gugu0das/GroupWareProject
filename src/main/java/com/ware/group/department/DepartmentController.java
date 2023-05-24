package com.ware.group.department;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/department/*")
@Slf4j
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;
	
	@GetMapping("list")
	public void getDepartmentList() throws Exception{
	}

	@GetMapping("tree")
	@ResponseBody
	public List<DepartmentVO> getDepartmentTreeList()throws Exception{
		List<DepartmentVO> ar=  departmentService.getDepartmentTreeList();	
		return ar;
	}
	@GetMapping("add")
	public ModelAndView setDepartmentAdd(ModelAndView mv, DepartmentVO departmentVO) throws Exception {
		
		List<DepartmentVO>  ar= departmentService.getDepartmentList();
		mv.addObject("departmentVOs", ar);
		mv.setViewName("department/add");
		return mv;
	}
	@PostMapping("add")
	public ModelAndView setDepartmentAdd( DepartmentVO departmentVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int reuslt = departmentService.setDepartmentAdd(departmentVO);
		
		mv.setViewName("redirect:/");
		return mv;
	}
	@GetMapping("detail")
	public ModelAndView getDepartmentDetail(ModelAndView mv, DepartmentVO departmentVO)throws Exception{
		departmentVO = departmentService.getDepartmentDetail(departmentVO);
		mv.addObject("vo", departmentVO);
		mv.setViewName("department/detail");
		return mv;
	}

}
