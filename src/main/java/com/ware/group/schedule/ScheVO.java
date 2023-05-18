package com.ware.group.schedule;

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
				    open,				//공개여부
				    usernum,			//사용자번호
				    username;

	public String getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getType() {
		return type;
	}

	public String getStart_date() {
		return start_date;
	}

	public String getStart_hour() {
		return start_hour;
	}

	public String getStart_minute() {
		return start_minute;
	}

	public String getEnd_date() {
		return end_date;
	}

	public String getEnd_hour() {
		return end_hour;
	}

	public String getEnd_minute() {
		return end_minute;
	}

	public String getRepeat_type() {
		return repeat_type;
	}

	public String getRepeat_end() {
		return repeat_end;
	}

	public String getContent() {
		return content;
	}

	public String getOpen() {
		return open;
	}

	public String getUsernum() {
		return usernum;
	}

	public void setId(String id) {
	    this.id = id;
	}

	public void setTitle(String title) {
	    this.title = title;
	}

	public void setType(String type) {
	    this.type = type;
	}

	public void setStart_date(String start_date) {
	    this.start_date = start_date;
	}

	public void setStart_hour(String start_hour) {
	    this.start_hour = start_hour;
	}

	public void setStart_minute(String start_minute) {
	    this.start_minute = start_minute;
	}

	public void setEnd_date(String end_date) {
	    this.end_date = end_date;
	}

	public void setEnd_hour(String end_hour) {
	    this.end_hour = end_hour;
	}

	public void setEnd_minute(String end_minute) {
	    this.end_minute = end_minute;
	}

	public void setRepeat_type(String repeat_type) {
	    this.repeat_type = repeat_type;
	}

	public void setRepeat_end(String repeat_end) {
	    this.repeat_end = repeat_end;
	}

	public void setContent(String content) {
	    this.content = content;
	}

	public void setOpen(String open) {
	    this.open = open;
	}

	public void setUsernum(String usernum) {
	    this.usernum = usernum;
	}

	public String getRepeat_type_nm() {
	    return repeat_type_nm;
	}

	public void setRepeat_type_nm(String repeat_type_nm) {
	    this.repeat_type_nm = repeat_type_nm;
	}

	public String getRepeat_option() {
	    return repeat_option;
	}

	public void setRepeat_option(String repeat_option) {
	    this.repeat_option = repeat_option;
	}

	public String getUsername() {
	    return username;
	}

	public void setUsername(String username) {
	    this.username = username;
	}
}