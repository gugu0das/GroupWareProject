package com.ware.group.common;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ware.group.member.EmployeeStatusVO;
import com.ware.group.member.WorkTimeVO;
import com.ware.group.schedule.MonthVO;
@SuppressWarnings("deprecation")
public class Util4calen {
   static final Logger LOGGER = LoggerFactory.getLogger(AdminInterceptor.class);
   static final String[] dayArr = {"일", "월", "화", "수", "목", "금", "토"};

   /**
    * 시스템의 오늘 일자 반. 
    */
   public static Date getToday() {
      Calendar cal = Calendar.getInstance(); 
      cal.setTime( new Date() );
      return cal.getTime();
   }    

   /**
    * 문자열을 날짜형으로 변환.
    */
   public static Date getToday(String date) {
      Calendar cal = Calendar.getInstance(); 
      cal.setTime( str2Date(date) );
      return cal.getTime();
   }   

   /**
    *  날짜를 문자열로 변환.
    */
   public static String date2Str(Date date) {
      SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
      return ft.format( date.getTime() );    
   }

    /**
     *  문자열을 날짜(yyyy-MM-dd)로 변환.
     */
    public static Date str2Date(String date) {
        SimpleDateFormat oldft = new SimpleDateFormat("MM/dd/yyyy");
        SimpleDateFormat netft = new SimpleDateFormat("yyyy-MM-dd");
        Date ret = null;
        try {
            ret = netft.parse(date);
        } catch (ParseException ex) {
            try {
                ret = oldft.parse(date);
                ret = netft.parse(netft.format(ret));
            } catch (ParseException e) {
                LOGGER.error("date parse error ");
            }
        }
        return ret;
    }

   /**
    *  날짜를 년월일로 구분하여 저장.
    */
   public static DateVO date2VO(Date date) {
      Calendar cal = Calendar.getInstance(); 
      cal.setTime( date );

      DateVO dvo = new DateVO();
      dvo.setYear( cal.get(Calendar.YEAR) );
      dvo.setMonth(cal.get(Calendar.MONTH) + 1 );
      dvo.setDay(  cal.get(Calendar.DAY_OF_MONTH) );
      dvo.setWeek( dayArr[ cal.get(Calendar.DAY_OF_WEEK) - 1] );
      return dvo;    
   }


   /**
    * 년도 추출.
    */
   public static Integer getYear(Date date) {
      Calendar cal = Calendar.getInstance(); 
      cal.setTime( date );

      return cal.get(Calendar.YEAR);
   }

   /**
    * 월 추출.
    */
   public static Integer getMonth(Date date) {
      Calendar cal = Calendar.getInstance(); 
      cal.setTime( date );

      return cal.get(Calendar.MONTH) + 1;
   }

   /**
    * 한 주의 순서 (요일).
    * 예: 일요일 = 0
    */
   public static Integer getDayOfWeek(Date date) {
      Calendar cal = Calendar.getInstance(); 
      cal.setTime( date );
      return cal.get(Calendar.DAY_OF_WEEK) - 1;    
   }

   /**
    * 월의 몇 번째 주 인지 추출.
    * 예: 반환값이 4이면 (7월) 4번째 주
    */
   public static Integer getWeekOfMonth(Date date) {
      Calendar cal = Calendar.getInstance(); 
      cal.setTime( date );
      return cal.get(Calendar.WEEK_OF_MONTH);    
   }

   public static String getWeekString(Integer idx) {
      return dayArr[idx];    
   }

   /**
    *  한주의 시작일자.
    */

   public static Date getFirstOfWeek(Date date) {
      Calendar cal = Calendar.getInstance();
      cal.setTime( date );
      Integer dw = cal.get(Calendar.DAY_OF_WEEK) - 1;
      cal.add(Calendar.DATE, dw * -1);
      return cal.getTime();    
   }

