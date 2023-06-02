package com.ware.group.common;

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

			return memberDAO.testTimeStempInsert(employeeStatusVO);
		}
		//비어있는 근태 생셩 매일 반복
		//휴일에 근무하는 회사도 있을 수 있음
//		@Scheduled(cron = "0 0 7 * * *", zone = "Asia/Seoul") 매일 7시에 근태 생성
		@Scheduled(cron = "1 * * * * *", zone = "Asia/Seoul") //test 1분마다 01초에 실행
		public void setEmployeeWeekStatus() throws Exception{
			System.out.println("스케줄 실행");
			//근무 가능한 사원들 리스트
			List<MemberVO> ar = memberDAO.getStatusMembers();
			for(MemberVO memberVO:ar) {
				EmployeeStatusVO employeeStatusVO = new EmployeeStatusVO();
				employeeStatusVO.setMemberId(memberVO.getId());
				// 1. 근무 안했으면 비어있는 근태지우기
				memberDAO.setWorkNullDelete(employeeStatusVO);
				
				//2. 비어있는 근무 만들기.
				//	-오늘날짜로 근무한 내역이 있는지 확인 
				List<EmployeeStatusVO> works = memberDAO.getWorkIsEmpty(employeeStatusVO);
				if(works.size()>0) {
					continue;
				}
				memberDAO.testTimeStempInsert(employeeStatusVO);
				
			}
			
			System.out.println("스케줄 실행와ㅏㄴ료");
		}
}
