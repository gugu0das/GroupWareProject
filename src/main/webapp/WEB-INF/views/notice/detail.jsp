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
<link rel="stylesheet" href="/css/noticeDesign.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<!-- css, favicon -->

<!-- css, favicon -->
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
	
   <c:import url="../temp/header2.jsp"></c:import>
   	
       						
        							
        						

    <div class="notice-container">
    <h1 class="notice-title margin-top: 50px;">${noticeVO.title}</h1>
    <div class="notice-writer">작성자: ${noticeVO.writer}</div>
    <div class="notice-date">작성일: ${noticeVO.regDate}</div>
    </div>
    <div class="notice-container">
    <div class="notice-contents">${noticeVO.contents}</div>
    </div>     
         <section class="py-5">
                <div class="container px-5 my-3">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                
                              <div class="ms-3">
                                    <div class="fw-bold"></div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                   
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2"></div>
                                    <!-- Post categories-->
                                    
                                </header>
                                <!-- Preview image figure-->
                               
                                <!-- Post content-->
                                <div class="mb-5">
                                     
                                     <c:forEach items="${noticeVO.boardFileVOs}" var="boardFileVO">
                                    	<c:if test="${boardFileVO ne null}">	
                                    	<img alt="2" src="/file/notice/${boardFileVO.fileName}">
                                    	<div>클릭시 다운로드 가능 : 
                                    	<a href="./fileDown?id=${boardFileVO.id}">${boardFileVO.oriName}</a></div>
                                    	</c:if>
                                    </c:forEach>
                                 
                                    
                                </div>
                            </article>
                            <div>
                          	<c:if test="${memberVO.id eq noticeVO.memberId}">
                            <a class="btn btn-primary" href="./delete?id=${noticeVO.id}">글 삭제</a>
                            <a id="update" class="btn btn-outline-primary" href="./update?id=${noticeVO.id}">상품수정</a>
                            </c:if>
                       		<button id="list" type="button" class="btn btn-outline-secondary"><a href="./list">목록으로</a></button>
                       		</div>
                        </div>
                        
                    </div>
                </div>
</section>
</main>

	
	<!-- Footer -->
 <script src="/js/noticeImportant.js"></script>

    <!-- Footer -->
</body>
</html>
