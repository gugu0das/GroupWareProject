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
<style type="text/css">


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
		<ul >
		
		<li>${qnaCommentVO.writer}</li>
		
		<p>
		
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
		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="-4 -4 20 20" x="80" y="86"><defs><path id="t" d="M0 11.1h12V0H0z"/></defs><g fill="none" fill-rule="evenodd"><path fill="#575756" d="M0 8.056V11.1h3.044L9.39 4.677 6.356 1.642zM10.486 3.58l.017-.019c.327-.387.508-.88.508-1.387C11.01.987 10.045 0 8.859 0c-.507 0-1 .202-1.406.547l-.673.671 3.034 3.034.672-.672z"/><mask id="u" fill="#fff"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#t"/></mask><path fill="#575756" d="M4.8 11.1H12v-.6H4.8z" mask="url(#u)"/></g></svg><button type="button" class="btn btn-danger upup" data-qna-down="${qnaCommentVO.id}">댓글</button>
		
		
		<c:if test="${memberVO.accountId eq qnaCommentVO.writer}">
		
		<button type="button" class="btn btn-primary del" id="commentListResult" data-qna-qna="${qnaCommentVO.id}" style="width : 58px; height : 38px; ">삭제</button>

		<button type="button" class="btn btn-primary edit" id="contentsConfirm" data-comment-num="${qnaCommentVO.id}" >수정</button>
		
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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>



<script src="/js/qnaReply.js"></script>

</body>
</html>

