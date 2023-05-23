package com.ware.group.qna;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QnaCommentVO {
			
	private Long id;
	private Long qnaId;
	private String contents;
	private String writer;
	private Date regDate;
}
