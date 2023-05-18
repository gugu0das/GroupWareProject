package com.ware.group.schedule;

public class ScheDetailVO {

    private String  id,         //일정번호
                    date,       //날짜
                    hour,       //시간
                    minute,     //분
                    usernum,
                    title,      // 일정명
                    fontcolor;
    
    private Integer seq;        //순번

    // Getters and Setters
    public String getId() {
        return id;
    }

    public Integer getSeq() {
        return seq;
    }

    public String getDate() {
        return date;
    }

    public String getMinute() {
        return minute;
    }

    public String getHour() {
        return hour;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUsernum() {
        return usernum;
    }

    public void setUsernum(String usernum) {
        this.usernum = usernum;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }

    public String getFontcolor() {
        return fontcolor;
    }

    public void setFontcolor(String fontcolor) {
        this.fontcolor = fontcolor;
    }

    public void setMinute(String minute) {
        this.minute = minute;
    }
}