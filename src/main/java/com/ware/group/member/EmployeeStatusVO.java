package com.ware.group.member;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
		
		
		public String getStrOnTime() {
			
			return format.format(this.onTime);
			
		}
		public void setStrOnTime(String strOnTime) {
			this.strOnTime = strOnTime;
		}
		public String getStrOffTime() {
			return format.format(this.offTime);
		}
		public void setStrOffTime(String strOffTime) {
			this.strOffTime = strOffTime;
		}
		
		
	
}
