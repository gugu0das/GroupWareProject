package com.ware.group.schedule;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScheVO {

    private String  id,					//일정번호
				    title,				//일정명
				    type,				//구분
				    start_date,			//시작일
				    start_hour,			//시작일-시간
				    start_minute,		//시작일-분
				    end_date,			//종료일
				    end_hour,			//종료일-시간
				    end_minute,			//종료일-분
				    repeat_type,		//반복
				    repeat_type_nm,
				    repeat_option,		//반복 옵션- 주
				    repeat_end,			//반복종료
				    content,			//내용
				    username;
    
    private int 	isopen;				//공개여부
    private long 	usernum;			//사용자번호

}