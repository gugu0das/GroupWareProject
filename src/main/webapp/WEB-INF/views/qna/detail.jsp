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
<link href="/css/commentWriter.css" rel="stylesheet">
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/noticeDesign.css">
<style>
  .image-gallery {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start; /* 왼쪽 정렬 */
  }

  .image-container {
    width: 200px; /* 이미지 컨테이너의 너비를 조정해주세요 */
    margin-right: 10px; /* 이미지 사이의 간격을 조정해주세요 */
  }

  .gallery-image {
    width: 100%; /* 이미지 크기를 100%로 조정 */
    height: auto; /* 가로 비율에 맞춰 자동 조정 */
  }
</style>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
     <c:import url="../temp/header2.jsp"></c:import>

	<div class="qna-container">
    <h1 class="qna-title margin-top: 50px;">${qnaVO.title}</h1>
    <div class="qna-writer">작성자: ${qnaVO.writer}</div>
    <div class="qna-date">작성일: ${qnaVO.regDate}</div>
    </div>
    <div class="qna-container">
    <div class="qna-contents">${qnaVO.contents}</div>
    </div>   
        				
      						
        <!-- Page Content-->
            <section class="py-5">
            
                <div class="container px-5 my-5">
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
                            <section class="mb-5">
                                    
                                      
                                     
                                       <c:forEach items="${qnaVO.boardFileVOs}" var="boardFileVO">
                                    	
                                    	 <div class="image-container">
       									 <img alt="2" src="/file/qna/${boardFileVO.fileName}" class="gallery-image">
       									 </div>
                                    	<div>
                                    	클릭시 다운로드 가능 :<a href="./fileDown?id=${boardFileVO.id}">${boardFileVO.oriName}</a>
                                    	</div>
                                    </c:forEach>
                                    
                                
                                    
                                </section>
                             
                            <div class="mb-5" id="commentListResult">
                                
                            </div>
                            <div class="mb-5">
                                  <div class="mb-3">
                                    <textarea class="form-control" rows="3" id="replyContents"></textarea>
                                  </div> 
                                  <div class="mb-3">
                                    <button type="button" class="btn btn-primary" id="replyAdd" data-qna-qnaId="${qnaVO.id}">댓글등록</button>
                                  	
                                  	
                            </div>
                           
                            
         							
											<c:if test="${memberVO.id eq qnaVO.memberId}">	
											  <a class="btn btn-primary" href="./delete?id=${qnaVO.id}">글 삭제</a>
											  
											    
											    <a id="update" type="submit" class="btn btn-outline-primary" href="./update?id=${qnaVO.id}">상품 수정</a>
											  
											</c:if>
                            <button id="list" type="button" class="btn btn-outline-secondary"><a href="./list">목록으로</a></button>
                        </div>
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
