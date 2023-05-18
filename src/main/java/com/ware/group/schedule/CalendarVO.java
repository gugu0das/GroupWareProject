package com.ware.group.schedule;

import java.util.List;

public class CalendarVO {

    private String  calendar_date;    	//  날짜
    private Integer calendar_dd;
    private Integer calendar_dayofweek;
    private List<?> list;
    
	public String getCalendar_date() {
		return calendar_date;
	}
	
	public List<?> getList() {
		return list;
	}
	
	public Integer getCalendar_dd() {
		return calendar_dd;
	}

	public void setCalendar_dd(Integer calendar_dd) {
		this.calendar_dd = calendar_dd;
	}

	public void setCalendar_date(String calendar_date) {
		this.calendar_date = calendar_date;
	}
	
	public Integer getCalendar_dayofweek() {
		return calendar_dayofweek;
	}

	public void setCalendar_dayofweek(Integer calendar_dayofweek) {
		this.calendar_dayofweek = calendar_dayofweek;
	}

	public void setList(List<?> list) {
		this.list = list;
	}
}