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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ware.group.annual.LeaveRecordVO;
import com.ware.group.approval3.DocumentFilesVO;
import com.ware.group.approval3.JobVO;
import com.ware.group.department.DepartmentVO;
import com.ware.group.member.MemberVO;
import com.ware.group.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/approval/*")
@Slf4j
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;

	@Value("${app.upload.base}")
	private String basePath;
	
	@Autowired
	private FileManager filemanger;
	/*
	 * @Autowired TemplateEngine templateEngine;
	 */
	
	@GetMapping("listCategory")
	public ModelAndView getListCategory() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/approval/listCategory");
		
		List<ApprovalCategoryVO> listCategoryRef0 = approvalService.getListCategoryRef0(); 
		
		List<ApprovalCategoryVO> listCategoryRef1 = approvalService.getListCategoryRef1(); 
		
		List<ApprovalFormFileVO> listFormFile = approvalService.getListFormFile();
		
		List<ApproverVO> listApprover =  approvalService.getListApprover(); 
		
		mv.addObject("list0", listCategoryRef0);
		mv.addObject("list1", listCategoryRef1);
		mv.addObject("listFormFile", listFormFile);
		mv.addObject("listApprover", listApprover);
		
		return mv;
		
	}
	@GetMapping("updateCategory")
	public ModelAndView updateCategory() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		
		
		List<ApprovalCategoryVO> listCategoryRef0 = approvalService.getListCategoryRef0(); 
		
		List<ApprovalCategoryVO> listCategoryRef1 = approvalService.getListCategoryRef1(); 
		
		List<ApprovalFormFileVO> listFormFile = approvalService.getListFormFile();
		
		List<ApproverVO> listApprover =  approvalService.getListApprover();
		log.error("=={}==", listApprover.get(0).getDepartmentId());
		log.error("=={}==", listApprover.get(0).getJobId());
		log.error("=={}==", listApprover.get(0).getDepartmentVOs().get(0).getName());
		log.error("=={}==", listApprover.get(0).getJobVOs().get(0).getName());
		mv.addObject("list0", listCategoryRef0);
		mv.addObject("list1", listCategoryRef1);
		mv.addObject("listFormFile", listFormFile);
		mv.addObject("listApprover", listApprover);
		
		
		
		mv.setViewName("/approval/updateCategory");
		
		return mv;
		
	}
	
	@PostMapping("updateFormFile")
	@ResponseBody
	public String updateFormFile(MultipartHttpServletRequest request, Long fileId) throws Exception{
		log.error("=======test=======");
		
		
		List<MultipartFile> file = request.getFiles("file");
		
		log.error("=={}==", file.size());
		log.error("=={}==", fileId);
		DocumentFilesVO documentFilesVO = new DocumentFilesVO();
		int result = 0;
		String fileName = "";
		
		for(MultipartFile obj : file) {
			documentFilesVO.setFileName(obj.getOriginalFilename());
			documentFilesVO.setOriName(obj.getOriginalFilename());
			documentFilesVO.setId(fileId);
			result = approvalService.updateFormFile(documentFilesVO);
			filemanger.saveFile(basePath + "/approvalFormFile", obj);
		}
		
		if(result == 1 && fileName != null) {
			return "파일 업데이트 성공";
		}else{
			return "파일 업데이트 실패";
		}
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
	
	@PostMapping("categoryDuplication")
	@ResponseBody
	public List<String> categoryDuplication(String[] name)throws Exception{

		List<String> str = approvalService.getCategoryDuplication(name);
		
		return str;
	}
	@PostMapping("formFileDuplication")
	@ResponseBody
	public List<String> formFileDuplication(String[] formFileName)throws Exception{

		List<String> str = approvalService.getFileDuplication(formFileName);
		
		return str;
	}
	@PostMapping("addCategory")
	public ModelAndView addCategory(String json1, MultipartFile [] fileId) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		boolean check = false;
		
		for(MultipartFile multipartFile : fileId) {
			//중복검사 먼저 하기
			DocumentFilesVO documentFilesVO = new DocumentFilesVO();
			
			documentFilesVO.setFileName(multipartFile.getOriginalFilename());
			documentFilesVO.setOriName(multipartFile.getOriginalFilename());
			
			
			approvalService.addFormFile(documentFilesVO);
				
			filemanger.saveFile(basePath + "/approvalFormFile", multipartFile);
		}
		
		
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
						fileVO.setFileId(approvalService.getFileId(fileVO.getFileName()));
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
		mv.addObject("url", "/");
		
		return mv;
	}
	
//	@GetMapping("updateCategory")
//	public ModelAndView updateCategory() throws Exception{
//		
//		ModelAndView mv = new ModelAndView();
//		
//		List<ApprovalCategoryVO> listCategory = approvalService.getListCategory();
//		
//		mv.setViewName("/approval/updateCategory");
//		mv.addObject("list", listCategory);
//		
//		return mv;
//		
//	}
	
	@PostMapping("updateCategoryName")
	@ResponseBody
	public String updateCategoryName(ApprovalCategoryVO approvalCategoryVO) throws Exception{
		
		int result = approvalService.updateCategoryName(approvalCategoryVO);
		
		String re = "";
		if(result == 1) {
			re = "수정 성공";
		}else {
			re = "수정 실패";
		}
		
		return re;
	}
	
	@PostMapping("getDepartmentList")
	@ResponseBody
	public List<DepartmentVO> getDepartmentList() throws Exception{
		
		List<DepartmentVO> ar = approvalService.getDepartmentList();
		
		return ar;
		
	}
	
	@PostMapping("updateApprover")
	@ResponseBody
	public int updateApprover(ApproverVO approverVO) throws Exception{
		
		int result = approvalService.updateApprover(approverVO);
		
		return result;
		
	}
	
	@PostMapping("deleteCategory")
	public ModelAndView deleteCategory(ApprovalCategoryVO categoryVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = approvalService.deleteCategory(categoryVO);
		
		
		mv.setViewName("/approval/deleteCategory");
		
		return mv;
		
	}
	
	
	//
	
	@GetMapping("application")
	public ModelAndView setApprovalApplication() throws Exception {
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
	// detail
	public ModelAndView setApprovalCheck(ApprovalVO approvalVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		ApprovalUploadFileVO approvalUploadFileVO = approvalService.getApprovalFile(approvalVO);
		mv.addObject("file", approvalUploadFileVO.getName());
		mv.addObject("id", approvalVO.getId());
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
