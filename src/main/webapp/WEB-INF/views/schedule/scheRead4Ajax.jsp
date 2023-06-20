<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<style>
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        font-weight: bold;
        margin-bottom: 5px;
    }
    .form-group div {
        padding: 5px;
        border: 1px;
        border-radius: 5px;
    }
    .form-item {
        margin-left: 10px;
    }
</style>


        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">일정 정보</h3>
            </div>
            <div class="panel-body">
                <div class="row form-group">
                    <label class="col-lg-2">일정명</label>
                    <div class="col-lg-10 form-item">${scheInfo.title}</div>
                </div>
                <div class="row form-group">
                    <label class="col-lg-2">일시</label>
                    <div class="col-lg-10 form-item">
                        <c:if test='${scheInfo.repeattype=="1"}'> 
                            <c:out value="${scheInfo.startdate}"/>
                            <c:out value="${scheInfo.starthour < 10 ? '0' : ''}"/><c:out value="${scheInfo.starthour}"/> :
                            <c:out value="${scheInfo.startminute < 10 ? '0' : ''}"/><c:out value="${scheInfo.startminute}"/> 
                            ~ 
                            <c:out value="${scheInfo.enddate}"/> 
                            <c:out value="${scheInfo.endhour < 10 ? '0' : ''}"/><c:out value="${scheInfo.endhour}"/> :
                            <c:out value="${scheInfo.endminute < 10 ? '0' : ''}"/><c:out value="${scheInfo.endminute}"/> 
                       </c:if>
                       <c:if test='${scheInfo.repeattype!="1"}'>
                           <c:out value="${calendardate}"/>
                       </c:if>
                     </div> 
                </div>
                <div class="row form-group">
                    <label class="col-lg-2">일정 반복</label>
                    <div class="col-lg-10 form-item">
                        <c:choose>
                            <c:when test='${scheInfo.repeattypenm == "1"}'>반복 없음</c:when>
                            <c:when test='${scheInfo.repeattypenm == "2"}'>주간 반복</c:when>
                            <c:when test='${scheInfo.repeattypenm == "3"}'>월간 반복</c:when>
                            <c:otherwise>알 수 없음</c:otherwise>
                        </c:choose>
                    </div>
                </div>                
                <div class="row form-group">
                    <label class="col-lg-2">공개 여부</label>
                    <div class="col-lg-10 form-item">
                        <c:choose>
                            <c:when test="${scheInfo.isopen == 1}">
                                공개 중
                            </c:when>
                            <c:otherwise>
                                비공개
                        </c:otherwise>
                    </c:choose></div>
                </div> 
                <div class="row form-group">
                    <label class="col-lg-2">작성자</label> 
                    <div class="col-lg-10 form-item"><c:out value="${scheInfo.username}"/></div>
                </div> 
                <div class="row form-group">
                    <label class="col-lg-2">내용</label>
                    <div class="col-lg-10 form-item" style="max-height:100px; overflow:hidden"><c:out value="${scheInfo.content}"/></div> 
                </div>
            </div>
            </div>
        </div>