   /**
    *  한주의 종료일자.
    */
   public static Date getLastOfWeek(Date date) {               
      Calendar cal = Calendar.getInstance();
      cal.setTime( date );
      Integer dw = cal.get(Calendar.DAY_OF_WEEK);
      cal.add(Calendar.DATE, 7 - dw);
      return cal.getTime();    
   }

   /**
    *  월의 시작일.
    */
   public static Date getFirstOfMonth() {
      SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");

      String str = ft.format( Calendar.getInstance().getTime() );

      return str2Date(str.substring(0, 8) + "01");    
   }

   /**  
    * 두 날짜(date1,date2)의 일수: 시간 포함해서 계산하면 오류가 있어 날짜만 추출해서 계산.
    */
   public static Integer dateDiff(Date date1, Date date2) {
      String dt1 = date2Str(date1);
      String dt2 = date2Str(date2);

      Integer day = (int) ( (str2Date(dt1).getTime() - str2Date(dt2).getTime()) / (24 * 60 * 60 * 1000) );
      return day;
   }    

   /** 
    * 날자 계산: -1은 감소.
    */
   public static Date dateAdd(Date date, Integer calDay) {
      Calendar cal = Calendar.getInstance(); 
      cal.setTime(date);
      cal.add(Calendar.DATE, calDay);  

      return cal.getTime();
   }    

   /** 
    * 달 계산: -1은 감소.
    */
   public static Date monthAdd(Date date, Integer month) { 
      Calendar cal = Calendar.getInstance(); 
      cal.setTime(date);
      cal.add(Calendar.MONTH, month); 

      return cal.getTime();
   }

   /*
      시간만 비교하기 : 날짜 동일, 분단위로 계산
   */
   public static Long TimeDiff(Timestamp timestamp1, Time timestamp2) {
      //timeStamp1 = 비교받는 대상
      //timeStamp2 = 비교할 대상 (timestamp1 보다 이후시간)

      Time diff1 = new Time(timestamp1.getHours(), timestamp1.getMinutes(), timestamp1.getSeconds());
//      Timestamp diff2 = new Timestamp(timestamp2.getTime());
      Long diffTime =(diff1.getTime()/ (60 * 1000)-timestamp2.getTime()/ (60 * 1000));   
      
      return diffTime;
      
   }

	/*
	 * TimeStamp 비교해서 분으로 리턴
	*/
   public static Long TimeDiff(EmployeeStatusVO employeeStatusVO) {
	   Timestamp onTime = employeeStatusVO.getOnTime();
	   Timestamp offTime = employeeStatusVO.getOffTime();
	   Long result = (offTime.getTime()/(60*1000)-onTime.getTime()/(60*1000));//분
	   return  result;
	   
   }
   public static Time TimeDiff(Time lowTime, Time highTime)throws Exception{
	   Long time =  highTime.getTime()-lowTime.getTime();
	   Time resultTime = new Time(time);
	   return resultTime;
   }
   
   public static Long TimeDiff(Time defult, Timestamp overTime)throws Exception{
	   Timestamp time  = new Timestamp(defult.getTime());
	   
	   time.setYear(overTime.getYear());
	   time.setMonth(overTime.getMonth());
	   time.setDate(overTime.getDate());
	   Time timeresult = new Time(time.getTime());
	   
	   return overTime.getTime()/ (60 * 1000)-timeresult.getTime()/ (60 * 1000);
	   
   }
   //기본 근무시간 분으로 빼서 리턴
   public static Long TimeDiff(WorkTimeVO workTimeVO)throws Exception{
//	   식사시간
	   Time mealTime = new Time(1, 0, 0);
	   
	   Time startTime = workTimeVO.getStartTime();
	   Time finishTime = workTimeVO.getFinishTime();
	   
	   //Timestamp로 변환
	   Timestamp startTimeStamp = new Timestamp(startTime.getTime());
	   Timestamp finishTimeStamp = new Timestamp(finishTime.getTime());
	   if(startTime.getTime()>finishTime.getTime()) {//근무가 오후에 시작해서 다음날에 종료될수 있기때문
		   finishTimeStamp.setDate(finishTimeStamp.getDate()+1);
	   }
	   Long diffTime = (finishTimeStamp.getTime()/ (60 * 1000)-startTimeStamp.getTime()/ (60 * 1000));
	   
	   if(workTimeVO.isMealTime())
		   diffTime-=60;
	   return diffTime;//분
   }
   
