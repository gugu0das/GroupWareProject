package com.ware.group.util;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Pager {
	private String kind;
	private String search;
	private Long page;
	private Long perPage;
	private Long startRow; 
	private Long perBlock;
	private Long totalPage;
	private Long startNum;
	private Long lastNum;
	
	private boolean important;
	
	//qna댓글로 인해 추가
	private Long qnaId;
	
	private Long ref;
	
	private Long memberId;
	
	private Long categoryId;
	
	private boolean before;
	private boolean after;
	
	public void makeNum(Long totalCount) {
		this.totalPage = totalCount / this.getPerPage();
		if(totalCount % this.getPerPage() != 0 ) {
			totalPage++;		
		}
		
		if(this.getPage() > totalPage) {
			this.setPage(totalPage);
		}
		
		Long totalBlock = totalPage / this.getPerBlock();
		if(totalPage % this.getPerBlock() != 0) {
			totalBlock++;
		}

		Long curBlock = this.getPage() / this.getPerBlock();
		 
		if(this.getPage() % this.getPerBlock() != 0) {
			curBlock++;
		}
		 
		this.startNum =(curBlock - 1) * this.getPerBlock() + 1;
		this.lastNum = curBlock * this.getPerBlock();
		 
		this.after = true;
		//이것 때문에 현재 페이지에서 무조건 그거에 갯수에 맞게 되고 이걸 빼면 자기가 원하는 갯수가된다
		if(curBlock == totalBlock) {
			lastNum = totalPage;
			this.after = false;
		}
		 if(curBlock == 1) {
			 this.before = true;
		 }
	}
	
	public void makeStartRow() {
		this.startRow = (this.getPage() - 1) * this.getPerPage();
	}
	
	public Long getPage() {
		if(this.page == null || this.page == 0) {
			this.page = 1L;
		}
		return this.page;
	}
	
	public Long getPerPage() {
		if(this.perPage == null || this.perPage == 0) {
			this.perPage = 10L;
		}
		return this.perPage;
	}
	
	public Long getPerBlock() {
		if(this.perBlock == null || this.perBlock < 1) {
			this.perBlock = 5L;
		}
		return perBlock;
	}
	
	public String getSearch() {
		if (search == null) {
			search = "";
		}
		return search;
	}
}


