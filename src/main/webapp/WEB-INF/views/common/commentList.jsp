<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<link rel="stylesheet" href="/static/css/main/css/line_sticker-1644284985000-9453.css" type="text/css">
<link rel="stylesheet" href="/static/css/main/css/comment-1644284985000-17199.css" type="text/css">

<link rel="stylesheet" href="/static/css/main/css/map/cafe_map-1644284985000-14563.css" type="text/css">
<link rel="stylesheet" href="/static/css/main/css/wide/1080_cafe-1663739945000-227641.css" type="text/css">


<link rel="stylesheet" href="/main/resources/static/css/commentWriter.css" type="text/css">
<link rel="stylesheet" href="/css/noticeDesign.css">
<style type="text/css">

  .red-text {
    color: red;
  }
  .blue-text{
   	color: blue;
  }
</style>

<body>


<form:form modelAttribute="qnaCommentVO" method="post" action="./update" id="updateForm">
<div class="comment_box">
<ul class="cmt_list">									
<!-- break -->
<%-- <c:set var="loop_flag" value="true" /> --%>

<c:forEach items="${list}" var="qnaCommentVO">
<c:set var="qnadepth" value=""></c:set>
		<c:forEach items="${list}" var="vo">
		
		
			<c:if test="${vo.id eq vo.ref and qnaCommentVO.ref eq vo.id}">
				<c:set var="qnadepth" value="${vo.writer}"></c:set>
				<c:set var="loop_flag" value="true" />
			</c:if>
		</c:forEach>
		<ul>
		 
		
		<li class="red-text">${qnaCommentVO.writer}</li>
		
		<p class="blue-text">
		
		<c:choose>
		
		<c:when test="${qnaCommentVO.id ne qnaCommentVO.ref}">
		${qnadepth}<span class=form-control> ${qnaCommentVO.contents}</span>
		</c:when>
		<c:otherwise>
		<span class=form-control> ${qnaCommentVO.contents}</span>
		</c:otherwise>
		</c:choose>
		
		
		</p>
		<div class="text">
		
		</div>
		<div class="col row">
		<button type="button" class="btn btn-outline-success upup" data-qna-down="${qnaCommentVO.id}"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="-4 -4 20 20" x="80" y="86"><defs><path id="t" d="M0 11.1h12V0H0z"/></defs><g fill="none" fill-rule="evenodd"><path fill="#575756" d="M0 8.056V11.1h3.044L9.39 4.677 6.356 1.642zM10.486 3.58l.017-.019c.327-.387.508-.88.508-1.387C11.01.987 10.045 0 8.859 0c-.507 0-1 .202-1.406.547l-.673.671 3.034 3.034.672-.672z"/><mask id="u" fill="#fff"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#t"/></mask><path fill="#575756" d="M4.8 11.1H12v-.6H4.8z" mask="url(#u)"/></g></svg>댓글</button>
		
		
		<c:if test="${memberVO.accountId eq qnaCommentVO.writer}">
		
		<button type="button" class="btn btn-outline-danger del" id="commentListResult" data-qna-qna="${qnaCommentVO.id}" style="width : 78px; height : 38px; "><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="-4 -4 20 20" x="60" y="86"><path fill="none" stroke="#D3D3D3" d="M9.6 2.4L2.4 9.6m-.044-7.244L9.6 9.6"/></svg>삭제</button>
		
		<button type="button" class="btn btn-outline-primary edit" id="contentsConfirm" data-comment-num="${qnaCommentVO.id}" ><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="-4 -4 18 18" x="37" y="108"><defs><path id="g" d="M12 12V0H0v12h12z"/></defs><g fill="none" fill-rule="evenodd" opacity=".9" transform="translate(-1 -1)"><mask id="h" fill="#fff"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#g"/></mask><path fill="#A3A9A9" d="M9.82 6.49c.02-.16.036-.32.036-.49 0-.17-.015-.33-.036-.49l1.085-.825a.248.248 0 0 0 .062-.32l-1.028-1.73a.262.262 0 0 0-.314-.11l-1.28.5a3.782 3.782 0 0 0-.869-.49L7.281 1.21A.249.249 0 0 0 7.03 1H4.973a.249.249 0 0 0-.252.21l-.195 1.325a3.977 3.977 0 0 0-.869.49l-1.28-.5a.254.254 0 0 0-.313.11l-1.028 1.73a.242.242 0 0 0 .061.32l1.085.825c-.02.16-.036.325-.036.49 0 .165.015.33.036.49l-1.085.825a.248.248 0 0 0-.061.32l1.028 1.73c.061.11.2.15.313.11l1.28-.5c.267.2.555.365.869.49l.195 1.325a.25.25 0 0 0 .252.21H7.03c.129 0 .237-.09.252-.21l.195-1.325c.314-.125.602-.295.87-.49l1.279.5c.118.045.252 0 .314-.11l1.028-1.73a.248.248 0 0 0-.062-.32L9.82 6.49zM6.001 7.75c-.992 0-1.799-.785-1.799-1.75s.807-1.75 1.8-1.75c.99 0 1.798.785 1.798 1.75s-.807 1.75-1.799 1.75z" mask="url(#h)"/></g></svg>수정</button>
		<%-- <button type="button" class="dropdown-toggle" id="dropdownButton" data-comment-data="${qnaCommentVO.id}" ><svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="-4 -4 23 23" x="92" y="46"><defs><path id="q" d="M0 0h15v15H0z"/></defs><g fill="none" fill-rule="evenodd"><use fill="#FFF" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#q"/><path stroke="#E5E5E5" d="M.5.5h14v14H.5z"/><path fill="#777" d="M7.5 10L5 7h5z"/></g></svg>댓글보기</button>
		<ul class="dropdown-menu">
		<li><a class="dropdown-item" href="#">댓글</a></li>
    	<li><a class="dropdown-item" href="#">댓글</a></li>
   		<li><a class="dropdown-item" href="#">댓글</a></li>
    	<li><hr class="dropdown-divider"></li>
    	<li><a class="dropdown-item" href="#">댓글</a></li>
		</ul> --%>
		
		</c:if>
		</div>
		</ul>
</c:forEach>
</ul>
<div class="row d-flex justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination  d-flex justify-content-center wow fadeIn"
								data-wow-delay="0.1s"">
								<li class=" page-item ${pager.before ? 'disabled' : '' }">
									<a class="page-link"
									href="#"
									aria-label="Previous" data-board-page="1"> <span
										aria-hidden="true">&laquo;</span>
								</a>
								</li>
								<li class="page-item ${pager.before ? 'disabled' : ''}"><a
									class="page-link"
									href="#"
									aria-label="Previous" data-board-page="${pager.startNum-1}">
										<span aria-hidden="true">&lsaquo;</span>
								</a></li>
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
									var="i">
									<li class="page-item"><a class="page-link"
										href="#"
										data-board-page="${i}">${i}</a></li>
								</c:forEach>
								<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
									<a class="page-link"
									href="#"
									aria-label="Next" data-board-page="${pager.lastNum+1}"> <span
										aria-hidden="true">&rsaquo;</span>
								</a>
								</li>
								<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
									<a class="page-link"
									href="#"
									aria-label="Next" data-board-page="${pager.totalPage}"> <span
										aria-hidden="true">&raquo;</span>
								</a>
								</li>
							</ul>
						</nav>
					</div>


</form:form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>
<script src="/js/qnaReply.js"></script>
</body>
</html>

