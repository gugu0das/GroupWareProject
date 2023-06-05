package com.ware.group.schedule;

import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CalendarVO {

    private String  calendardate;    	//  날짜
    private Integer calendardd;
    private Integer calendardayofweek;
    private List<?> list;
}