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
<!-- css, favicon -->

<!-- css, favicon -->
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
	
   <c:import url="../temp/header.jsp"></c:import>

       						
        							
        						
        <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <img class="img-fluid rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
                                <div class="ms-3">
                                    <div class="fw-bold">${noticeVO.writer}</div>
                                    <div class="text-muted">공지사항 디테일</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1">${noticeVO.title}</h1>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2">${noticeVO.regDate}</div>
                                    <!-- Post categories-->
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>
                                </header>
                                <!-- Preview image figure-->
                                <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure>
                                <!-- Post content-->
                                <section class="mb-5">
                                    ${noticeVO.contents}
                                     
                               
                                     <c:forEach items="${noticeVO.boardFileVOs}" var="boardFileVO">
                                    	
                                    	<img alt="2" src="/file/notice/${boardFileVO.fileName}">
                                    	<%-- <img alt="3" src="/file/notice/${boardFileVO.fileName}">
                                    	<img alt="4" src="/file/notice/${boardFileVO.fileName}"> --%>
                                    	<a href="./fileDown?id=${boardFileVO.id}">${boardFileVO.oriName}</a>
                                    	
                                    </c:forEach>
                                    
                                
                                    
                                </section>
                            </article>
                            
                            <a class="btn btn-primary" href="./delete?id=${noticeVO.id}">글 삭제</a>
                            <button id="list" type="button" class="btn btn-outline-secondary"><a href="./list">목록으로</a></button>
                             <form action="./update" id="frm">
                             
                            <button id="update" type="submit" class="btn btn-outline-primary">상품수정</button>
                             </form>
                        </div>
                    </div>
                </div>
            </section>
        
	</main>
	
	<!-- Footer -->
 
    <!-- Footer -->
</body>
</html>
