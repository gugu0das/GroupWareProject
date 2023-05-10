package com.ware.group.notice;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeVO {
	
	private Long noticeNum;
	//@NotBlank
	//@Size(min = 5, max = 20)
	private String title;
	private String contentS;
	//@NotBlank
	private String writer;
	private Date regDate;
	private Long hit;
	//private List<BoardFileVO> boardFileVOs;
}


