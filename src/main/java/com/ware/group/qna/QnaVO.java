package com.ware.group.qna;

import java.sql.Date;
import java.util.List;

import com.ware.group.member.MemberVO;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class QnaVO {
	
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
	private List<QnaFileVO> boardFileVOs;
	//댓글 갯수 리스트에 뜨게 하기
	private Long count;
	private MemberVO memberVO;
	
}
