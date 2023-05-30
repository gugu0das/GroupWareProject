<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<script>
function fn_formSubmit(){
	document.form1.submit();	
}

var oldid = null;
function calendarDayMouseover(event, id, calendar_date){
	if (!id) {
		return;
	}
	
	$(".calendarTooltip").css({left: event.x+"px", top: event.y+"px"});
	$(".calendarTooltip").show();
	if (oldid===id) return;
	oldid=id;
    $.ajax({
    	url: "scheRead4Ajax",
    	cache: false,
    	data: { id : id, calendar_date:calendar_date },
	    success: function(result){
	    	$(".calendarTooltip").html(result);
		}    
    });	
}

function calendarDayMouseout(){
	$(".calendarTooltip").hide();
}
</script>
    
</head>

<body>

    <div id="wrapper">
		
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-calendar fa-fw"></i> 월간 일정</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            
            <!-- /.row -->
			<div class="row"> 
			     <div class="col-lg-10">
			         <h1>
			         <a href="#" onclick="fn_moveToURL('scheList?year=<c:out value="${searchVO.year}"/>&month=<c:out value="${searchVO.month-1}"/>', '')"><i class="fa fa-angle-left fa-fw"></i></a>
			         
			         <c:out value="${searchVO.year}"/>년 <c:out value="${searchVO.month}"/>월
			         <a href="#" onclick="fn_moveToURL('scheList?year=<c:out value="${searchVO.year}"/>&month=<c:out value="${searchVO.month+1}"/>', '')"><i class="fa fa-angle-right fa-fw"></i></a>
			         </h1>
			     </div>
			     <div class="col-lg-2">
	                	<button class="btn btn-outline btn-primary" style="margin-top:20px;" onclick="fn_moveToURL('scheForm', '')" >일정추가</button>
			     </div>
            </div>
            <!-- /.row -->
			<div class="calendarRow" >
				<c:forTokens var="item" items="일,월,화,수,목,금,토" delims=",">
	             	<div class="calendarColumnHead">${item}</div>
				</c:forTokens>
			</div> 
			<div class="calendarRow">
					<c:forEach begin="1" end="${dayofweek}">
			             <div class="calendarColumnBox">
			             	<div class="calendarColumnDay">
			             	</div>
			             </div> 
				 	</c:forEach>	
				 	
					<c:forEach var="listview" items="${listview}" varStatus="status">
						<c:set var="calendar_dayofweek" value="${listview.calendar_dayofweek}"/>
						<c:if test='${calendar_dayofweek=="1"}'> 
							</div>
							<div class="calendarRow">
						</c:if>  
						 
			             <div class="calendarColumnBox">
			             	<div class="calendarColumnDay <c:if test='${listview.calendar_dayofweek=="1"}'>calendarColumnSunDay</c:if>">
			             		<a href="scheForm?calendar_date=<c:out value="${listview.calendar_date}"/>"><c:out value="${listview.calendar_dd}"/></a>
			             	</div>
							<c:forEach var="items" items="${listview.list}" varStatus="status">
				             	<div class="calendarDay" onmouseover="calendarDayMouseover(event, '<c:out value="${items.id}"/>', '<c:out value="${listview.calendar_date}"/>')" onmouseout="calendarDayMouseout()">
					             	<c:if test='${items.usernum==sessionScope.usernum}'> 
					             		<a href="scheForm?id=<c:out value="${items.id}"/>&seq=<c:out value="${items.seq}"/>"><c:out value="${items.title}"/></a>
				             		</c:if>
					             	<c:if test='${items.id!=null and items.usernum!=sessionScope.usernum}'> 
					             		<a href="scheRead?id=<c:out value="${items.id}"/>&seq=<c:out value="${items.seq}"/>"><c:out value="${items.title}"/></a>
				             		</c:if>
					             	<c:if test='${items.id==null}'> 
					             		<span style="color:<c:out value="${items.fontcolor}"/>"><c:out value="${items.title}"/></span>
				             		</c:if>
				             	</div>
				             </c:forEach>
			             </div>
					</c:forEach> 
					<c:forEach begin="${calendar_dayofweek}" end="6">
			             <div class="calendarColumnBox">
			             	<div class="calendarColumnDay">
			             	</div>
			             </div> 
				 	</c:forEach>	
			</div>	
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p> 
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <div class="calendarTooltip"></div>
</body>

</html>
