package com.ware.group.member;

import java.time.LocalDate;
import java.util.List;

import com.ware.group.schedule.MonthVO;

import lombok.Getter;
import lombok.Setter;

/*
1. 이번달 총 근무해야 할 시간.
2. 이번달 근무한 시간

*/
@Getter
@Setter
public class WorkTimeStatusVO {

	//년 월 
	private MonthVO monthVO;
	//해당 월의 전제 근무
	private String monthTotalWork;
	//해당 월의 근무내역 시간
	private String monthStatusWork;
	
	private Long totalWork;
	private Long StatusWork;
	
	private Long memberId;
	private LocalDate startDate;
	private LocalDate endDate;
	

	private int leaveCount;
	private int lateCount;
	private int overWorkCount;
	//초과근무한 시간
	private String overWorkTime;
	
	private List<EmployeeStatusVO>employeeStatusVOs;
	
	
	private Long persent;
	public Long getPersent() {
		this.persent = this.StatusWork*100/(this.totalWork);
		return persent;
	}
	public void setPersent(Long persent) {
		this.persent = persent;
	}
	
	
}
