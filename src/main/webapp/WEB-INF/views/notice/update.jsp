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
<c:import url="../temp/header2.jsp"></c:import>

	<main class="flex-shrink-0">
	
        <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">${noticeVO.writer}공지사항 글 업데이트 update</h1>
                            <p class="lead fw-normal text-muted mb-0">공지사항 업데이트 update</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                               
                            	<form:form id="contactForm" modelAttribute="noticeVO" action="./update" method="post" data-sb-form-api-token="API_TOKEN" enctype="multipart/form-data">
	                                
	                                    
	                             		        <input type="hidden" name="id" value="${noticeVO.id}"> 
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
	                                    
	                                    <div class="col-md-12 mt-3">
												<label for="important" class="form-label strongFont2">중요표시</label>
												
												<input type="checkbox" ${noticeVO.important eq true ? 'checked' : ''}  class="form-control" name="important" id="important">
										</div>
										
										
										<div class="form-floating mb-3" id="fileList">
										<c:forEach items="${noticeVO.boardFileVOs}" var="fileVO">
										
										<div>
										<input type="text" disabled value="${fileVO.oriName}" class="form-control" aria-label="Text input with checkbox">
										<button type="button" class="btn btn-primary fileDelete" data-fileId="${fileVO.id}">삭제</button>
										</div>
										</c:forEach>
										
										<!-- <label for="files" class="form-label">Image</label> -->
	                                    <button type="button" id="fileAdd">ADD</button>
	                                   
	                                    </div>
	                                    
	                                    <%-- <a class="btn btn-primary" href="./filedelete?id=${fileVO.id}">삭제</a> --%>
	                    				
	                                    
	                                    
	                                    <!-- <div class="form-floating mb-3">
	                                    	<input type="file" name="files">          
	                                    </div> -->
	                    
	                              	
	                                    <%--  <div id="files">
											<a class="btn" id="files">첨부파일</a>
											<c:forEach items="${noticeVO.boardFileVOs}" var="noticeVO">
												<div class="input-group mb-3 my-3">
													<div class="input-group-text">
														<input class="form-floating mb-3" type="file" name="id" value="${boardFiveVO.id}" aria-label="Checkbox for following text input">
													</div>
													<input type="text" disabled value="${boardFiveVO.oriName}" class="form-control" aria-label="Text input with checkbox">
												</div>
											</c:forEach>	
										</div> --%> 
				
	                                    <!-- content input-->
	                                    <div class="form-floating mb-3">
	                                        <textarea class="form-control" id="contents" name="contents" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required">${noticeVO.contents}</textarea>
	                                        <label for="contents">내용</label>
	                                        <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
	                                    </div>  
	                                    
	                                    
	                                                            
	                                    <div class="d-grid"><button class="btn btn-primary btn-lg" id="submitButton" type="submit">업데이트</button></div>
                                	</form:form>   
                                
                            </div>
                        </div>
                    </div>
                    
                </div>
            </section>
        
        
	</main>
	
	<!-- Footer -->
    
    <!-- Footer -->
    <script src="/js/noticeImportant.js"></script>
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