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
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.annual.LeaveRecordVO;
import com.ware.group.common.Util4calen;
import com.ware.group.schedule.HolidayVO;
import com.ware.group.schedule.MonthVO;
import com.ware.group.schedule.ScheService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService implements UserDetailsService{

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private PasswordEncoder passwordEncoder;


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub

		MemberVO memberVO = new MemberVO();
		memberVO.setAccountId(username);
		try {
			memberVO = memberDAO.getMemberLogin(memberVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return memberVO;
	}

	//session에 있는 Member정보의 일부분 받기
	public MemberVO getSessionAttribute(HttpSession session)throws Exception{
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		//id,accountID
		return memberVO;
	}

	//profile
	public MemberVO getMemberProfile(MemberVO memberVO, HttpSession session) throws Exception{

		memberVO = this.getSessionAttribute(session);
		memberVO = memberDAO.getMemberProfile(memberVO);
		//기본근무시간 추가
		WorkTimeVO workTimeVO = new WorkTimeVO();
		workTimeVO.setMemberId(memberVO.getId());
		workTimeVO= memberDAO.getDefaultWork(workTimeVO);

		memberVO.setWorkTimeVO(workTimeVO);
		return memberVO;
	}
	//detail
		public MemberVO getMemberDetail(MemberVO memberVO) throws Exception{

			
			memberVO = memberDAO.getMemberDetail(memberVO);
			//근무시간
			WorkTimeVO workTimeVO = new WorkTimeVO();
			workTimeVO.setMemberId(memberVO.getId());
			workTimeVO= memberDAO.getDefaultWork(workTimeVO);

			memberVO.setWorkTimeVO(workTimeVO);
			//연차 사용내역
			memberVO.setLeaveRecordVOs(memberDAO.getLeaveRecodeList(memberVO));
			
			return memberVO;
		}
//유저용
	public List<MemberVO> getMembers()throws Exception{
		return memberDAO.getMembers();
	}
	
	//인사팀용
	public List<MemberVO> getMemberList()throws Exception{
		return memberDAO.getMemberList();
	}
	//1 유저업데이트
	public int setMemberUpdateDetail(MemberVO memberVO,WorkTimeVO workTimeVO)throws Exception{
		workTimeVO.setMemberId(memberVO.getId());
		int result = memberDAO.setMemberUpdateDetail(memberVO);
		WorkTimeVO defultWork = memberDAO.getDefaultWork(workTimeVO);
		//Date = 비교
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
	
	//3. 근태업데이트
	public int setEmployeeStatusUpdate(EmployeeStatusVO employeeStatusVO)throws Exception{
		employeeStatusVO.setOnTime(Util4calen.setTimeStampFormat(employeeStatusVO.getStrOnTime(), employeeStatusVO.getReg()));
		employeeStatusVO.setOffTime(Util4calen.setTimeStampFormat(employeeStatusVO.getStrOffTime(), employeeStatusVO.getReg()));
		
		int result = memberDAO.setEmployeeStatusUpdate(employeeStatusVO);
		return result;
	}
	//4. 연차 업데이트
	public int setLeaveRecordUpdate(LeaveRecordVO leaveRecordVO)throws Exception{
		int result = memberDAO.setLeaveRecordUpdate(leaveRecordVO);
		return result;
	}

//--인사팀 END
	public int setMemeberJoin(MemberVO memberVO,WorkTimeVO workTimeVO)throws Exception{

		
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		int result =memberDAO.setMemberJoin(memberVO);
		
		//		role insert하기 
		Map<String, Object> map = new HashMap<>();
		map.put("roleId", 3);
		map.put("memberId", memberVO.getId());
		result =  memberDAO.setMemberRole(map);
		
		
		//default workTimeVo 넣기
		workTimeVO.setMemberId(memberVO.getId());
		workTimeVO.setRegDate(memberVO.getHireDate());
		memberDAO.setDefaultWorkAdd(workTimeVO);

		return result;
	}

	//password change
	public int setPasswordUpdate(MemberVO memberVO,HttpSession session,BindingResult bindingResult)throws Exception{
		int result = 0; 
		//1. session Memeber 꺼내기
		memberVO.setAccountId(this.getSessionAttribute(session).getAccountId());

		//2, pw체크
		boolean check = this.pwCheck(memberVO);
		if(!check) {//false면 pw두개가 같음
			memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));

			result =  memberDAO.setPasswordUpdate(memberVO);//false일때 비번 변경

			//			bindingResult.rejectValue("passwordCheck", "member.password.notEqual");

		}
		return result;

	}
	//init PasswordChange
	public int setPasswordUpdate(MemberVO memberVO)throws Exception{
		
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		int sresult =  memberDAO.setPasswordUpdateinit(memberVO);
		return sresult;

	}
	
	
	public List<JobVO> getJobList()throws Exception{
		return memberDAO.getJobList();

	}
	public int setJobAdd(JobVO jobVO)throws Exception{
		return memberDAO.setJobAdd(jobVO);
		
	}
	public MemberVO getMemberLogin(MemberVO memberVO)throws Exception{
		return memberDAO.getMemberLogin(memberVO);

	}

	public int setMemberUpdate(MemberVO memberVO)throws Exception{
		return memberDAO.setMemberUpdate(memberVO);
	}
	// 검증----------------------------------------------------------------
	// id중복   true면 중복
	public boolean idDuplicateCheck(MemberVO memberVO)throws Exception{

		boolean check = false;

		memberVO=memberDAO.idDuplicateCheck(memberVO);
		if(memberVO==null) {
			check=true;
		}
		return check;
	}
	//pw체크 pw두개가 같으면 false 다르면 true
	public boolean pwCheck(MemberVO memberVO)throws Exception{
		boolean check = false;
		if(!memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
			check= true;
		}
		return check;
	}
	//검증 END------------------------------------------------

	//	EmployeeStatus 근태관련
	//	근태조회
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
	//근태 업데이트
	public int setStatusUpdate(MemberVO memberVO, EmployeeStatusVO employeeStatusVO,WorkTimeVO workTimeVO, HttpSession session)throws Exception{
		int result =0;

		//1. 빈테이블이면 출근버튼만 활성화 
		//2. 근무시간이 초과하면 알아서 
		//3. 근무시간 초과 전에 버튼 누르면 외근, 조퇴 로 status='외근','조퇴'받음
		//4. if 조퇴 = 그상태로 status 조퇴로 끝

		//		---외출X 회사에선 외출개념이 아니라 외근느낌
		//
		//--------------------------------------------------------------

		//DB status에 나오는 것 :출근,지각, 초과근무, 외근, 조퇴   

		// form 에서 받아온 status : 외근인지, 조퇴인지 등
		String getstatus = employeeStatusVO.getStatus();


		//현재시간
		Timestamp nowTime = Util4calen.getNowTime();

		// 현재 있는 근태 가져오기(오늘날짜)
		employeeStatusVO = this.getEmployeeStatus(session);
		//기본 근무시간 가져오기
		workTimeVO.setMemberId(employeeStatusVO.getMemberId());
		workTimeVO=memberDAO.getDefaultWork(workTimeVO);

		// 1. 출근 안했을시 
		if(employeeStatusVO.getOnTime()==null) {

			employeeStatusVO.setOnTime(nowTime);
			Long diffTime = Util4calen.TimeDiff(nowTime,workTimeVO.getStartTime());
			if(diffTime>10) {//기본시간보다 10분이 지나면
				employeeStatusVO.setStatus("지각");
			}
			else {
				employeeStatusVO.setStatus(getstatus);
			}

		}
		//2. 출근상태일때
		else {

			Long diffTime = Util4calen.TimeDiff(nowTime,workTimeVO.getFinishTime());

			employeeStatusVO.setOffTime(nowTime);	
			if(diffTime<0||diffTime>60) {//근무시간을 지나지 않았을때 혹은 근무시간이 지나고 1시간이 지났을때
				employeeStatusVO.setStatus(getstatus);
			}

			if(getstatus.equals("외근")) {//외근은 정상퇴근
				employeeStatusVO.setOffTime(Util4calen.getStatusTime(workTimeVO.getFinishTime(), employeeStatusVO.getReg()));
			}
		}

		result = memberDAO.setEmployeeStatusUpdate(employeeStatusVO);


		return result;
	}

	//	근태 버튼 생성
	public List<String> getEmployeeStatusBtn(EmployeeStatusVO employeeStatusVO, HttpSession session)throws Exception{
		employeeStatusVO =this.getEmployeeStatus(session);
		if(employeeStatusVO==null) {
			return null;
		}
		//근무할 시간 가져오기(기본 근무시간)
		WorkTimeVO workTimeVO  = new WorkTimeVO();
		workTimeVO.setMemberId(employeeStatusVO.getMemberId());
		workTimeVO=memberDAO.getDefaultWork(workTimeVO);

		Timestamp nowTime = Util4calen.getNowTime();
		List<String> ar = new ArrayList<>();
		// 1. 출근 안했을시 
		if(employeeStatusVO.getOnTime()==null) {

			ar.add("출근");
		}
		//2. 출근상태일때
		else if(employeeStatusVO.getOffTime()==null){
			Long diffTime = Util4calen.TimeDiff(nowTime,workTimeVO.getFinishTime());

			if(diffTime<0) {//근무시간을 지나지 않았을때 혹은 근무시간이 지나고 1시간이 지났을때
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

	//출근이력리스트
	public List<EmployeeStatusVO>getEmployeeStatusList(EmployeeStatusVO employeeStatusVO, HttpSession session)throws Exception{
		employeeStatusVO.setMemberId(this.getSessionAttribute(session).getId());
		List<EmployeeStatusVO> ar =  memberDAO.getEmployeeStatusList(employeeStatusVO);
		//monthVO데이터값 넣기
		for(EmployeeStatusVO vo:ar) {
			vo = Util4calen.setMonthVO(vo);
		}

		return ar;
	}
	public List<EmployeeStatusVO>getEmployeeStatusList(MemberVO memberVO)throws Exception{
		EmployeeStatusVO employeeStatusVO = new EmployeeStatusVO();
		employeeStatusVO.setMemberId(memberVO.getId());
		List<EmployeeStatusVO> ar =  memberDAO.getEmployeeStatusList(employeeStatusVO);
		//monthVO데이터값 넣기
		for(EmployeeStatusVO vo:ar) {
			vo = Util4calen.setMonthVO(vo);
		}

		return ar;
	}
	//출근 이력이 있는 년도 불러오기
	public List<String> getEmployeeStatusYears(List<EmployeeStatusVO> empEmployeeStatusVOs)throws Exception{
		List<String> ar = new  ArrayList<String>();
		//중복 제거
		for(EmployeeStatusVO vo: empEmployeeStatusVOs) {
			ar.add(vo.getMonthVO().getYear());
		}
		Set<String> set = new HashSet<String>(ar);
		ar = new ArrayList<String>(set);
		return ar;
	}

	//현재 근무시간
	public WorkTimeVO getDefaultWork(WorkTimeVO workTimeVO)throws Exception{
		return memberDAO.getDefaultWork(workTimeVO);
	}
	//이번달 총 시간 
	public List<WorkTimeStatusVO> getWorkTimeStatusTotal(WorkTimeVO workTimeVO,EmployeeStatusVO employeeStatusVO, HttpSession session)throws Exception{
		MemberVO memberVO = this.getSessionAttribute(session);

		//memberId넣기
		workTimeVO.setMemberId(memberVO.getId());
		employeeStatusVO.setMemberId(memberVO.getId());
		//------------------------


//		workTimeVO=memberDAO.getDefaultWork(workTimeVO);
//		// 1일당 근무해야 하는 시간 -> 분
//		Long defaultMin = Util4calen.TimeDiff(workTimeVO);
		//근무 한 년 월 내역 가져오기 
		List<EmployeeStatusVO> ar = this.getEmployeeStatusList(employeeStatusVO, session);
		List<MonthVO> monthList = new ArrayList<>();
		//중복체크
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
		//monthVO마다 각 월의 데이터들 반환
		List<WorkTimeStatusVO> workTimeStatusVOs = new ArrayList<WorkTimeStatusVO>();
//		WorkTimeStatusVO workTimeStatusVO = this.setWorkTimeStatus(monthList.get(0),employeeStatusVO,workTimeVO);
		for(MonthVO monthVO:monthList) {
			workTimeStatusVOs.add(this.setWorkTimeStatus(monthVO,employeeStatusVO,workTimeVO)); 
		}
		return workTimeStatusVOs;
		//캘린더에서 총 평일만 가져와 각 8시간씩 
	}
	//MonthVO 년 월 가지고 해당 근무의 WorkTimeStatusVO가져오기
	public WorkTimeStatusVO setWorkTimeStatus(MonthVO monthVO,EmployeeStatusVO employeeStatusVO,WorkTimeVO workTimeVO)throws Exception{

		

//		
		WorkTimeStatusVO workTimeStatusVO =new WorkTimeStatusVO();
		workTimeStatusVO.setMemberId(employeeStatusVO.getMemberId());

		// 1. MonthVO 넣기
		workTimeStatusVO.setMonthVO(monthVO);

		int year  = Integer.parseInt(monthVO.getYear()); 
		int month  = Integer.parseInt(monthVO.getMonth());

		LocalDate startDate = LocalDate.of(year, month, 1);
		LocalDate endDate = LocalDate.of(year, month+1, 1);

		workTimeStatusVO.setStartDate(startDate);
		workTimeStatusVO.setEndDate(endDate.minusDays(1));

		
		//주말을 뺀 평일리스트
		List<LocalDate> dateList = new ArrayList<LocalDate>();
		// 2. monthTotalWork 넣기
		//		주말 및 공휴일 일 수 구하기
		
		Long defaultMin=0L;
		while(!startDate.getMonth().equals(endDate.getMonth())) {
			if(startDate.getDayOfWeek().getValue()>=6) {
				startDate= startDate.plusDays(1);
				continue;
			}
			dateList.add(startDate);
			
			workTimeVO.setRegDate(Util4calen.setLocalDateToDate(startDate));//employeeStatus의 해당 날짜 대입시키기
			WorkTimeVO resultWorkTimeVO=memberDAO.getDefaultWorkFilter(workTimeVO);
			// 1일당 근무해야 하는 시간 -> 분
			
			if(resultWorkTimeVO!=null) {
				defaultMin += Util4calen.TimeDiff(resultWorkTimeVO);
				

			}
			startDate=startDate.plusDays(1);
		}
		
		
		//  hoilday 가져와서 일수 더 빼기
//		HolidayVO holidayVO = new HolidayVO();
//		holidayVO.setHolMonth(month);
//		int totalCount  = dateList.size()-memberDAO.getHolidayList(holidayVO).size();
//		final int defaultHour= ((Long.valueOf(defaultMin).intValue()/60)*totalCount);
		// 일수 시간으로 게산 default*totalCount
		Long defaultHour = defaultMin/60;
		workTimeStatusVO.setMonthTotalWork(defaultHour+"시간");
		//Persent계산시 필요
		workTimeStatusVO.setTotalWork(defaultMin);
		//3. monthStatusWork 넣기
		List<EmployeeStatusVO> ar = memberDAO.getWorkingList(workTimeStatusVO);
		workTimeStatusVO.setEmployeeStatusVOs(ar);

		Long workTime = 0L;
		Long overTime = 0L;//분
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
						//근무시간이 기본근무시간을 초과하면
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
