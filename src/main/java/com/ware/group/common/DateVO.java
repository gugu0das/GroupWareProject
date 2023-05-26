package com.ware.group.common;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DateVO {
    private int year;
    private int month;
    private int day;
    private String date, week;
    private boolean istoday = false;
    private List<?> list;
}
