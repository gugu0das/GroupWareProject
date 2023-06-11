package com.ware.group.member;

import java.sql.Date;
import java.sql.Time;

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
}
