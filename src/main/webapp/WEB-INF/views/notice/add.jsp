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
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
     <c:import url="../temp/header2.jsp"></c:import>
        <!-- Header-->
        <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">공지사항 글 쓰기</h1>
                            <p class="lead fw-normal text-muted mb-0">공지사항 등록</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <%-- <form id="contactForm" action="./add" method="post" data-sb-form-api-token="API_TOKEN" enctype="multipart/form-data"> --%>
                            	<form:form id="contactForm" modelAttribute="noticeVO" action="./add" method="post" data-sb-form-api-token="API_TOKEN" enctype="multipart/form-data">
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
	                                        <form:input path="writer" id="writer" cssClass="form-control"/>
	                                        <label for="writer">작성자</label>
	                                        <form:errors path="writer"></form:errors>
	                                    </div>
	                                     <div class="form-floating mb-3">
	                                    	<input type="file" name="files"> 
	                                    </div>
	                                    
	                                    <!-- <div class="form-floating mb-3" id="fileList"> -->
	                                   
	                               			<!-- <div class="mb-3">
	                                    	<label for="files" class="form-label">Image</label>
	                                    	<input type="file" class="form-control" name="files" name="files">
	                                    	<button type="button">X</button>
	                                    	</div>  -->                         
	                                    <!-- 	<button type="button" id="fileAdd">ADD</button>                                                                                            
	                                    </div> -->
	                                    <!-- content input-->
	                                    <div class="form-floating mb-3">
	                                        <textarea class="form-control" id="contents" name="contents" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
	                                        <label for="contents">내용</label>
	                                        <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
	                                    </div>  
	                                    
	                                    
	                                                            
	                                    <div class="d-grid"><button class="btn btn-primary btn-lg" id="update" type="submit">Submit</button></div>
                                	</form:form>   
                                <%-- </form> --%>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </section>
        
        
	</main>
	
	<!-- Footer -->
    <%-- <c:import url="../temp/footer.jsp"></c:import> --%>
    <!-- Footer -->
    
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