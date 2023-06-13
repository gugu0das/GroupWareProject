package com.ware.group.member;

import java.sql.Date;
import java.sql.Time;

import com.ware.group.common.Util4calen;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WorkTimeVO {

	private Long id;
	private Time startTime;
	private Time finishTime;
	private boolean mealTime;
	private Date regDate;
	private Long memberId;
	
	private String startTimeString;
	private String finishTimeString;
	
	
	
	
	public String getStartTimeString() {
		return startTimeString;
	}
	public void setStartTimeString(String startTimeString) {
		this.startTimeString = startTimeString;
		if(this.startTime==null) {
			try {
				this.startTime = Util4calen.setTimeFormat(startTimeString);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public String getFinishTimeString() {
		return finishTimeString;
	}
	public void setFinishTimeString(String finishTimeString) {
		this.finishTimeString = finishTimeString;
		if(this.finishTime==null) {
			try {
				this.finishTime = Util4calen.setTimeFormat(finishTimeString);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