   /*
      현재시간 Timestamp로 가져오기
   */
   public static Timestamp getNowTime() throws Exception{
      Timestamp timestamp = new Timestamp(System.currentTimeMillis());
      return timestamp;
   }
   /*
      Defualt 근무시간을 현재 근태에 넣기위해 날짜 정제 
    */
   public static Timestamp getStatusTime(Time timestamp, Date date)throws Exception {
      
      Timestamp getTime = new Timestamp(date.getYear(), date.getMonth(), date.getDate(), timestamp.getHours(), timestamp.getMinutes(), timestamp.getSeconds(), 0);

      Timestamp resultTime = new Timestamp(getTime.getTime());
      return resultTime;
      
   }
   public static EmployeeStatusVO setMonthVO(EmployeeStatusVO employeeStatusVO)throws Exception{
	   MonthVO monthVO  = new MonthVO();
	   Date date = employeeStatusVO.getReg();
	   //년 월 추출
	   Integer year = getYear(date);
	   Integer month = getMonth(date);
	   monthVO.setYear(year.toString());
	   monthVO.setMonth(month.toString());
	   employeeStatusVO.setMonthVO(monthVO);
	   return employeeStatusVO;
   }
   public static EmployeeStatusVO setFirstReg(EmployeeStatusVO employeeStatusVO)throws Exception{
	   java.sql.Date date =  employeeStatusVO.getReg();
	   date.setDate(1);
	   employeeStatusVO.setReg(date);
	   return employeeStatusVO;
	   
   }
   //LocalDate -> Date
   public static java.sql.Date setLocalDateToDate(LocalDate localDate)throws Exception{
//	   DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-mm-dd");
//	   String localDateString = localDate.format(dateTimeFormatter);
//	   
//	   DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
//	   Date date = dateFormat.parse(localDateString);
	   java.sql.Date returnDate= java.sql.Date.valueOf(localDate);
//	   java.sql.Date returnDate = new java.sql.Date(date.getTime());
	   return returnDate;

   }
 //hh:mm AM/PM 형태
 	public static Time setTimeFormat(String timestr)throws Exception{

 		//공백 및 : 제거
 		timestr =timestr.replaceAll(":", "");
 		timestr= timestr.trim();
 		
 		int hour = Integer.valueOf(timestr.substring(0,2));
 		int min = Integer.valueOf(timestr.substring(2, 4));
 		String ap = timestr.substring(5);

 		if(ap.equals("PM")) {
 			hour = hour+12;
 		}
 		Time time = new Time(hour, min, 0);
 		return time;
 	}
 	public static Timestamp setTimeStampFormat(String timestr,java.sql.Date date)throws Exception{

 		//공백 및 : 제거
 		timestr =timestr.replaceAll(":", "");
 		timestr= timestr.trim();
 		
 		int hour = Integer.valueOf(timestr.substring(0,2));
 		int min = Integer.valueOf(timestr.substring(2, 4));
 		String ap = timestr.substring(5);

 		if(ap.equals("PM")) {
 			hour = hour+12;
 		}
 		
 		Timestamp timestamp = new Timestamp(date.getYear(), date.getMonth(), date.getDate(), hour, min, 0, 0);
 		return timestamp;
 	}
   public static Long getDayDiff(java.sql.Date date)throws Exception{

	   
	   Long days=Util4calen.getNowTime().getTime()/(1000*60*60*24)- date.getTime()/(1000*60*60*24);
	   return days;
	  
   }
}
