<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>

<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<!-- css, favicon -->

<!-- css, favicon -->
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
	
   <c:import url="../temp/header2.jsp"></c:import>

       						
        							
        						
        <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <img class="img-fluid rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
                                <div class="ms-3">
                                    <div class="fw-bold">작성자 : ${noticeVO.writer}</div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1">제목 : ${noticeVO.title}</h1>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2">작성일 : ${noticeVO.regDate}</div>
                                    <!-- Post categories-->
                                    
                                </header>
                                <!-- Preview image figure-->
                               
                                <!-- Post content-->
                                <div class="mb-5">
                                    내 용 : ${noticeVO.contents};                                                                           
                                                            
                              <%--  <img alt="zz" src="/file/notice/${noticeVO.boardFileVOs[0].fileName}">
                               <img alt="z" src="/file/notice/${noticeVO.boardFileVOs[1].fileName}"> --%>
                              <%--  <img alt="zd" src="/file/notice/${filess[0].fileName}">
                               <img alt="zdd" src="/file/notice/${filess[1].fileName}"> --%>
                                     
                                     <c:forEach items="${noticeVO.boardFileVOs}" var="boardFileVO">
                                    	<c:if test="${boardFileVO ne null}">	
                                    	<img alt="2" src="/file/notice/${boardFileVO.fileName}">
                                    	<%-- <img alt="3" src="/file/notice/${boardFileVO.fileName}">
                                    	<img alt="4" src="/file/notice/${boardFileVO.fileName}"> --%>
                                    	클릭시 다운로드 가능 : 
                                    	<a href="./fileDown?id=${boardFileVO.id}">${boardFileVO.oriName}</a>
                                    	</c:if>
                                    </c:forEach>
                                 
                                    
                                </div>
                            </article>
                          	<c:if test="${memberVO.id eq noticeVO.memberId}">
                            <a class="btn btn-primary" id="delete" href="./delete?id=${noticeVO.id}">글 삭제</a>
                            
                             
                             
                            <a id="update" class="btn btn-outline-primary" href="./update?id=${noticeVO.id}">상품수정</a>
                             
                         	 </c:if>
                       <button id="list" type="button" class="btn btn-outline-secondary"><a href="./list">목록으로</a></button>
                       
                        </div>
                        
                    </div>
                </div>
            </section>
        
	</main>
	
	<!-- Footer -->
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>
 <script src="/js/noticeImportant.js"></script>
    <!-- Footer -->
</body>
</html>
