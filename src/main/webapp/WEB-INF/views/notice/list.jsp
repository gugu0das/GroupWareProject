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
<link href="/css/boardSidebar.css" rel="stylesheet">
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
       
        <!-- Header-->
        <div id="sidebar" class="card my-3">
        <a href="https://www.naver.com" class="naver-link">네이버 바로가기</a>
        </div>
        <section class="bg-light py-5">
        	<div class="container px-5 my-5">
        		<div class="text-center mb-5">
        			<h1 class="fw-bolder">${notice} List</h1>
        			<p class="lead fw-normal text-muted mb-0">With our no hassle pricing plans</p>
        		</div>
        		
        		<div>
        			<table class="table table-hover">
        				<thead>
        					<tr>
        						<th>Num</th>
        						<th>Title</th>
        						<th>Writer</th>
        						<th>Date</th>
        						<th>Hit</th>
        					</tr>
        				</thead>
        				<tbody>
        					<c:forEach items="${list}" var="boardVO">
        						<tr>
        							<td>${noticeVO.noticeNum}</td>
        							<td><a href="./detail?num=${noticeVO.noticeNum}">${noticeVO.title}</a></td>
        							<td>${noticeVO.writer}</td>
        							<td>${noticeVO.regDate}</td>
        							<td>${noticeVO.hit}</td>
        						</tr>
        					</c:forEach>
        				</tbody>
        			</table>
        		</div>
        		
        		<!-- pager -->
        		<div class="row d-flex justify-content-between">
					<nav aria-label="Page navigation example">
						<ul class="pagination  d-flex justify-content-center wow fadeIn" data-wow-delay="0.1s"">
					 		<li class=" page-item ${pager.before ? 'disabled' : '' }">
								<a class="page-link" href="./list?page=1&kind=${pager.kind}&search=${pager.search}" aria-label="Previous" data-board-page="1">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="page-item ${pager.before ? 'disabled' : ''}">
								<a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous" data-board-page="${pager.startNum-1}">
									<span aria-hidden="true">&lsaquo;</span>
								</a>
							</li>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}" data-board-page="${i}">${i}</a></li>
							</c:forEach>
							<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
								<a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next" data-board-page="${pager.lastNum+1}">
									<span aria-hidden="true">&rsaquo;</span>
								</a>
							</li>
							<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
								<a class="page-link" href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}" aria-label="Next" data-board-page="${pager.totalPage}">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			
				<!-- 검색 -->
				<div class="row">
					<form class="row g-3" action="./list" method="get" id="searchForm">
						<input type="hidden" name="page" value="1" id="page">
					  <div class="col-auto">
					    <label for="kind" class="visually-hidden">Kind</label>
					    <select class="form-select" name="kind" id="kind" aria-label="Default select example">
						  <option value="title" ${pager.kind eq 'title'? 'selected':''}>Title</option>
						  <option value="content" ${pager.kind eq 'content' ?'selected':''}>Content</option>
						  <option value="writer" ${pager.kind eq 'writer'? 'selected':''}>Writer</option>
						</select>
					  </div>
					  <div class="col-auto">
					    <label for="search" class="visually-hidden">Search</label>
					    <input type="text" class="form-control" value="${pager.search}" name="search" id="search" placeholder="검색어를 입력하세요">
					  </div>
					  <div class="col-auto">
					    <button type="submit" class="btn btn-primary mb-3">검색</button>
					  </div>
					</form>
				</div>
        	</div>
        </section>
        
       
        	<a class="btn btn-primary" href="./add">글쓰기</a>
        
	</main>
	
	<!-- Footer -->
  
    <!-- Footer -->
</body>
</html>