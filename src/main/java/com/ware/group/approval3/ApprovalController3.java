package com.ware.group.approval3;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ware.group.approval.ApprovalCategoryVO;
import com.ware.group.approval.ApprovalFormFileVO;
import com.ware.group.approval.ApproverVO;

import lombok.extern.slf4j.Slf4j;

@Controller
//@RequestMapping("/approval/*")
@Slf4j
public class ApprovalController3 {
	
	@Autowired
	ApprovalService3 approvalService;
	
	@GetMapping("listCategory")
	public ModelAndView getListCategory() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/approval/listCategory");
		
		List<ApprovalCategoryVO> listCategory = approvalService.getListCategory(); 
		
		mv.addObject("list", listCategory);
		
		return mv;
		
	}
	
	@GetMapping("addCategory")
	public ModelAndView addCategory() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/approval/addCategory");
		
		List<DepartmentVO> deptList = approvalService.getDepartmentList();
		
		mv.addObject("deptList", deptList);
		
		return mv;
		
	}
	
	@PostMapping("getJobList")
	@ResponseBody
	public List<JobVO> getJobList(DepartmentVO departmentVO) throws Exception{
		
		List<JobVO> jobList = approvalService.getJobList(departmentVO);
		
		return jobList;
	}
	
	@PostMapping("addCategory")
	public ModelAndView addCategory(String json1) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		log.error(json1);
		
		Gson gson = new Gson();
		
		ApprovalCategoryVO [] approvalCategoryVOs = gson.fromJson(json1, ApprovalCategoryVO[].class);
		
		for(ApprovalCategoryVO approvalCategoryVO1 : approvalCategoryVOs) {
			approvalCategoryVO1.setRef(0L);
			approvalService.addCategory(approvalCategoryVO1);
			if(approvalCategoryVO1.getSub() == null) {
				for(ApproverVO approverVO : approvalCategoryVO1.getApprover()) {					
					approverVO.setCategoryId(approvalCategoryVO1.getId());
					approvalService.addApprover(approverVO);
				}
				for(ApprovalFormFileVO fileVO : approvalCategoryVO1.getFile()) {
					fileVO.setCategoryId(approvalCategoryVO1.getId());
					approvalService.addApprovalFormFile(fileVO);
				}
			}else {
				for(ApprovalCategoryVO approvalCategoryVO2 : approvalCategoryVO1.getSub()) {
					approvalCategoryVO2.setRef(approvalCategoryVO1.getId());
					approvalService.addCategory(approvalCategoryVO2);
					for(ApproverVO approverVO : approvalCategoryVO2.getApprover()) {					
						approverVO.setCategoryId(approvalCategoryVO2.getId());
						approvalService.addApprover(approverVO);
					}
					for(ApprovalFormFileVO fileVO : approvalCategoryVO2.getFile()) {
						fileVO.setCategoryId(approvalCategoryVO2.getId());
						approvalService.addApprovalFormFile(fileVO);
					}
				}
			}
		}
		//int result = approvalService.addCategory();
		
//		mv.addObject("result", result);
//		
//		
//		if(result == 1) {
//			mv.setViewName("/common/result");
//			mv.addObject("url", "/approval/main");
//		}else {
//			mv.setViewName("/approval/addCategory");
//		}
		
		
		return mv;
		
	}
	
	@GetMapping("updateCategory")
	public ModelAndView updateCategory() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<ApprovalCategoryVO> listCategory = approvalService.getListCategory();
		
		mv.setViewName("/approval/updateCategory");
		mv.addObject("list", listCategory);
		
		return mv;
		
	}
	@PostMapping("updateCategory")
	public ModelAndView updateCategory(List<ApprovalCategoryVO> categoryOption) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<ApprovalCategoryVO> listCategory = approvalService.getListCategory();
		
		// 기존거랑 다른것의 이름 = 이름만 수정
		// 번호가 없이 넘어옴 = 새로 생성
		
		mv.setViewName("/approval/updateCategory");
		mv.addObject("categoryOption", categoryOption);
		
		return mv;
		
	}
	
	@GetMapping("deleteCategory")
	public ModelAndView deleteCategory() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/approval/deleteCategory");
		
		return mv;
		
	}
	
	@PostMapping("deleteCategory")
	public ModelAndView deleteCategory(ApprovalCategoryVO categoryVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = approvalService.deleteCategory(categoryVO);
		
		
		mv.setViewName("/approval/deleteCategory");
		
		return mv;
		
	}
}
