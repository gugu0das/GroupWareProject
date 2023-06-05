<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    
<script>

function chkInputValue(id, msg){
	if ( $.trim($(id).val()) == "") {
		alert(msg+"을(를) 입력해주세요.");
		$(id).focus();
		return false;
	}
	return true;
}

function fn_formSubmit(){
	if ( ! chkInputValue("#title", "일정명")) return false;
	if ( ! chkInputValue("#content", "내용")) return false;
	
	if (!confirm("저장 하시겠습니까?")) return;
	
	$("#form1").submit();
}

function fn_delete(){
	if (!confirm("삭제 하시겠습니까?")) return;
	
	$("#form1").attr("action", "scheDelete");
	$("#form1").submit();
}

</script>
    
</head>

<body>

    <div id="wrapper">
		
        <div id="page-wrapper"> 
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-gear fa-fw"></i> 일정수정</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <div class="row">
            	<form id="form1" name="form1" role="form" action="scheSave" method="post" >
            		<input type="hidden" name="id" value="<c:out value="${scheInfo.id}"/>">
					<div class="panel panel-default">
	                    <div class="panel-body">
	                    	<div class="row form-group">
	                            <label class="col-lg-1">일정명</label>
	                            <div class="col-lg-8">
	                            	<input type="text" class="form-control" id="title" name="title" maxlength="50" 
	                            	value="<c:out value="${scheInfo.title}"/>">
	                            </div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">구분</label>
	                            <div class="col-lg-8">
									<c:forEach var="listview" items="${typelist}" varStatus="status">
		                            	<label style="margin-right: 5px"><input type="radio"  <c:if test='${listview.codecd==scheInfo.type}'>checked</c:if> 
		                            		 id="type" name="type" value="<c:out value="${listview.codecd}"/>"> <c:out value="${listview.codenm}"/></label>
		                            </c:forEach>
	                            </div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">일시</label>
	                            <div class="col-lg-8"> 
	                            	<input class="form-control" size="16" id="startdate" name="startdate" value="<c:out value="${scheInfo.startdate}"/>" readonly>
									<input class="form-control" size="16" id="enddate" name="enddate" value="<c:out value="${scheInfo.enddate}"/>" readonly>
	                            </div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">반복</label>
	                            <div class="col-lg-8">
									<select id="repeattype" name="repeattype" class="form-control">
										<option value="1" <c:if test='${scheInfo.repeattype==1}'>selected</c:if>>반복없음</option>
										<option value="2" <c:if test='${scheInfo.repeattype==2}'>selected</c:if>>주간반복</option>
										<option value="3" <c:if test='${scheInfo.repeattype==3}'>selected</c:if>>월간반복</option>
									</select>
								</div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">공개여부</label>
	                            <div class="col-lg-8">
									<label><input type="radio" <c:if test='${scheInfo.isopen==1}'>checked</c:if> id="isopen" name="isopen" value="1"> 공개</label>
									<label><input type="radio" <c:if test='${scheInfo.isopen==0}'>checked</c:if> id="isopen" name="isopen" value="0"> 비공개</label>
	                            </div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">내용</label>
	                            <div class="col-lg-8">
	                            	<textarea class="form-control" id="content" name="content" rows="4"><c:out value="${scheInfo.content}"/></textarea>
	                            </div> 
	                        </div>
	                    </div>
	                </div>
				</form>	
		        <button class="btn btn-outline btn-primary" onclick="fn_formSubmit()">저장</button>
		        <c:if test='${scheInfo.id!=null}'>
	            	<button class="btn btn-outline btn-primary" onclick="fn_delete()">삭제</button>
	            </c:if>
            </div>
            <!-- /.row -->
        </div> 
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</body>

</html>