package com.ware.group.qna;

import java.sql.Date;

import com.ware.group.member.MemberVO;

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
	private Long ref;
	private Long step;
	private Long depth;
	private Long master;
	private MemberVO memberVO;
}
