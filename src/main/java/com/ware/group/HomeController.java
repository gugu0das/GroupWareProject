package com.ware.group;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.approval.ApprovalCategoryVO;
import com.ware.group.approval.ApprovalService;

import lombok.extern.slf4j.Slf4j;





@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	ApprovalService approvalService;
	
	@GetMapping("/")
	public String home(HttpServletRequest request) throws Exception{
		
		List<ApprovalCategoryVO> list0 = approvalService.getListCategoryRef0();
		List<ApprovalCategoryVO> list1 = approvalService.getListCategoryRef1();
		HttpSession session = request.getSession();
		session.setAttribute("categoryList0", list0);
		session.setAttribute("categoryList1", list1);
		
		return "index";
		
	}

}
