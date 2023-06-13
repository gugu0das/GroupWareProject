package com.ware.group.member;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import com.ware.group.schedule.MonthVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmployeeStatusVO {
	
		private SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");

		private Long id;
		private Date reg;
		private Timestamp onTime;
		private Timestamp offTime;
		private String status;
		private Long memberId;
		
		private String strOnTime;
		private String strOffTime;
		
		private MonthVO monthVO;
		public String getStrOnTime() {
			if(this.onTime!=null) {
				return format.format(this.onTime);
			}
			return "출근전";
		}
		public void setStrOnTime(String strOnTime) {
			this.strOnTime = strOnTime;
		}
		public String getStrOffTime() {
			if(this.offTime!=null) {
				return format.format(this.offTime);				
			}
			return "퇴근전";
		}
		public void setStrOffTime(String strOffTime) {
			this.strOffTime = strOffTime;
		}
		
	
}
