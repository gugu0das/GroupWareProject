package com.ware.group.approval2;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.PrintWriter;

import java.util.List;
import java.util.UUID;
import com.ware.group.approval2.ApprovalVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.approval.ApprovalCategoryVO;
import com.ware.group.approval.ApprovalService;


import com.ware.group.util.Pager;

import lombok.extern.slf4j.Slf4j;

//import org.junit.jupiter.api.Assertions;
@Controller
@RequestMapping("/approvals/*")
@Slf4j
public class ApprovalControllers {
	
	
	@Autowired
	private ApprovalServices approvalServices;
	
	@Autowired
	private ApprovalService approvalService;
	
	@Value("${app.upload.base}")
	private String basePath;
	
	/*
	 * @Autowired TemplateEngine templateEngine;
	 */
	
	
	@GetMapping("application")
	public ModelAndView setApprovalApplication() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("approval/application");
		return mv;
	}
	
	@PostMapping("application")
	public ModelAndView setApprovalApplication(ApprovalVO approvalVO, String dd) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//예시
		approvalVO.setMemberId(12L);
		
		
		//log.error(dd);
		
		/* String urlStr = "http://localhost/approval/application"; */
//		URL url = new URL(dd);
		//문자 기반 스트림 
        //Reaer(BufferedReader, FileReader, InputStreamReader)
        //Writer(BufferedWriter, FileWriter, OutputStreamWriter, PrintWriter)
		//InputStream is =new ByteArrayInputStream(dd.getBytes());
		
        //BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
        //여러 인코딩 방식 중 UTF-8이용
        //BufferedReader : 데이터 효율적으로 전송하기 위함
        PrintWriter pw = new PrintWriter(System.out, true);
        String fileName = UUID.randomUUID().toString();
        fileName=fileName+".html";
        PrintWriter fw = new PrintWriter(new FileOutputStream("c:/sm/approval/"+fileName));
        fw.println(dd);
        
        //is.close(); //입력 스트림 닫기
        //br.close(); //출력스트림 닫기
        pw.close();
        fw.close();
        int result = approvalServices.setApprovalApplication(approvalVO,fileName);
		mv.setViewName("redirect:./myInformation");
		return mv;
	}
	@GetMapping("information")
	//list
	public ModelAndView getApprovalInformation(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		pager.setMemberId(0L);
		memberVO.setId(4L);
		
		List<ApprovalVO> ar = approvalServices.getApprovalList(pager);
		
		//cat
		List<ApprovalCategoryVO> arr = approvalService.getListCategoryRef0();
		//cat2
		List<ApprovalCategoryVO> arrrr = approvalService.getListCategory();
		//cat1
		List<ApprovalCategoryVO> arrr =approvalService.getListCategoryRef1();
		mv.addObject("pager", pager);
		
		log.error("======================{}=============",ar.size() ==0);
		
		
		
		for(ApprovalCategoryVO approvalCategoryVO : arr) {
			if(pager.getCategoryId() != null &&approvalCategoryVO.getId() == pager.getCategoryId()) {
				mv.addObject("name", approvalCategoryVO.getName());
				break;
			}else {
				mv.addObject("name", "전체");
			}
		}
		
		
		if(ar.size() ==0) {
			
			
			for(ApprovalCategoryVO approvalCategoryVO : arrr) {
				if(approvalCategoryVO.getRef() == pager.getCategoryId()) {
					pager.setCategoryId(approvalCategoryVO.getId());
					List<ApprovalVO> av = approvalServices.getApprovalList(pager);
							for(ApprovalVO a : av) {
								ar.add(a);
								}
							}
					
				}
				
			}
			
		mv.addObject("cat", arr);
		mv.addObject("cat2", arrrr);
		mv.addObject("cat1", arrr);
		mv.addObject("list", ar);
		
		mv.setViewName("approval/information2");
//			
		
		
		return mv;
	}
	@PostMapping("information")
	public ModelAndView getApprovalInformation(Pager pager,ModelAndView mv) throws Exception{
		
		MemberVO memberVO = new MemberVO();
		pager.setMemberId(0L);
		memberVO.setId(4L);
		
		List<ApprovalVO> ar = approvalServices.getApprovalList(pager);
		List<ApprovalCategoryVO> arr = approvalService.getListCategoryRef0();
		//cat2
		
		//cat1
		List<ApprovalCategoryVO> arrr =approvalService.getListCategoryRef1();
		mv.addObject("pager", pager);
	
		for(ApprovalCategoryVO approvalCategoryVO : arr) {
			if(pager.getCategoryId() != null &&approvalCategoryVO.getId() == pager.getCategoryId()) {
				mv.addObject("name", approvalCategoryVO.getName());
				break;
			}else {
				mv.addObject("name", "전체");
			}
		}
		
		
		mv.addObject("cat1", arrr);
		mv.addObject("list", ar);
		
		mv.setViewName("common/commonApprovalList");
			
		
		return mv;
	}
	@GetMapping("check")
	//detail
	public ModelAndView setApprovalCheck(ApprovalVO approvalVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		ApprovalUploadFileVO approvalUploadFileVO=approvalServices.getApprovalFile(approvalVO);
		mv.addObject("file", approvalUploadFileVO.getName());
		mv.addObject("id",approvalVO.getId());
		mv.setViewName("approval/check");
		return mv;
	}
	@PostMapping("approval")
	public ModelAndView setApprovalApproval(MemberVO memberVO,int approval,String fileName,String ddd,ApprovalVO approvalVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO.setId(4L);
		log.error("들어오냐");
		log.error("{}::::::::::",approval);
//		PrintWriter pw = new PrintWriter(System.out, true);
//        //파일 수정 모드 있는 파일을 불러오기
//		
//        //PrintWriter fw = new PrintWriter(new FileOutputStream("c:/sm/approval/"+fileName,true));
//        BufferedWriter writer = new BufferedWriter(new FileWriter("c:/sm/approval/"+fileName));
//        //fw.println(dd);
//        //덮어 쓰기
//        writer.write(ddd);
//        //is.close(); //입력 스트림 닫기
//        //br.close(); //출력스트림 닫기
//        pw.close();
//        writer.close();
		approvalServices.setApprovalApproval(memberVO, approvalVO, approval);
		
		log.error("{} ::::::::::::", approval);
		mv.setViewName("approval/approval");
		//mv.setViewName("approval/refuse");
		return mv;
	}
	
	@GetMapping("myInformation")
	public ModelAndView getMyInformation(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("approval/myInformation");
		return mv;
	}
}
