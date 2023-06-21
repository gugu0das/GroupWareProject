package com.ware.group.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ware.group.annual.AnnualVO;
import com.ware.group.annual.LeaveRecordVO;
import com.ware.group.schedule.HolidayVO;
import com.ware.group.schedule.ScheDetailVO;



@Mapper
public interface MemberDAO {

	public List<MemberVO> getMembers() throws Exception;
	//인사팀용 맴버리스트
	public List<MemberVO> getMemberList()throws Exception;
	
	public List<MemberVO> getStatusMembers(WorkTimeVO workTimeVO) throws Exception;
	
	public int setMemberJoin(MemberVO memberVO) throws Exception;
	
	public List<JobVO> getJobList()throws Exception;
	
	public int setJobAdd(JobVO jobVO)throws Exception;
	
	public int setJobDelete(JobVO jobVO)throws Exception;
	
	public MemberVO idDuplicateCheck(MemberVO memberVO)throws Exception;
	
	public MemberVO employeeIdCheck(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberLogin(MemberVO memberVO)throws Exception;
	
	public int setMemberRole(Map<String, Object> map)throws Exception;
	
	public MemberVO getMemberProfile(MemberVO memberVO)throws Exception;
	
	public MemberVO getMemberDetail(MemberVO memberVO)throws Exception;
	
	public int setMemberUpdate(MemberVO memberVO) throws Exception;
	
	public int setPasswordUpdate(MemberVO memberVO)throws Exception;
	
	public int setPasswordUpdateinit(MemberVO memberVO)throws Exception;
	
	public int setMemberUpdateDetail(MemberVO memberVO)throws Exception;
	
	public MemberProfileVO getProfile(MemberProfileVO memberProfileVO)throws Exception;
	
	public int setProfileAdd(MemberProfileVO memberProfileVO)throws Exception;
	
	public int setProfileDelete(MemberProfileVO memberProfileVO)throws Exception;
	
	
	///근태관리
	public WorkTimeVO getDefaultWork(WorkTimeVO workTimeVO)throws Exception;
	//근태 모든 리스트 가져올때 사용
	public WorkTimeVO getDefaultWorkFilter(WorkTimeVO workTimeVO)throws Exception;

	public EmployeeStatusVO getEmployeeStatus(EmployeeStatusVO employeeStatusVO) throws Exception;

	public List<EmployeeStatusVO> getWorkIsEmpty(EmployeeStatusVO employeeStatusVO)throws Exception;

	public List<EmployeeStatusVO> getEmployeeStatusList(EmployeeStatusVO employeeStatusVO)throws Exception;
	
	public int setWorkNullDelete(EmployeeStatusVO employeeStatusVO)throws Exception;
	
	public int setWorkEmptyUpdate(EmployeeStatusVO employeeStatusVO)throws Exception;
	
	public int setDefaultWorkAdd(WorkTimeVO workTimeVO)throws Exception;
	
	public int setDefaultWorkUpdate(WorkTimeVO workTimeVO)throws Exception;
	
	public int setEmployeeStatusUpdate(EmployeeStatusVO employeeStatusVO)throws Exception;
	
	public int setTimeStempInsert(EmployeeStatusVO employeeStatusVO) throws Exception;
	
	public int setLeaveRecordUpdate(LeaveRecordVO leaveRecordVO)throws Exception;
	public List<EmployeeStatusVO> getNotOffTimeEmployee(EmployeeStatusVO employeeStatusVO)throws Exception;
//	이번달 근태기록
	public List<EmployeeStatusVO> getWorkingList(WorkTimeStatusVO workTimeStatusVO)throws Exception;
// 공휴일 가져오기
	public List<ScheDetailVO> getHolidayList(HolidayVO holidayVO)throws Exception;
	//연차 유무
	public LeaveRecordVO getHolidays(EmployeeStatusVO employeeStatusVO) throws Exception;
	
	public List<LeaveRecordVO> getLeaveRecodeList(MemberVO memberVO)throws Exception;
	
	public int setAnnualUpdate(AnnualVO annualVO)throws Exception;
	
	public int setAnnualAdd(MemberVO memberVO)throws Exception;
	
	public AnnualVO getAnnual(MemberVO memberVO)throws Exception;
	
	//연차 추가
	public int setVacation(EmployeeStatusVO employeeStatusVO)throws Exception;

}
