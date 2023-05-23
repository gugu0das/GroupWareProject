package com.ware.group.schedule;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScheDetailVO {

    private String  id,         //일정번호
                    date,       //날짜
                    hour,       //시간
                    minute,     //분
                    usernum,
                    title,      // 일정명
                    fontcolor;
}