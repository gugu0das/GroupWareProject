package com.ware.group.annual;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AnnualVO {

	private Long id;
	private Long count;
	private Long type;
	private Date reg;
	private Long memberId;
	
}
