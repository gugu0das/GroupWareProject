package com.ware.group.schedule;

import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CalendarVO {

    private String  calendar_date;    	//  날짜
    private Integer calendar_dd;
    private Integer calendar_dayofweek;
    private List<?> list;
}