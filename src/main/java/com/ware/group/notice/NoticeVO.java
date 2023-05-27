package com.ware.group.notice;

import java.sql.Date;
import java.util.List;



import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeVO {
	
	private Long id;
	private Long memberId;
	//@NotBlank
	//@Size(min = 5, max = 20)
	private String title;
	private String contents;
	//@NotBlank
	private String writer;
	private Date regDate;
	private Long hit;
	private List<NoticeFileVO> boardFileVOs;
	private boolean important;
}


