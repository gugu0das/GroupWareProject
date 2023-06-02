<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

		<div class="panel panel-default">
             <div class="panel-body">
             	<div class="row form-group">
                     <label class="col-lg-2">일정명</label>
                     <div class="col-lg-10"><c:out value="${scheInfo.title}"/></div>
                 </div>
             	<div class="row form-group">
                     <label class="col-lg-2">구분</label>
                     <div class="col-lg-10"><c:out value="${scheInfo.type}"/></div>
                 </div>
             	<div class="row form-group">
                     <label class="col-lg-2">일시</label>
                     <div class="col-lg-10">
                     	<c:if test='${scheInfo.repeat_type=="1"}'> 
	                     	<c:out value="${scheInfo.start_date}"/> <c:out value="${scheInfo.start_hour}"/>:<c:out value="${scheInfo.ssstartminute}"/>
	                     	~ <c:out value="${scheInfo.start_date}"/> <c:out value="${scheInfo.end_hour}"/>:<c:out value="${scheInfo.ssendminute}"/>
	                    </c:if>
	                    <c:if test='${scheInfo.repeat_type!="1"}'>
	                    	<c:out value="${cddate}"/>
	                    </c:if>
                      </div> 
                 </div>
             	<div class="row form-group">
                     <label class="col-lg-2">반복</label>
                     <div class="col-lg-10"><c:out value="${scheInfo.repeat_type_nm}"/></div>
                 </div>
             	<div class="row form-group">
                     <label class="col-lg-2">공개</label>
                     <div class="col-lg-10"><c:out value="${scheInfo.isopen}"/></div>
                 </div> 
             	<div class="row form-group">
                     <label class="col-lg-2">작성자</label> 
                     <div class="col-lg-10"><c:out value="${scheInfo.usernum}"/></div>
                 </div> 
             	<div class="row form-group">
                     <label class="col-lg-2">내용</label>
                     <div class="col-lg-10" style="max-height:100px; overflow:hidden"><c:out value="${scheInfo.content}"/></div> 
                 </div>
             </div>
         </div>
