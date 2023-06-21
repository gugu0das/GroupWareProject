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
	
        <!-- Page content-->
            
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">공지사항 글 수정</h1>
                            <p class="lead fw-normal text-muted mb-0"></p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                               
                            	<form:form id="contactForm" modelAttribute="noticeVO" action="./update" method="post" data-sb-form-api-token="API_TOKEN" enctype="multipart/form-data">
	                                
	                                    
	                             		        <input type="hidden" name="id" value="${noticeVO.id}"> 
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
	                                        <form:input path="writer" id="writer" cssClass="form-control" readOnly="true"/>
	                                        
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
										<button type="button" class="btn btn-danger fileDelete" data-fileId="${fileVO.id}"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
											viewBox="-4 -4 20 20" x="60" y="86">
											<path fill="none" stroke="#D3D3D3"
												d="M9.6 2.4L2.4 9.6m-.044-7.244L9.6 9.6" /></svg>삭제</button>
										</div>
										</c:forEach>
										
										<!-- <label for="files" class="form-label">Image</label> -->
	                                    <button type="button" id="fileAdd" class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="-4 -4 22 22" y="86"><g fill="#999" fill-rule="evenodd"><path d="M5.6 0h2.8v14H5.6z"/><path d="M0 5.6h14v2.8H0z"/></g></svg>사진</button>
	                                   
	                                    </div>
	                                  
				
	                                    <!-- content input-->
	                                    <div class="form-floating mb-3">
	                                   		<label for="contents">내용</label>
	                                        <textarea class="form-control" id="contents" name="contents" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required">${noticeVO.contents}</textarea>
	                                        
	                                        <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
	                                    </div>  
	                                    
	                                    
	                                                            
	                                    <div class="d-grid"><button class="btn btn-success btn-lg" id="submitButton" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="-4 -4 18 18" x="37" y="108"><defs><path id="g" d="M12 12V0H0v12h12z"/></defs><g fill="none" fill-rule="evenodd" opacity=".9" transform="translate(-1 -1)"><mask id="h" fill="#fff"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#g"/></mask><path fill="#A3A9A9" d="M9.82 6.49c.02-.16.036-.32.036-.49 0-.17-.015-.33-.036-.49l1.085-.825a.248.248 0 0 0 .062-.32l-1.028-1.73a.262.262 0 0 0-.314-.11l-1.28.5a3.782 3.782 0 0 0-.869-.49L7.281 1.21A.249.249 0 0 0 7.03 1H4.973a.249.249 0 0 0-.252.21l-.195 1.325a3.977 3.977 0 0 0-.869.49l-1.28-.5a.254.254 0 0 0-.313.11l-1.028 1.73a.242.242 0 0 0 .061.32l1.085.825c-.02.16-.036.325-.036.49 0 .165.015.33.036.49l-1.085.825a.248.248 0 0 0-.061.32l1.028 1.73c.061.11.2.15.313.11l1.28-.5c.267.2.555.365.869.49l.195 1.325a.25.25 0 0 0 .252.21H7.03c.129 0 .237-.09.252-.21l.195-1.325c.314-.125.602-.295.87-.49l1.279.5c.118.045.252 0 .314-.11l1.028-1.73a.248.248 0 0 0-.062-.32L9.82 6.49zM6.001 7.75c-.992 0-1.799-.785-1.799-1.75s.807-1.75 1.8-1.75c.99 0 1.798.785 1.798 1.75s-.807 1.75-1.799 1.75z" mask="url(#h)"/></g></svg>수정</button></div>
                                	</form:form>   
                                
                            </div>
                        </div>
                    </div>
                    
                </div>
                </div>
                </div>
                </div>
        
        
        
	
	
	<!-- Footer -->
    
    <!-- Footer -->
    <script src="/js/noticeImportant.js"></script>
    <script type="text/javascript" src="/js/boardForm.js"></script>
    <script type="text/javascript" src="/js/fileManger.js"></script>
    <c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script>
		$("#contents").summernote();
		setMax(3);
		setParam('files')
		
	</script>
</body>
</html>