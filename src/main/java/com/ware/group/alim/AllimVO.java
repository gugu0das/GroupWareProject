package com.ware.group.alim;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AllimVO {
	
	private Long id;
	private Long memberId;
	private Integer type;
	private Date startDate;
	private Date checkDate;
	private Integer checkYn;
	private Long qnaId;
	
}
