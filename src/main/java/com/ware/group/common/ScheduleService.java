package com.ware.group.common;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.ware.group.member.EmployeeStatusVO;
import com.ware.group.member.MemberDAO;
import com.ware.group.member.MemberService;
import com.ware.group.member.MemberVO;
import com.ware.group.member.WorkTimeVO;



@EnableScheduling //scheduled를 사용하기 위한 어노테이션 
@Service
public class ScheduleService {

	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	MemberService memberService;
	//비어있는 근태 생성
		public int testTimeStempInsert(MemberVO memberVO, EmployeeStatusVO employeeStatusVO, HttpSession httpSession)throws Exception{
			employeeStatusVO.setMemberId(memberService.getSessionAttribute(httpSession).getId());

			return memberDAO.setTimeStempInsert(employeeStatusVO);
		}
		//비어있는 근태 생셩 매일 반복
		//휴일에 근무하는 회사도 있을 수 있음
//		@Scheduled(cron = "0 0 7 * * *", zone = "Asia/Seoul") //매일 7시에 근태 생성
//		@Scheduled(cron = "1 * * * * *", zone = "Asia/Seoul") //test 1분마다 01초에 실행
		public void setEmployeeWeekStatus() throws Exception{
			
			//근무 가능한 사원들 리스트
			List<MemberVO> ar = memberDAO.getStatusMembers();
			for(MemberVO memberVO:ar) {
				EmployeeStatusVO employeeStatusVO = new EmployeeStatusVO();
				employeeStatusVO.setMemberId(memberVO.getId());
				// 1. 근무 안했으면 비어있는 근태지우기
				memberDAO.setWorkNullDelete(employeeStatusVO);
				
				// 2. 근무의 퇴근을 찍지 않은 데이터를 근무시간 off_TIme으로 지정하여 update
				WorkTimeVO workTimeVO = new WorkTimeVO();
				workTimeVO.setMemberId(memberVO.getId());
				workTimeVO=memberDAO.getDefaultWork(workTimeVO);//기본근무시간
				List<EmployeeStatusVO> offData = memberDAO.getNotOffTimeEmployee(employeeStatusVO);
				if(offData!=null) {
					for(EmployeeStatusVO vo:offData) {
						vo.setOffTime(Util4calen.getStatusTime(workTimeVO.getFinishTime(),vo.getReg())); 
						memberDAO.setWorkEmptyUpdate(vo);
					}
				}
//				Timestamp timestamp = Util4calen.getStatusTime(defaultWork.getOffTime(), null);
				
				// 3. 비어있는 근무 만들기.
				//	-오늘날짜로 근무한 내역이 있는지 확인 
				List<EmployeeStatusVO> works = memberDAO.getWorkIsEmpty(employeeStatusVO);
				if(works.size()>0) {
					continue;
				}
				memberDAO.setTimeStempInsert(employeeStatusVO);
				
			}
			
			
		}
}
