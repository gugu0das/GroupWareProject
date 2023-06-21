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
<style type="text/css">
.fw-bolder {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

#fileAdd {
        display: flex;
        justify-content: center;
}

</style>
<!-- css, favicon -->
<c:import url="../temp/header.jsp"></c:import>
<c:import url="../temp/style.jsp"></c:import>
<!-- css, favicon -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body id="bg-gradient-primary">
<div id="wrapper">
		<!-- sideBar -->
		<c:import url="../temp/sidebar.jsp"></c:import>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:import url="../temp/topbar.jsp"></c:import>
        <!-- Header-->
        <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">QnA 글 쓰기</h1>
                            <p class="lead fw-normal text-muted mb-0"></p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <%-- <form id="contactForm" action="./add" method="post" data-sb-form-api-token="API_TOKEN" enctype="multipart/form-data"> --%>
                            	<form:form id="contactForm" modelAttribute="qnaVO" action="./add" method="post" data-sb-form-api-token="API_TOKEN" enctype="multipart/form-data">
	                                    <!-- Title input-->
	                                    <div class="form-floating mb-3">
	                                        <!-- <input class="form-control" id="title" name="title" type="text" placeholder="Enter Title..." data-sb-validations="required" /> -->
	                                        <label for="title">제목</label>
	                                        <form:input path="title" id="title" cssClass="form-control"/>
	                                        <form:errors path="title"></form:errors>
	                                        <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
	                                    </div>
	                                    <!-- writer input-->
	                                    <div class="form-floating mb-3">
	                                        <!-- <input class="form-control" id="writer" name="writer" type="text" placeholder="Enter Title..." data-sb-validations="required,email" /> -->
	                                        <label for="writer">작성자</label>
	                                        <form:input path="writer" id="writer" cssClass="form-control" readOnly="true" />
	                                        <form:errors path="writer"></form:errors>
	                                    </div>
	                                   <div class="form-floating mb-3" id="fileList">
	                                   
	                               			<div class="mb-3">
	                                    	<label for="files" class="form-label">첨부파일 추가</label>
	                                    	<!-- <input type="file" class="form-control" name="files" name="files"> -->
	                                    	<!-- <button type="button">X</button> -->
	                                    	</div>                          
	                                    	<button type="button" id="fileAdd" class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="-4 -4 22 22" y="86"><g fill="#999" fill-rule="evenodd"><path d="M5.6 0h2.8v14H5.6z"/><path d="M0 5.6h14v2.8H0z"/></g></svg>사진</button>
	                                    	                                                                                      
	                                    </div>
	                                    <!-- content input-->
	                                    <div class="form-floating mb-3">
	                                    	<label for="contents"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="-4 -4 24 24" x="28" y="34"><g fill="none" fill-rule="evenodd" transform="translate(-4 -4)"><path d="M0 0h24v24H0z"/><rect width="15" height="15" x="4.5" y="4.5" fill="#FFF" stroke="#D3D3D3" rx="7.5"/><path fill="#D3D3D3" d="M8 11.5h8v1H8z"/></g></svg>내용</label>
	                                        <textarea class="form-control" id="contents" name="contents" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
	                                        <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
	                                    </div>  
	                                    
	                                    
	                                                            
	                                    <div class="d-grid"><button class="btn btn-success submitButton btn-lg" id="submitButton" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="-4 -4 24 24" x="68" y="24"><title>cf/icon/board/board checkbox_normal_24x24</title><g fill="none" fill-rule="evenodd"><path d="M-4-4h24v24H-4z"/><path stroke="#03c75a" fill="#FFF" d="M.5.5h15v15H.5z"/><path stroke="#03c75a" stroke-width="2" d="M4 7.32l3.26 2.5 4.74-5"/></g></svg>등록</button></div>
	                                    
                                	</form:form>   
                                <%-- </form> --%>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </section>
         </div> </div> </div>
        
	
	
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