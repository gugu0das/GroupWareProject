package com.ware.group.schedule;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScheVO {

    private String  id,					//일정번호
				    title,				//일정명
				    startdate,			//시작일
				    starthour,			//시작일-시간
				    startminute,		//시작일-분
				    enddate,			//종료일
				    endhour,			//종료일-시간
				    endminute,			//종료일-분
				    repeattype,			//반복
				    repeattype_nm,
				    repeatoption,		//반복 옵션- 주
				    repeatend,			//반복종료
				    content,			//내용
				    usernum,			//사용자번호
				    username;
    
    private int 	type,				//구분
    				isopen;				//공개여부
}