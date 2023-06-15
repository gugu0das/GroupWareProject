<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<c:import url="../temp/header.jsp"></c:import>
<c:import url="../temp/style.jsp"></c:import>
</head>
<body id="bg-gradient-primary">
<div id="wrapper">

	<!-- sideBar -->
		<c:import url="../temp/sidebar.jsp"></c:import>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:import url="../temp/topbar.jsp"></c:import>


	
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">QnA 글 업데이트 update</h1>
                            <p class="lead fw-normal text-muted mb-0">커뮤니티 업데이트 update</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <%-- <form id="contactForm" action="./add" method="post" data-sb-form-api-token="API_TOKEN" enctype="multipart/form-data"> --%>
                            	<form:form id="contactForm" modelAttribute="qnaVO" action="./update" method="post" data-sb-form-api-token="API_TOKEN" enctype="multipart/form-data">
	                                    <input type="hidden" name="id" value="${qnaVO.id}"> 
	                                    <!-- Title input-->
	                                    <div class="form-floating mb-3">
	                                        <!-- <input class="form-control" id="title" name="title" type="text" placeholder="Enter Title..." data-sb-validations="required" /> -->
	                                        <form:input path="title" id="title" cssClass="form-control"/>
	                                        <label for="title">제목</label>
	                                        <form:errors path="title"></form:errors>
	                                        <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
	                                    </div>
	                                    <!-- writer input-->
	                                    <div class="form-floating mb-3">
	                                        <!-- <input class="form-control" id="writer" name="writer" type="text" placeholder="Enter Title..." data-sb-validations="required,email" /> -->
	                                        <form:input path="writer" id="writer" cssClass="form-control" readOnly="true"/>
	                                        <label for="writer">작성자</label>
	                                        <form:errors path="writer"></form:errors>
	                                    </div>
	                                   <div class="form-floating mb-3" id="fileList">
										<c:forEach items="${qnaVO.boardFileVOs}" var="fileVO">
										
										<div>
										<input type="text" disabled value="${fileVO.fileName}" class="form-control" aria-label="Text input with checkbox">
										<button type="button" class="btn btn-primary fileDelete" data-fileId="${fileVO.id}">삭제</button>
										</div>
										</c:forEach>
										
										<!-- <label for="files" class="form-label">Image</label> -->
	                                    <button type="button" id="fileAdd">ADD</button>
	                                     </div>
	                               <!-- content input-->
	                                    <div class="form-floating mb-3">
	                                        <textarea class="form-control" id="contents" name="contents" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required">${qnaVO.contents}</textarea>
	                                        <label for="contents">내용</label>
	                                        <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
	                                    </div>  
	                                    
	                                    
	                                                            
	                                    <div class="d-grid">
	                                    <button class="btn btn-primary btn-lg" id="submitButton" type="submit" value="수정">Submit</button>
	                                    </div>
	                    
                                	</form:form>   
                                <%-- </form> --%>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                    </div>
                </div>
    
	
    <c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
    <script type="text/javascript" src="/js/boardForm.js"></script>
    <script type="text/javascript" src="/js/fileManger.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script>
		$("#contents").summernote();
		setMax(3);
		setParam('files')
		
	</script>
</body>
</html>