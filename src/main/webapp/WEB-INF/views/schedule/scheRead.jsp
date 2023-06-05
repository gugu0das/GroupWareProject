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
<script>
</script>
    
</head>

<body>

    <div id="wrapper">
		
        <div id="page-wrapper"> 
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-gear fa-fw"></i> 일정관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <div class="row">
            	<form id="form1" name="form1" role="form" action="scheSave" method="post" onsubmit="return fn_formSubmit();" >
            		<input type="hidden" name="id" value="<c:out value="${scheInfo.id}"/>">
					<div class="panel panel-default">
	                    <div class="panel-body">
	                    	<div class="row form-group">
	                            <label class="col-lg-1">일정명</label>
	                            <div class="col-lg-8"><c:out value="${scheInfo.title}"/></div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">구분</label>
	                            <div class="col-lg-8"><c:out value="${scheInfo.type}"/></div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">일시</label>
	                            <div class="col-lg-8"> 
	                            	<c:out value="${scheInfo.startdate}"/> <c:out value="${scheInfo.starthour}"/>:<c:out value="${scheInfo.startminute}"/>
	                             ~
	                             	<c:out value="${scheInfo.enddate}"/> <c:out value="${scheInfo.endhour}"/>:<c:out value="${scheInfo.endminute}"/>
	                            </div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">반복</label>
	                            <div class="col-lg-8"><c:out value="${scheInfo.repeattype}"/></div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">공개</label>
	                            <div class="col-lg-8"><c:out value="${scheInfo.open}"/></div>
	                        </div> 
	                    	<div class="row form-group">
	                            <label class="col-lg-1">내용</label>
	                            <div class="col-lg-8"><c:out value="${scheInfo.content}"/></div>
	                        </div>
	                    </div> 
	                </div>
			        <button class="btn btn-outline btn-primary"></button>
				</form>	
                
            </div>
            <!-- /.row -->
        </div> 
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</body>

</html>
