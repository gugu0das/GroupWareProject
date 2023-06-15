package com.ware.group.approval;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ware.group.alim.AllimService;
import com.ware.group.annual.LeaveRecordVO;

import com.ware.group.department.DepartmentVO;
import com.ware.group.member.JobVO;
import com.ware.group.member.MemberService;
import com.ware.group.member.MemberVO;
import com.ware.group.util.FileManager;
import com.ware.group.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/approval/*")
@Slf4j
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;

	@Value("${app.upload.approvalFormFile}")
	private String formFilePath;
	@Value("${app.upload.base}")
	private String basePath;
	@Value("${app.upload.bass}")
	private String basePaths;
	
	@Autowired
	private FileManager filemanger;
	
	
	@Autowired
	private AllimService allimService;

	
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
		
		List<DepartmentVO> listDepartment = approvalService.getDepartmentList();
		
		log.error("=={}==", listApprover.get(0).getDepartmentId());
		log.error("=={}==", listApprover.get(0).getJobId());
		log.error("=={}==", listApprover.get(0).getDepartmentVOs().get(0).getName());
		log.error("=={}==", listApprover.get(0).getJobVOs().get(0).getName());
		mv.addObject("list0", listCategoryRef0);
		mv.addObject("list1", listCategoryRef1);
		mv.addObject("listFormFile", listFormFile);
		mv.addObject("listApprover", listApprover);
		mv.addObject("listDepartment", listDepartment);
		
		
		
		mv.setViewName("/approval/updateCategory");
		
		return mv;
		
	}
	
	@PostMapping("updateFormFile")
	@ResponseBody
	public String updateFormFile(MultipartHttpServletRequest request) throws Exception{
		log.error("=======test=======");
		
		
		List<MultipartFile> file = request.getFiles("file");
		
		log.error("=={}==", file.size());
		//log.error("=={}==", categoryId);
		ApprovalFormFileVO approvalFormFileVO = new ApprovalFormFileVO();
		int result = 0;
		String fileName = "";
		
		for(MultipartFile obj : file) {
			approvalFormFileVO.setFileName(obj.getOriginalFilename());
			
			approvalFormFileVO.setCategoryId(3L);
			result = approvalService.updateFormFile(approvalFormFileVO);
			
			filemanger.saveFile(formFilePath, obj);
		}
		
		if(result == 1 && fileName != null) {
			return "파일 업데이트 성공";
		}else{
			return "파일 업데이트 실패";
		}
	}
	
	@PostMapping("updateUpperFile")
	@ResponseBody
	public String updateUpperFile(@RequestPart(value = "categoryId") Map<String, Object> param, MultipartHttpServletRequest request) throws Exception{
		
		List<MultipartFile> file = request.getFiles("file");
		
		log.error("=={}==", param.get("categoryId"));
		//log.error("=={}==", categoryId);
		ApprovalFormFileVO approvalFormFileVO = new ApprovalFormFileVO();
		int result = 0;
		String fileName = "";
		
		for(MultipartFile obj : file) {
			approvalFormFileVO.setFileName(obj.getOriginalFilename());
			
			approvalFormFileVO.setCategoryId(Long.parseLong((String)param.get("categoryId")));
			result = approvalService.addUpperFormFile(approvalFormFileVO);
			
			filemanger.saveFile(formFilePath, obj);
		}
		
		if(result == 1 && fileName != null) {
			return "파일 업데이트 성공";
		}else{
			return "파일 업데이트 실패";
		}
	}
	
	@PostMapping("updateUpperOptionApprover")
	@ResponseBody
	public int updateUpperOptionApprover(String categoryId, String departmentId[] , String jobId[]) throws Exception{
		
		log.error("====");
		log.error("=={}==", departmentId.length);
		log.error("====");
		
		List<ApproverVO> approverVOs = new ArrayList<>();
		
		for(int i = 0; i < departmentId.length; i ++) {
			ApproverVO vo = new ApproverVO();
			vo.setCategoryId(Long.parseLong(categoryId));
			vo.setDepartmentId(Long.parseLong(departmentId[i]));
			vo.setJobId(Long.parseLong(jobId[i]));
			vo.setDepth(i);
			approverVOs.add(vo);
		}
		
		int result = 0;
		
		for(ApproverVO approver : approverVOs) {
			result = approvalService.addApprover(approver);
		}
		
		
		
		return result;
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
		String fileName = "";
		for(MultipartFile multipartFile : fileId) {
			fileName = filemanger.saveFile(formFilePath, multipartFile);
		}
		
		
		Gson gson = new Gson();
		log.error(json1);
		ApprovalCategoryVO [] approvalCategoryVOs = gson.fromJson(json1, ApprovalCategoryVO[].class);
		log.error("============");
		log.error("============{}",approvalCategoryVOs.length);
		int result = 0;
		
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
					fileVO.setFileName(fileName);
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
						result = approvalService.addApprovalFormFile(fileVO);
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
		mv.addObject("result", result);
		mv.addObject("url", "/approval/updateCategory");
		mv.setViewName("common/alert");
		
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
	
	@PostMapping("addApprover")
	@ResponseBody
	public int addApprover(ApproverVO approverVO) throws Exception{
		List<ApproverVO> ar = approvalService.getListApprover();
		boolean check = false;
		for(ApproverVO approver : ar) {
			if(approver.getCategoryId() == approverVO.getCategoryId()) {
				if(approver.getDepartmentId() == approverVO.getDepartmentId()) {
					if(approver.getJobId() == approverVO.getJobId()) {
						check = true;
					}
				}	
			}
		}
		
		int result = 0;
		
		if(!check) {
			result = approvalService.addApprover(approverVO);
		}
		
		return result;
		
	}
	@PostMapping("addApprover1")
	@ResponseBody
	public int addApprover1(ApproverVO approverVO) throws Exception{
		List<ApproverVO> ar = approvalService.getListApprover();
		boolean check = false;
		for(ApproverVO approver : ar) {
			if(approver.getCategoryId() == approverVO.getCategoryId()) {
				if(approver.getDepartmentId() == approverVO.getDepartmentId()) {
					if(approver.getJobId() == approverVO.getJobId()) {
						check = true;
					}
				}	
			}
		}
		
		int result = 0;
		
		if(!check) {
			result = approvalService.addApprover1(approverVO);
		}
		
		return result;
		
	}
	@PostMapping("deleteApprover")
	@ResponseBody
	public int deleteApprover(ApproverVO approverVO) throws Exception{
		int result = approvalService.deleteApprover(approverVO);
		if(result > 0) {
			approvalService.updateApproverDepth(approverVO);
		}
		return result;
	}
	
	
	@PostMapping("deleteUnderCategory")
	@ResponseBody
	public int deleteUnderCategory(ApprovalCategoryVO categoryVO) throws Exception{
		int result = approvalService.deleteUnderCategory(categoryVO);
		ApproverVO vo = new ApproverVO();
		vo.setCategoryId(categoryVO.getId());
		approvalService.deleteUnderApprover(vo);
		ApprovalFormFileVO vo2 = new ApprovalFormFileVO();
		vo.setCategoryId(categoryVO.getId());
		approvalService.deleteUnderFormFile(vo2);
		return result;
		
	}
	
	
	@PostMapping("deleteCategory")
	@ResponseBody
	public int deleteCategory(ApprovalCategoryVO categoryVO) throws Exception{

		int result = approvalService.deleteCategory(categoryVO);
		
		List<ApprovalCategoryVO> approvalCategoryVOList = new ArrayList<>();
		
		if(result == 1) {
			for(ApprovalCategoryVO categoryVO1 : approvalService.checkUpperCategory()) {
				long count = approvalService.underCategoryCount(categoryVO1);
				if( count > 0 ) {
					approvalCategoryVOList.add(categoryVO1);
				}
			}
			if( approvalCategoryVOList.size() != 0 ) {
				for(ApprovalCategoryVO categoryVO2 : approvalCategoryVOList) {
					approvalService.deleteUpperOptionApprover(categoryVO2);
					approvalService.deleteUpperOptionFormFile(categoryVO2);
				}
			}
		}
		
		return result;
	}
	
	@PostMapping("addUnderCategory")
	@ResponseBody
	public int addUnderCategory(String ref, String name , Long jobId[], Long departmentId[], String fileName) throws Exception{
		int result = 1;
		ApprovalCategoryVO categoryVO = new ApprovalCategoryVO();
		categoryVO.setRef(Long.parseLong(ref));
		categoryVO.setName(name);
		
		approvalService.addUnderCategory(categoryVO);
		
		if(categoryVO.getId() > 0) {
			for(int i = 0; i < jobId.length; i++) {
				ApproverVO approverVO = new ApproverVO();
				approverVO.setCategoryId(categoryVO.getId());
				approverVO.setJobId(jobId[i]);
				approverVO.setDepartmentId(departmentId[i]);
				approverVO.setDepth(i);
				approvalService.addApprover(approverVO);
			}
			ApprovalFormFileVO approvalFormFileVO = new ApprovalFormFileVO();
			approvalFormFileVO.setCategoryId(categoryVO.getId());
			approvalFormFileVO.setFileName(fileName);
			approvalService.addApprovalFormFile(approvalFormFileVO);
		}
		return result;
	}
	
	
	//
	
	@GetMapping("application")
	public ModelAndView setApprovalApplication(ApprovalCategoryVO categoryVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		log.error("{}:::",categoryVO.getId());
		ApprovalFormFileVO approvalFormFileVO = approvalService.getFormFile(categoryVO);
		mv.addObject("cat", categoryVO.getId());
		mv.addObject("file", approvalFormFileVO.getFileName());
		mv.setViewName("approval/application");
		return mv;
	}

	@PostMapping("application")
	public ModelAndView setApprovalApplication(ApprovalVO approvalVO, String dd,LeaveRecordVO leaveRecordVO,HttpSession session,String annualType1) throws Exception{
		ModelAndView mv = new ModelAndView();
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		
		
		log.error("vo {} ", leaveRecordVO.getAnnualType());
		
		if(leaveRecordVO.getReason() =="" && leaveRecordVO.getUseDate()=="") {
			leaveRecordVO.setReason(null);
			leaveRecordVO.setUseDate(null);
		}
		//예시
		approvalVO.setMemberId(memberVO.getId());		
		
		
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
        
        File file = new File(basePaths+"/approval");
        if(!file.exists()) {
			file.mkdirs();
		}
        PrintWriter fw = new PrintWriter(new FileOutputStream(basePaths+"approval/"+fileName));
        fw.println(dd);
        
        //is.close(); //입력 스트림 닫기
        //br.close(); //출력스트림 닫기
        
        log.error("컨트롤러");
        List<Integer> al = approvalService.setApprovalApplication(approvalVO, fileName,leaveRecordVO);
        String msg = "신청 실패";
        int result = al.get(0);
        if(result == 1) {
        	msg="신청 완료";
        }
        mv.addObject("result", result);
        mv.addObject("msg", msg);
        mv.addObject("url", "./myInformation");
        mv.addObject("SSEurl", "/trigger-event");
        mv.addObject("name", al.get(1));
        mv.setViewName("common/alert");
		pw.close();
		fw.close();
		return mv;
	}

//	@GetMapping("information")
//	//list
//	public ModelAndView getApprovalInformation(Pager pager,HttpSession session) throws Exception{
//		ModelAndView mv = new ModelAndView();
//		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
//		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
//		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
//		log.error("page--------------{}-----------------",pager.getPage());
//		Long pa = pager.getPage();
//		pager.setMemberId(memberVO.getId());
//		
//		mv.addObject("caa", pager.getCategoryId());
//		List<ApprovalVO> ar = approvalService.getApprovalList(pager);
//		
//		//cat
//		List<ApprovalCategoryVO> arr = approvalService.getListCategoryRef0();
//		//cat2
//		List<ApprovalCategoryVO> arrrr = approvalService.getListCategory();
//		//cat1
//		List<ApprovalCategoryVO> arrr =approvalService.getListCategoryRef1();
//		log.error("-------------{}----------------",pager.getCategoryId());
//		log.error("--------------{}-----------------",pager.getPage());
//		
//		for(ApprovalCategoryVO approvalCategoryVO : arr) {
//			if(pager.getCategoryId() != null &&approvalCategoryVO.getId() == pager.getCategoryId()) {
//				log.error("-------------{}=========",approvalCategoryVO.getName());
//				mv.addObject("name", approvalCategoryVO.getName());
//				break;
//			}else {
//				mv.addObject("name", "전체");
//			}
//		}
//		log.error("-----------{}------------",ar);
//		
//		if(ar.size() ==0) {
//			pager.setRef(pager.getCategoryId());
//			pager.setCategoryId(null);
//			pager.setPage(pa);
//			ar = approvalService.getApprovalList(pager);
//			}
//		mv.addObject("list", ar);
//		pager.setCategoryId(pager.getRef());
//		mv.addObject("pager", pager);
//			
//		mv.addObject("cat", arr);
//		mv.addObject("cat2", arrrr);
//		mv.addObject("cat1", arrr);
//		
//		
//		mv.setViewName("approval/information");
////			
//		
//		
//		return mv;
//	}
	@GetMapping("information")
	//list
	public ModelAndView getApprovalInformation(Pager pager,HttpSession session, Long allimId) throws Exception{
		ModelAndView mv = new ModelAndView();
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		
		if(allimId !=null) {
			allimService.setUpdateAllim(allimId);
		}
		
		
		pager.setMemberId(memberVO.getId());
		//pager.setMemberId(0L);
		mv.addObject("caa", pager.getCategoryId());
		List<ApprovalVO> ar = approvalService.getApprovalList(pager);
		
		//cat
		List<ApprovalCategoryVO> arr = approvalService.getListCategoryRef0();
		//cat2
		List<ApprovalCategoryVO> arrrr = approvalService.getListCategory();
		//cat1
		List<ApprovalCategoryVO> arrr =approvalService.getListCategoryRef1();
		log.error("-------------{}----------------",pager.getCategoryId());
		log.error("--------------{}-----------------",pager.getPage());
		
		for(ApprovalCategoryVO approvalCategoryVO : arr) {
			if(pager.getCategoryId() != null &&approvalCategoryVO.getId() == pager.getCategoryId()) {
				log.error("-------------{}=========",approvalCategoryVO.getName());
				mv.addObject("name", approvalCategoryVO.getName());
				break;
			}else {
				mv.addObject("name", "전체");
			}
		}
		log.error("-----------{}------------",ar);
		
		
		mv.addObject("list", ar);
		
		mv.addObject("pager", pager);
			
		mv.addObject("cat", arr);
		mv.addObject("cat2", arrrr);
		mv.addObject("cat1", arrr);
		
		
		mv.setViewName("approval/information");
//			
		
		
		return mv;
	}
	@PostMapping("information")
	public ModelAndView getApprovalInformation(Pager pager,ModelAndView mv,HttpSession session) throws Exception{
		
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		pager.setMemberId(memberVO.getId());
		//pager.setMemberId(0L);
		
		List<ApprovalVO> ar = approvalService.getApprovalList(pager);
		
		//cat2
		
		//cat1
		List<ApprovalCategoryVO> arrr =approvalService.getListCategoryRef1();
		mv.addObject("pager", pager);
	
		
		
		
		mv.addObject("cat1", arrr);
		mv.addObject("list", ar);
		
		mv.setViewName("common/commonApprovalList");
			
		
		return mv;
	}

	@GetMapping("check")
	// detail
	public ModelAndView setApprovalCheck(ApprovalVO approvalVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		ApprovalUploadFileVO approvalUploadFileVO = approvalService.getApprovalFile(approvalVO);
		mv.addObject("file", approvalUploadFileVO.getName());
		mv.addObject("id", approvalVO.getId());
		mv.addObject("checkNum", 1);
		mv.setViewName("approval/check");
		return mv;
	}
	@GetMapping("myPayment")
	// detail
	public ModelAndView getMyPayment(ApprovalVO approvalVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		ApprovalUploadFileVO approvalUploadFileVO = approvalService.getApprovalFile(approvalVO);
		mv.addObject("file", approvalUploadFileVO.getName());
		mv.addObject("checkNum", 2);
		mv.addObject("id", approvalVO.getId());
		mv.addObject("confirm", approvalVO.getConfirm());
		mv.setViewName("approval/check");
		return mv;
	}

	@PostMapping("approval")
	public ModelAndView setApprovalApproval(Long id1,Long id2,int approval,String fileName,String ddd,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		ApprovalVO approvalVO = new ApprovalVO();
		approvalVO.setId(id1);
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		
		log.error("들어오냐");
		log.error("{}::::::::::",approval);
		log.error("들어오냐 {}",approvalVO.getId());
		PrintWriter pw = new PrintWriter(System.out, true);
        //파일 수정 모드 있는 파일을 불러오기
		
        //PrintWriter fw = new PrintWriter(new FileOutputStream("c:/sm/approval/"+fileName,true));
        BufferedWriter writer = new BufferedWriter(new FileWriter(basePaths+"approval/"+fileName));
        //fw.println(dd);
        //덮어 쓰기
        writer.write(ddd);
        //is.close(); //입력 스트림 닫기
        //br.close(); //출력스트림 닫기
        
        
        List<Integer> al =approvalService.setApprovalApproval(memberVO, approvalVO, approval);
        int result = al.get(0);
        log.error("{} ::::::::::::", approval);
		String msg = "승인 실패";
        if(result > 0) {
        	msg="승인 완료";
        }
		
		 mv.addObject("result", result);
	     mv.addObject("msg", msg);
	     mv.addObject("url", "./information");
	     mv.addObject("SSEurl", "/trigger-event");
	     mv.addObject("name", al.get(1));
	     mv.setViewName("common/alert");
		
		//mv.setViewName("approval/refuse");
		pw.close();
        writer.close();
		return mv;
	}
	

	@GetMapping("myInformation")
	public ModelAndView getMyInformation(Pager pager,HttpSession session, Long allimId) throws Exception{
		ModelAndView mv = new ModelAndView();
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		pager.setMemberId(memberVO.getId());
		if(allimId !=null) {
			allimService.setUpdateAllim(allimId);
		}
		
		log.error("{}",pager.getConfirm());
		if(pager.getConfirm()=="") {
			pager.setConfirm(null);
			log.error("null입니다");
			
		}
		List<ApprovalVO> ar = approvalService.getMyApproval(pager);
		log.error("{}",pager.getConfirm());
		if(pager.getConfirm() != null) {
		mv.addObject("name", pager.getConfirm());
		}else {
			mv.addObject("name", "전체");
		}
		
		mv.addObject("pager", pager);
		mv.addObject("caa", pager.getConfirm());
		mv.addObject("list", ar);
		mv.setViewName("approval/myInformation");
		
		
		return mv;
	}
	
	
	@PostMapping("delete")
	public ModelAndView setDelete(Long id1,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		
		
		log.error("========================================{}====================================================",id1);
		int result = approvalService.setApprovalDelete(id1,memberVO);
		result = approvalService.setApprovalFileDelete(id1);
		result=approvalService.setApprovalInfoDelete(id1);
		
		String msg = "삭제 실패";
        if(result == 1) {
        	msg="삭제 완료";
        }
		
		
		 mv.addObject("result", result);
	     mv.addObject("msg", msg);
	     mv.addObject("url", "./myInformation");
	     mv.setViewName("common/alert");
		
		return mv;
	}
	@GetMapping("managerInformation")
	public ModelAndView getManager(HttpSession session,Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		mv.addObject("caa", pager.getCategoryId());
		pager.setMemberId(null);
		List<ApprovalVO> ar = approvalService.getApprovalList(pager);
		//cat
		List<ApprovalCategoryVO> arr = approvalService.getListCategoryRef0();
		//cat2
		List<ApprovalCategoryVO> arrrr = approvalService.getListCategory();
		//cat1
		List<ApprovalCategoryVO> arrr =approvalService.getListCategoryRef1();	
				
		for(ApprovalCategoryVO approvalCategoryVO : arr) {
			if(pager.getCategoryId() != null &&approvalCategoryVO.getId() == pager.getCategoryId()) {
				log.error("-------------{}=========",approvalCategoryVO.getName());
					mv.addObject("name", approvalCategoryVO.getName());
					break;
			}else {
					mv.addObject("name", "전체");
					}
				}
				
		mv.addObject("cat", arr);
		mv.addObject("cat2", arrrr);
		mv.addObject("cat1", arrr);
		mv.addObject("caa", pager.getConfirm());
		
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.setViewName("approval/managerInformation");
		
		return mv;
	}
	@PostMapping("managerInformation")
	public ModelAndView getManager(Pager pager,ModelAndView mv,HttpSession session) throws Exception{
		
//		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
//		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
//		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
//		pager.setMemberId(memberVO.getId());
		pager.setMemberId(null);
		
		List<ApprovalVO> ar = approvalService.getApprovalList(pager);
		
		//cat2
		
		//cat1
		List<ApprovalCategoryVO> arrr =approvalService.getListCategoryRef1();
		mv.addObject("pager", pager);
	

		mv.addObject("cat1", arrr);
		mv.addObject("list", ar);
		
		mv.setViewName("common/commonApprovalList");
			
		
		return mv;
	}
	
	
	@GetMapping("managerCheck")
	public ModelAndView getManagerCheck(HttpSession session,ApprovalVO approvalVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		log.error("{}",memberVO.getRoleVOs().size());
		ApprovalUploadFileVO approvalUploadFileVO = approvalService.getApprovalFile(approvalVO);
		mv.addObject("file", approvalUploadFileVO.getName());
		mv.addObject("num", memberVO.getRoleVOs().size());
		mv.addObject("id", approvalVO.getId());
		mv.setViewName("approval/check");
		
		return mv;
	}
	
}
