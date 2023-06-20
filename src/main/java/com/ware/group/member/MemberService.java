package com.ware.group.member;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.annual.LeaveRecordVO;
import com.ware.group.common.Util4calen;
import com.ware.group.schedule.HolidayVO;
import com.ware.group.schedule.MonthVO;
import com.ware.group.schedule.ScheService;
import com.ware.group.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class MemberService implements UserDetailsService{

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private FileManager fileManager;
	
	@Value("${app.profile.locations}")
	private String path;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		 

		MemberVO memberVO = new MemberVO();
		memberVO.setAccountId(username);
		try {
			memberVO = memberDAO.getMemberLogin(memberVO);
		} catch (Exception e) {
			 
			e.printStackTrace();
		}

		return memberVO;
	}

	 
	public MemberVO getSessionAttribute(HttpSession session)throws Exception{
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		 
		return memberVO;
	}

	 
	public MemberVO getMemberProfile(MemberVO memberVO, HttpSession session) throws Exception{

		memberVO = this.getSessionAttribute(session);
		memberVO = memberDAO.getMemberProfile(memberVO);
		 
		WorkTimeVO workTimeVO = new WorkTimeVO();
		workTimeVO.setMemberId(memberVO.getId());
		workTimeVO= memberDAO.getDefaultWork(workTimeVO);

		memberVO.setWorkTimeVO(workTimeVO);
		 
		MemberProfileVO memberProfileVO = new MemberProfileVO();
		memberProfileVO.setMemberId(memberVO.getId());
		memberProfileVO = memberDAO.getProfile(memberProfileVO);
		
		memberVO.setMemberProfileVO(memberProfileVO);
		return memberVO;
	}
	 
		public MemberVO getMemberDetail(MemberVO memberVO) throws Exception{

			
			memberVO = memberDAO.getMemberDetail(memberVO);
			 
			WorkTimeVO workTimeVO = new WorkTimeVO();
			workTimeVO.setMemberId(memberVO.getId());
			workTimeVO= memberDAO.getDefaultWork(workTimeVO);

			memberVO.setWorkTimeVO(workTimeVO);
			 
			memberVO.setLeaveRecordVOs(memberDAO.getLeaveRecodeList(memberVO));
			 
			MemberProfileVO memberProfileVO = new MemberProfileVO();
			memberProfileVO.setMemberId(memberVO.getId());
			memberProfileVO = memberDAO.getProfile(memberProfileVO);
			
			memberVO.setMemberProfileVO(memberProfileVO);
			return memberVO;
		}
 
	public List<MemberVO> getMembers()throws Exception{
		return memberDAO.getMembers();
	}
	
	 
	public List<MemberVO> getMemberList()throws Exception{
		return memberDAO.getMemberList();
	}
	 
	public int setMemberUpdateDetail(MemberVO memberVO,WorkTimeVO workTimeVO)throws Exception{
		workTimeVO.setMemberId(memberVO.getId());
		int result = memberDAO.setMemberUpdateDetail(memberVO);
		WorkTimeVO defultWork = memberDAO.getDefaultWork(workTimeVO);
		 
		java.util.Date now = Util4calen.getToday();
		Date date =new Date(now.getYear(), now.getMonth(), now.getDate());
		if(defultWork.getRegDate().equals(date)) {
			workTimeVO.setId(defultWork.getId());
			result = memberDAO.setDefaultWorkUpdate(workTimeVO);	
		}
		else {
			Date nowDate = new Date(now.getTime());
			workTimeVO.setRegDate(nowDate);
			result = memberDAO.setDefaultWorkAdd(workTimeVO);
		}

		return result;
	}
	
	 
	public int setEmployeeStatusUpdate(EmployeeStatusVO employeeStatusVO)throws Exception{
		employeeStatusVO.setOnTime(Util4calen.setTimeStampFormat(employeeStatusVO.getStrOnTime(), employeeStatusVO.getReg()));
		employeeStatusVO.setOffTime(Util4calen.setTimeStampFormat(employeeStatusVO.getStrOffTime(), employeeStatusVO.getReg()));
		
		int result = memberDAO.setEmployeeStatusUpdate(employeeStatusVO);
		return result;
	}
	 
	public int setLeaveRecordUpdate(LeaveRecordVO leaveRecordVO)throws Exception{
		int result = memberDAO.setLeaveRecordUpdate(leaveRecordVO);
		return result;
	}


	public int setMemeberJoin(MemberVO memberVO, BindingResult bindingResult,WorkTimeVO workTimeVO)throws Exception{

		
		if(this.pwCheck(memberVO,bindingResult)) {
			return 0;
		}
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		int result =memberDAO.setMemberJoin(memberVO);
		
		 
		Map<String, Object> map = new HashMap<>();
		map.put("roleId", 3);
		map.put("memberId", memberVO.getId());
		result =  memberDAO.setMemberRole(map);
		
		
		 
		workTimeVO.setMemberId(memberVO.getId());
		workTimeVO.setRegDate(memberVO.getHireDate());
		memberDAO.setDefaultWorkAdd(workTimeVO);

		return result;
	}
	 
	public int setProfileAdd(MemberProfileVO memberProfileVO,HttpSession session,MultipartFile file)throws Exception{
		MemberVO memberVO =  this.getSessionAttribute(session);
		memberProfileVO.setMemberId(memberVO.getId());
		if(file!=null) {
			memberDAO.setProfileDelete(memberProfileVO);
		}
		String fileName = fileManager.saveFile(path, file); 
		memberProfileVO.setFileName(fileName);
		memberProfileVO.setOriName(file.getOriginalFilename());
		int result = memberDAO.setProfileAdd(memberProfileVO);
		return result;
	}
	 
	public int setPasswordUpdate(MemberVO memberVO,HttpSession session)throws Exception{
		int result = 0; 
		 
		memberVO.setAccountId(this.getSessionAttribute(session).getAccountId());

		 
		boolean check = this.pwCheck(memberVO);
		if(!check) { 
			memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
			
			result =  memberDAO.setPasswordUpdate(memberVO); 

			 

		}
		return result;

	}
	
	 
	public int setPasswordUpdate(MemberVO memberVO)throws Exception{
		
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		int sresult =  memberDAO.setPasswordUpdateinit(memberVO);
		return sresult;

	}
	
	
	public List<JobVO> getJobList()throws Exception{
		return memberDAO.getJobList();

	}
	public int setJobAdd(String [] names,JobVO jobVO)throws Exception{
		int result = 0;
		for(String name:names) {
			jobVO.setName(name);
			result = memberDAO.setJobAdd(jobVO);
			if(result==0) {
				break;
			}
		}
		
		return result;
		
	}
	public MemberVO getMemberLogin(MemberVO memberVO)throws Exception{
		return memberDAO.getMemberLogin(memberVO);

	}

	public int setMemberUpdate(MemberVO memberVO)throws Exception{
		return memberDAO.setMemberUpdate(memberVO);
	}
	 
	 
	public boolean idDuplicateCheck(MemberVO memberVO)throws Exception{

		boolean check = false;

		memberVO=memberDAO.idDuplicateCheck(memberVO);
		if(memberVO!=null) {
			check=true;
		}
		return check;
	}
	 
	public boolean pwCheck(MemberVO memberVO, BindingResult bindingResult)throws Exception{
		boolean check = false;
		check = bindingResult.hasErrors();
		if(check) {
			return check;
		}
		if(!memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
			bindingResult.rejectValue("passwordCheck", "비밀번호를 확인해주세요");
			check= true;
		}
		return check;
	}
	public boolean pwCheck(MemberVO memberVO)throws Exception{
		boolean check = false;
		if(!memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
			check= true;
		}
		return check;
	}
	public boolean employeeIdCheck(MemberVO memberVO)throws Exception{
		boolean check = false;
		memberVO=memberDAO.employeeIdCheck(memberVO);
		if(memberVO!=null) {
			check=true;
		}
		return check;
	}
	public boolean joinCheck(MemberVO memberVO)throws Exception{
		
		if(!this.idDuplicateCheck(memberVO)) {
			if(!this.employeeIdCheck(memberVO)) {
				return false;
			}
		};
		return true;
		
		
	}
	 

	 
	 
	public EmployeeStatusVO getEmployeeStatus(HttpSession session)throws Exception{

		EmployeeStatusVO employeeStatusVO = new EmployeeStatusVO();

		employeeStatusVO.setMemberId(this.getSessionAttribute(session).getId());

		employeeStatusVO=memberDAO.getEmployeeStatus(employeeStatusVO);
		if(employeeStatusVO==null) {
			return null;
		}
		employeeStatusVO =  Util4calen.setMonthVO(employeeStatusVO);
		return employeeStatusVO;

	}
	 
	public int setStatusUpdate(MemberVO memberVO, EmployeeStatusVO employeeStatusVO,WorkTimeVO workTimeVO, HttpSession session)throws Exception{
		int result =0;

		 
		 
		 
		 

		 
		 
		 

		 

		 
		String getstatus = employeeStatusVO.getStatus();


		 
		Timestamp nowTime = Util4calen.getNowTime();

		 
		employeeStatusVO = this.getEmployeeStatus(session);
		 
		workTimeVO.setMemberId(employeeStatusVO.getMemberId());
		workTimeVO=memberDAO.getDefaultWork(workTimeVO);

		 
		if(employeeStatusVO.getOnTime()==null) {

			employeeStatusVO.setOnTime(nowTime);
			Long diffTime = Util4calen.TimeDiff(nowTime,workTimeVO.getStartTime());
			if(diffTime>10) { 
				employeeStatusVO.setStatus("지각");
			}
			else {
				employeeStatusVO.setStatus(getstatus);
			}

		}
		 
		else {

			Long diffTime = Util4calen.TimeDiff(nowTime,workTimeVO.getFinishTime());

			employeeStatusVO.setOffTime(nowTime);	
			if(diffTime<0||diffTime>60) { 
				employeeStatusVO.setStatus(getstatus);
			}

			if(getstatus.equals("외근")) { 
				employeeStatusVO.setOffTime(Util4calen.getStatusTime(workTimeVO.getFinishTime(), employeeStatusVO.getReg()));
			}
		}

		result = memberDAO.setEmployeeStatusUpdate(employeeStatusVO);


		return result;
	}

	 
	public List<String> getEmployeeStatusBtn(EmployeeStatusVO employeeStatusVO, HttpSession session)throws Exception{
		employeeStatusVO =this.getEmployeeStatus(session);
		if(employeeStatusVO==null) {
			return null;
		}
		 
		WorkTimeVO workTimeVO  = new WorkTimeVO();
		workTimeVO.setMemberId(employeeStatusVO.getMemberId());
		workTimeVO=memberDAO.getDefaultWork(workTimeVO);

		Timestamp nowTime = Util4calen.getNowTime();
		List<String> ar = new ArrayList<>();
		 
		if(employeeStatusVO.getOnTime()==null) {

			ar.add("출근");
		}
		 
		else if(employeeStatusVO.getOffTime()==null){
			Long diffTime = Util4calen.TimeDiff(nowTime,workTimeVO.getFinishTime());

			if(diffTime<0) { 
				ar.add("조퇴");
				ar.add("외근");
			}
			else if(diffTime>60){
				ar.add("초과근무");
			}
			else {
				ar.add("퇴근");
			}
		}
		return ar;

	}

	 
	public List<EmployeeStatusVO>getEmployeeStatusList(EmployeeStatusVO employeeStatusVO, HttpSession session)throws Exception{
		employeeStatusVO.setMemberId(this.getSessionAttribute(session).getId());
		List<EmployeeStatusVO> ar =  memberDAO.getEmployeeStatusList(employeeStatusVO);
		 
		for(EmployeeStatusVO vo:ar) {
			vo = Util4calen.setMonthVO(vo);
		}

		return ar;
	}
	public List<EmployeeStatusVO>getEmployeeStatusList(MemberVO memberVO)throws Exception{
		EmployeeStatusVO employeeStatusVO = new EmployeeStatusVO();
		employeeStatusVO.setMemberId(memberVO.getId());
		List<EmployeeStatusVO> ar =  memberDAO.getEmployeeStatusList(employeeStatusVO);
		 
		for(EmployeeStatusVO vo:ar) {
			vo = Util4calen.setMonthVO(vo);
		}

		return ar;
	}
	 
	public List<String> getEmployeeStatusYears(List<EmployeeStatusVO> empEmployeeStatusVOs)throws Exception{
		List<String> ar = new  ArrayList<String>();
		 
		for(EmployeeStatusVO vo: empEmployeeStatusVOs) {
			ar.add(vo.getMonthVO().getYear());
		}
		Set<String> set = new HashSet<String>(ar);
		ar = new ArrayList<String>(set);
		return ar;
	}

	 
	public WorkTimeVO getDefaultWork(WorkTimeVO workTimeVO)throws Exception{
		return memberDAO.getDefaultWork(workTimeVO);
	}
	 
	public List<WorkTimeStatusVO> getWorkTimeStatusTotal(WorkTimeVO workTimeVO,EmployeeStatusVO employeeStatusVO, HttpSession session)throws Exception{
		MemberVO memberVO = this.getSessionAttribute(session);

		 
		workTimeVO.setMemberId(memberVO.getId());
		employeeStatusVO.setMemberId(memberVO.getId());
		 


 
 
 
		 
		List<EmployeeStatusVO> ar = this.getEmployeeStatusList(employeeStatusVO, session);
		List<MonthVO> monthList = new ArrayList<>();
		 
		for(EmployeeStatusVO vo:ar) {
			boolean check = true;
			if(monthList.size()>0) {
				for(MonthVO monthVO:monthList) {
					if(vo.getMonthVO().getYear().equals(monthVO.getYear())&&vo.getMonthVO().getMonth().equals(monthVO.getMonth())) {
						check=false;
						break;
					}
				}
				if(check) {
					monthList.add(vo.getMonthVO());
				}
			}
			else {
				monthList.add(vo.getMonthVO());
			}
		}
		 
		List<WorkTimeStatusVO> workTimeStatusVOs = new ArrayList<WorkTimeStatusVO>();
 
		for(MonthVO monthVO:monthList) {
			workTimeStatusVOs.add(this.setWorkTimeStatus(monthVO,employeeStatusVO,workTimeVO)); 
		}
		return workTimeStatusVOs;
		 
	}
	 
	public WorkTimeStatusVO setWorkTimeStatus(MonthVO monthVO,EmployeeStatusVO employeeStatusVO,WorkTimeVO workTimeVO)throws Exception{

		

 
		WorkTimeStatusVO workTimeStatusVO =new WorkTimeStatusVO();
		workTimeStatusVO.setMemberId(employeeStatusVO.getMemberId());

		 
		workTimeStatusVO.setMonthVO(monthVO);

		int year  = Integer.parseInt(monthVO.getYear()); 
		int month  = Integer.parseInt(monthVO.getMonth());

		LocalDate startDate = LocalDate.of(year, month, 1);
		LocalDate endDate = LocalDate.of(year, month+1, 1);

		workTimeStatusVO.setStartDate(startDate);
		workTimeStatusVO.setEndDate(endDate.minusDays(1));

		
		 
		List<LocalDate> dateList = new ArrayList<LocalDate>();
		 
		 
		
		Long defaultMin=0L;
		while(!startDate.getMonth().equals(endDate.getMonth())) {
			if(startDate.getDayOfWeek().getValue()>=6) {
				startDate= startDate.plusDays(1);
				continue;
			}
			dateList.add(startDate);
			
			workTimeVO.setRegDate(Util4calen.setLocalDateToDate(startDate)); 
			WorkTimeVO resultWorkTimeVO=memberDAO.getDefaultWorkFilter(workTimeVO);
			 
			
			if(resultWorkTimeVO!=null) {
				defaultMin += Util4calen.TimeDiff(resultWorkTimeVO);
				

			}
			startDate=startDate.plusDays(1);
		}
		
		
		 
 
 
 
 
		 
		Long defaultHour = defaultMin/60;
		workTimeStatusVO.setMonthTotalWork(defaultHour+"시간");
		 
		workTimeStatusVO.setTotalWork(defaultMin);
		 
		List<EmployeeStatusVO> ar = memberDAO.getWorkingList(workTimeStatusVO);
		workTimeStatusVO.setEmployeeStatusVOs(ar);

		Long workTime = 0L;
		Long overTime = 0L; 
		for(EmployeeStatusVO vo:ar) { 
			if (vo.getOffTime()!=null) {
				Long workTimeStatus= Util4calen.TimeDiff(vo);
				workTimeVO.setRegDate(vo.getReg());
				workTimeVO = memberDAO.getDefaultWorkFilter(workTimeVO);
				if(workTimeVO.isMealTime()&&workTimeStatus>300) {
					workTimeStatus-=60;
				}
				workTime = workTime+workTimeStatus;
				if(Util4calen.TimeDiff(workTimeVO.getStartTime(), vo.getOnTime())<0) {
					workTime = workTime+Util4calen.TimeDiff(vo.getOnTime(), workTimeVO.getStartTime());

				}
		
				if (vo.getStatus().equals("조퇴")) {
					workTimeStatusVO.setLeaveCount(workTimeStatusVO.getLeaveCount()+1);
				}
				else if(vo.getStatus().equals("지각")) {
					workTimeStatusVO.setLateCount(workTimeStatusVO.getLateCount()+1);
				}
				else if(vo.getStatus().equals("초과근무")) {
					if(Util4calen.TimeDiff(vo)>defaultMin) {
						 
						workTimeStatusVO.setOverWorkCount(workTimeStatusVO.getOverWorkCount()+1);
						Time defaultFinishTime = workTimeVO.getFinishTime();
						overTime += Util4calen.TimeDiff(defaultFinishTime, vo.getOffTime());
					}
				}
			}
		}
		Long workHour = workTime /60;
		Long workMin = workTime %60;
		Long overH = overTime/60;
		Long overM = overTime%60;
		workTimeStatusVO.setStatusWork(workTime);
		workTimeStatusVO.setMonthStatusWork(workHour+":"+workMin);
		workTimeStatusVO.setOverWorkTime(overH+":"+overM);

		return workTimeStatusVO;
	}
}
