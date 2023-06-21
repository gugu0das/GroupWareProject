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
	<title>일정추가</title>
	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/style.jsp"></c:import>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/cupertino/jquery-ui.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
	<style>
		body {
			background-color: #f8f9fa;  /* body 배경색을 조정합니다. */
		}
		.btn-outline:hover {
			background-color: #6c757d;  /* 버튼에 마우스를 올렸을 때의 배경색을 조정합니다. */
			color: #fff;  /* 버튼에 마우스를 올렸을 때의 글자색을 조정합니다. */
		}
		.container-fluid {
			padding: 50px;  /* container의 패딩을 조정합니다. */
		}
		.form-group label {
			font-size: 15px;
			margin-bottom: 10px;  /* label 아래에 마진을 추가합니다. */
			white-space: nowrap;  /* 추가한 코드: 줄바꿈 방지 */
		}
		.center-div {
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
		}
        .card {
            border-radius: 30px;
            margin: 40px;
        }
        .card-body {
            border-radius: 10px;
            margin: 40px;
        }
	</style>
<script>
$.noConflict(); // jQuery 충돌 방지
  jQuery(document).ready(function($) {
    $('#startdate').datepicker({
      dateFormat: 'yy-mm-dd'
    }).on('changeDate', function(ev) {
      if (ev.viewMode=="days"){
        $('#startdate').datepicker('hide');
      }
    });

    $('#enddate').datepicker({
      dateFormat: 'yy-mm-dd'
    }).on('changeDate', function(ev) {
      if (ev.viewMode=="days"){
        $('#enddate').datepicker('hide');
      }
    });

    $('#repeatend').datepicker({
      dateFormat: 'yy-mm-dd'
    }).on('changeDate', function(ev) {
      if (ev.viewMode=="days"){
        $('#repeatend').datepicker('hide');
      }
    });
    repeattypeChange();
    <c:if test='${repeatoption ne ""}'>
      $("#repeatoption").val('<c:out value="${scheInfo.repeatoption}"/>');
    </c:if> 
});

function repeattypeChange() {
    var guideText = '';
    var repeatType = $("#repeattype").val();
    
    if (repeatType==="1"){
        guideText = '반복없음: 일정이 한 번만 발생합니다. 시작 날짜 및 시간과 종료 날짜 및 시간을 입력해주세요.';
        $("#repeatoption").hide();
        $("#repeatend").hide();
    } else {
        $("#repeatoption").show();
        $("#repeatend").show(); 

        if ($("#repeatend").val()==="") $("#repeatend").val($("#enddate").val()); 
        $("#repeatoption").empty();

        if (repeatType==="2") {
            guideText = '주간반복: 일정이 매주 일정한 요일에 반복됩니다. 요일을 선택하고 반복 종료일을 설정해주세요.';
            var week = ["일", "월", "화", "수", "목", "금", "토"];
            for (var i=0; i<week.length; i++) {
                $('<option value="'+ i +'">' + week[i] + '</option>').appendTo($("#repeatoption"));
            }
        } else if (repeatType==="3") {
            guideText = '월간반복: 일정이 매달 일정한 날짜에 반복됩니다. 날짜를 선택하고 반복 종료일을 설정해주세요.';
            for (var i=1; i<=31; i++) {
                var str = "0" + String(i);
                str = str.substring(str.length-2);
                $('<option value="'+ str +'">' + str + '</option>').appendTo($("#repeatoption"));
            }
        }
    }

	$("#repeatGuide").text(guideText);
}

function chkInputValue(id, msg){
	if ( $.trim($(id).val()) == "") {
		alert(msg+"을(를) 입력해주세요.");
		$(id).focus();
		return false;
	}
	return true;
}

function fn_formSubmit(){
    var startdate = new Date($("#startdate").val());
    var enddate = new Date($("#enddate").val());
    var repeatend = $("#repeatend").val() ? new Date($("#repeatend").val()) : null;
    var starthour = parseInt($("#starthour").val());
    var endhour = parseInt($("#endhour").val());
    var repeattype = $("#repeattype").val();

    if (startdate > enddate) {
        alert("시작일은 종료일 이전이어야 합니다.");
        return false;
    }

    if (startdate.getTime() === enddate.getTime() && starthour > endhour) {
        alert("시작 시간은 종료 시간 이전이어야 합니다.");
        return false;
    }

    if (repeattype != "1" && (!repeatend || enddate.getTime() !== repeatend.getTime())) {
        alert("반복 일정을 사용하는 경우, 반복 종료일은 종료일과 일치해야 합니다.");
        return false;
    }

    if (!chkInputValue("#title", "일정명")) return false;
    
    $("#form1").submit();
}

function fn_delete(){
	if (!confirm("삭제 하시겠습니까?")) return;
	
	$("#form1").attr("action", "scheDelete");
	$("#form1").submit();
}

</script>
    
</head>

