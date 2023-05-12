package com.ware.group.qna;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class QnaVO {
	
	private Long qnaNum;
	private String id;
	//@NotBlank
	//@Size(min = 5, max = 20)
	private String title;
	private String contents;
	//@NotBlank
	private String writer;
	private Date regDate;
	private Long hit;
	private Long ref;
	private Long step;
	private Long depth;

}
