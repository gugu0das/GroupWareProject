package com.ware.group.approval;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ware.group.annual.LeaveRecordVO;
import com.ware.group.approval3.JobVO;
import com.ware.group.department.DepartmentVO;
import com.ware.group.member.MemberVO;

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
	
	
	
	
	
	
	@GetMapping("application")
	public ModelAndView setApprovalApplication() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("approval/application");
		return mv;
	}
	
	@PostMapping("application")
	public ModelAndView setApprovalApplication(ApprovalVO approvalVO, String dd,LeaveRecordVO leaveRecordVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//예시
		approvalVO.setMemberId(1L);
		
		
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
        System.out.println("==================1============================");
        PrintWriter fw = new PrintWriter(new FileOutputStream("c:/sm/approval/"+fileName));
        fw.println(dd);
        System.out.println("===================2===========================");
        //is.close(); //입력 스트림 닫기
        //br.close(); //출력스트림 닫기
        System.out.println("===================3===========================");
        log.error("컨트롤러");
        int result = approvalService.setApprovalApplication(approvalVO, fileName,leaveRecordVO);
		mv.setViewName("redirect:./myInformation");
		pw.close();
		fw.close();
		return mv;
	}
	@GetMapping("information")
	//list
	public ModelAndView getApprovalInformation(ApprovalVO approvalVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		approvalVO.setMemberId(1L);
		
		List<ApprovalVO> ar = approvalService.getApprovalList(approvalVO);
		List<ApprovalCategoryVO> arr = approvalService.getListCategory();
		if(approvalVO.getCategoryId() !=null) {
		for(ApprovalCategoryVO approvalCategoryVO : arr) {
			if( approvalCategoryVO.getRef() == approvalVO.getCategoryId()) {
				ApprovalVO vo = new ApprovalVO();
				vo.setCategoryId(approvalCategoryVO.getId());
				vo.setMemberId(1L);
				List<ApprovalVO> arrr = approvalService.getApprovalList(vo);
				log.error("{}...",arrr);
				for(ApprovalVO er : arrr) {
					ar.add(er);
				}
			}
		}
		}
		for(ApprovalCategoryVO approvalCategoryVO : arr) {
			if(approvalVO.getCategoryId() != null &&approvalCategoryVO.getId() == approvalVO.getCategoryId()) {
				mv.addObject("name", approvalCategoryVO.getName());
				break;
			}else {
				mv.addObject("name", "전체");
			}
		}
		mv.addObject("cat", arr);
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
	public ModelAndView setApprovalApproval(Long id1,Long id2,int approval,String fileName,String ddd) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		ApprovalVO approvalVO = new ApprovalVO();
		approvalVO.setId(id1);
		MemberVO memberVO = new MemberVO();
		memberVO.setId(1L);
		log.error("들어오냐");
		log.error("{}::::::::::",approval);
		PrintWriter pw = new PrintWriter(System.out, true);
        //파일 수정 모드 있는 파일을 불러오기
		
        //PrintWriter fw = new PrintWriter(new FileOutputStream("c:/sm/approval/"+fileName,true));
        BufferedWriter writer = new BufferedWriter(new FileWriter("c:/sm/approval/"+fileName));
        //fw.println(dd);
        //덮어 쓰기
        writer.write(ddd);
        //is.close(); //입력 스트림 닫기
        //br.close(); //출력스트림 닫기
        
        
        int result=approvalService.setApprovalApproval(memberVO, approvalVO, approval);
        
		log.error("{} ::::::::::::", approval);
		mv.setViewName("redirect:./information");
		//mv.setViewName("approval/refuse");
		pw.close();
        writer.close();
		return mv;
	}
	
	@GetMapping("myInformation")
	public ModelAndView getMyInformation(ApprovalVO approvalVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<ApprovalVO> ar = approvalService.getMyApproval(approvalVO);
		
		mv.addObject("list", ar);
		mv.setViewName("approval/myInformation");
		return mv;
	}
}
