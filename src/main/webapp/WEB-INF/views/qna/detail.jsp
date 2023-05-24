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

<link rel="stylesheet" href="/css/qnaReply.css">

</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
     <c:import url="../temp/header2.jsp"></c:import>
  

<title>SB Admin 2 - Dashboard</title>
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">/* Chart.js */
@
keyframes chartjs-render-animation {
	from {opacity: .99
}

to {
	opacity: 1
}

}
.chartjs-render-monitor {
	animation: chartjs-render-animation 1ms
}

.chartjs-size-monitor, .chartjs-size-monitor-expand,
	.chartjs-size-monitor-shrink {
	position: absolute;
	direction: ltr;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	overflow: hidden;
	pointer-events: none;
	visibility: hidden;
	z-index: -1
}
.change{
border :none;
}
.chartjs-size-monitor-expand>div {
	position: absolute;
	width: 1000000px;
	height: 1000000px;
	left: 0;
	top: 0
}

.chartjs-size-monitor-shrink>div {
	position: absolute;
	width: 200%;
	height: 200%;
	left: 0;
	top: 0
}
</style>   						
        
        				
      						
        <!-- Page Content-->
            <section class="py-5">
            
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <img class="img-fluid rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
                                <div class="ms-3">
                                    <div class="fw-bold">${qnaVO.writer}</div>
                                    <div class="text-muted">커뮤니티 디테일</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1">${qnaVO.title}</h1>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2">${qnaVO.regDate}</div>
                                    <!-- Post categories-->
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>
                                </header>
                                <!-- Preview image figure-->
                                <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure>
                                <!-- Post content-->
                                <section class="mb-5">
                                    ${qnaVO.contents}
                                     
                                     
                                       <c:forEach items="${qnaVO.boardFileVOs}" var="boardFileVO">
                                    	
                                    	<img alt="2" src="/file/qna/${boardFileVO.fileName}">
                                    	
                                    	<a href="./fileDown?id=${boardFileVO.id}">${boardFileVO.oriName}</a>
                                    	
                                    </c:forEach>
                                    
                                
                                    
                                </section>
                               
                            </article>
                            	<%-- <c:if test="${qnaDetail ne 'notice'}"> --%>
                           
                            	<%-- </c:if> --%>
                            <div class="mb-5" id="commentListResult">
                                
                            </div>
                            <div class="mb-5">
                                  <div class="mb-3">
                                    <textarea class="form-control" rows="3" id="replyContents"></textarea>
                                  </div> 
                                  <div class="mb-3">
                                    <button type="button" class="btn btn-primary" id="replyAdd" data-qna-qnaId="${qnaVO.id}">댓글등록</button>
                                  	
                                  </div>
                            </div>
                            
                            
                            <a class="btn btn-primary" href="./delete?id=${qnaVO.id}">글 삭제</a>
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
 <script src="/js/qnaReply.js"></script>
	
 <!-- <script src="/js/commentListResult.js"></script> -->
    <!-- Footer -->
</body>
</html>
