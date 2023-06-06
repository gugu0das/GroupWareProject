package com.ware.group.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface MemberDAO {

	public List<MemberVO> getMembers() throws Exception;
	
	public List<MemberVO> getStatusMembers() throws Exception;
	
	public int setMemberJoin(MemberVO memberVO) throws Exception;
	
	public List<JobVO> getJobList()throws Exception;
	
	public MemberVO idDuplicateCheck(MemberVO memberVO)throws Exception;
	
	public MemberVO getMemberLogin(MemberVO memberVO)throws Exception;
	
	public int setMemberRole(Map<String, Object> map)throws Exception;
	
	public MemberVO getMemberProfile(MemberVO memberVO)throws Exception;
	
	public int setMemberUpdate(MemberVO memberVO) throws Exception;
	
	public int setPasswordUpdate(MemberVO memberVO)throws Exception;
	
	
	///근태관리
	public WorkTimeVO getDefaultWork(WorkTimeVO workTimeVO)throws Exception;
	
	public EmployeeStatusVO getEmployeeStatus(EmployeeStatusVO employeeStatusVO) throws Exception;

	public List<EmployeeStatusVO> getWorkIsEmpty(EmployeeStatusVO employeeStatusVO)throws Exception;
	
	public int setWorkNullDelete(EmployeeStatusVO employeeStatusVO)throws Exception;
	public int setWorkEmptyUpdate(EmployeeStatusVO employeeStatusVO)throws Exception;
	
	public int setDefaultWorkAdd(WorkTimeVO workTimeVO)throws Exception;
	public int setDefaultWorkUpdate(WorkTimeVO workTimeVO)throws Exception;

	public int setEmployeeStatusUpdate(EmployeeStatusVO employeeStatusVO)throws Exception;
	public int setTimeStempInsert(EmployeeStatusVO employeeStatusVO) throws Exception;
	public List<EmployeeStatusVO> getNotOffTimeEmployee(EmployeeStatusVO employeeStatusVO)throws Exception;
	
	
}