<body class="bg-gradient-primary">
    <div id="wrapper">
        <!-- Sidebar -->
        <c:import url="../temp/sidebar.jsp"></c:import>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <c:import url="../temp/topbar.jsp"></c:import>
                <div class="card">
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <h1 class="h3 mb-4 text-gray-800">일정수정</h1>
                        <div class="card-body">
                            <!-- new row-->
                            <div class="row">
                                <form id="form1" name="form1" role="form" action="scheSave" method="post" onsubmit="return fn_formSubmit();">
                                    <input type="hidden" name="id" value='<c:out value="${scheInfo.id}"/>''>
                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                            <div class="form-group">
                                                <label class="col-lg-2">일정명</label>
                                                <div class="col-lg-10">
                                                    <input type="text" class="form-control" id="title" name="title" maxlength="50" value='<c:out value="${scheInfo.title}"/>'
                                                    style="width: 100%;">
                                                </div>
                                            </div>
 											<!-- 시작일시 -->
                                            <div class="form-group">
												<label class="col-lg-2">시작일시</label>
												<div class="col-lg-10">
													<input class="form-control" id="startdate" name="startdate" value='<c:out value="${scheInfo.startdate}"/>' readonly>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-2">시간(시)</label>
												<div class="col-lg-10">
													<select id="starthour" name="starthour" class="form-control">
														<c:forEach var="item" begin="1" end="24">
															<c:set var="hour" value="0${item}"/>
															<c:set var="hour" value="${fn:substring(hour, fn:length(hour)-2, 3)}"/>
															<option value="${hour}" <c:if test='${hour==scheInfo.starthour}'>selected</c:if>>${hour}</option>
														</c:forEach>
													</select>                         
												</div>  
											</div>
											<div class="form-group">
												<label class="col-lg-2">시간(분)</label>
												<div class="col-lg-10">
													<select id="startminute" name="startminute" class="form-control">
														<c:forTokens var="item" items="00,10,20,30,40,50" delims=",">
															<option value="${item}" <c:if test='${item==scheInfo.startminute}'>selected</c:if>>${item}</option>
														</c:forTokens>
													</select>                        
												</div>		                            
											</div>
							
											<!-- 종료일시 -->
											<div class="form-group">
												<label class="col-lg-2">종료일시</label>
												<div class="col-lg-10">
													<input class="form-control" id="enddate" name="enddate" value='<c:out value="${scheInfo.enddate}"/>' readonly>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-2">시간(시)</label>
												<div class="col-lg-10">
													<select id="endhour" name="endhour" class="form-control">
														<c:forEach var="item" begin="1" end="24">
															<c:set var="hour" value="0${item}"/>
															<c:set var="hour" value="${fn:substring(hour, fn:length(hour)-2, 3)}"/>
															<option value="${hour}" <c:if test='${hour==scheInfo.endhour}'>selected</c:if>>${hour}</option>
														</c:forEach>
													</select>                         
												</div>  
											</div>
											<div class="form-group">
												<label class="col-lg-2">시간(분)</label>
												<div class="col-lg-10">
													<select id="endminute" name="endminute" class="form-control">
														<c:forTokens var="item" items="00,10,20,30,40,50" delims=",">
															<option value="${item}" <c:if test='${item==scheInfo.endminute}'>selected</c:if>>${item}</option>
														</c:forTokens>
													</select>                        
												</div>		                            
											</div>					
											<!-- 반복 -->
											<div class="form-group">
												<label class="col-lg-2">반복</label>
												<div class="col-lg-10">
													<select id="repeattype" name="repeattype" class="form-control" onchange="repeattypeChange()">
														<option value="1" <c:if test='${scheInfo.repeattype==1}'>selected</c:if>>반복없음</option>
														<option value="2" <c:if test='${scheInfo.repeattype==2}'>selected</c:if>>주간반복</option>
														<option value="3" <c:if test='${scheInfo.repeattype==3}'>selected</c:if>>월간반복</option>
													</select>                        
												</div>
												<div class="col-lg-10">
													<select id="repeatoption" name="repeatoption" class="form-control" style="display:none">
													</select>                        
												</div>
												<div class="col-lg-10">
													<input class="form-control" size="16" id="repeatend" name="repeatend" value='<c:out value="${scheInfo.repeatend}"/>' style="display:none" readonly>
												</div>
											</div>
											<p id="repeatGuide" style="padding-left:15px;"></p>
                                            <!-- 공개 여부 -->
                                            <div class="form-group">
                                                <label class="col-lg-2">공개여부</label>
                                                <div class="col-lg-10">
                                                    <label><input type="radio" <c:if test='${scheInfo.isopen==1}'>checked</c:if> id="isopen" name="isopen" value="1"> 공개</label>
                                                    <label><input type="radio" <c:if test='${scheInfo.isopen==0}'>checked</c:if> id="isopen" name="isopen" value="0"> 비공개</label>
                                                </div>
                                            </div>

                                            <!-- 내용 -->
                                            <div class="form-group">
                                                <label class="col-lg-2">내용</label>
                                                <div class="col-lg-10">
                                                    <textarea class="form-control" id="content" name="content"><c:out value="${scheInfo.content}"/></textarea>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>

                                    <button class="btn btn-outline btn-primary">저장</button>
                                    <c:if test='${scheInfo.id!=null}'>
                                        <button class="btn btn-outline btn-danger" onclick="fn_delete()">삭제</button>
                                    </c:if>

                                </form>	
                            </div>
                        </div>
                    </div>

                    <!-- Footer -->
                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Copyright © Your Website 2021</span>
                            </div>
                        </div>
                    </footer>
                    <!-- End of Footer -->
                </div>
            </div>
            <!-- /#page-wrapper -->
        </div>
    </div>
    <!-- Logout Modal-->
    <c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
</body>
</html>