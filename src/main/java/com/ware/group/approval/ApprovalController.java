package com.ware.group.approval;

import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ware.group.approval.MemberVO;
import com.ware.group.approval3.DepartmentVO;
import com.ware.group.approval3.JobVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/approval/*")
@Slf4j
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	
	@Value("${app.upload.base}")
	private String basePath;
	
	/*
	 * @Autowired TemplateEngine templateEngine;
	 */
	
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
        int result = approvalService.setApprovalApplication(approvalVO, fileName);
		mv.setViewName("redirect:./myInformation");
		return mv;
	}
	@GetMapping("information")
	//list
	public ModelAndView getApprovalInformation() throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		memberVO.setId(4L);
		List<ApprovalVO> ar = approvalService.getApprovalList(memberVO);
		
		mv.addObject("list", ar);
		mv.setViewName("approval/information");
		return mv;
	}
	@GetMapping("check")
	//detail
	public ModelAndView setApprovalCheck(ApprovalVO approvalVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		ApprovalUploadFileVO approvalUploadFileVO=approvalService.getApprovalFile(approvalVO);
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
		approvalService.setApprovalApproval(memberVO, approvalVO, approval);
		
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