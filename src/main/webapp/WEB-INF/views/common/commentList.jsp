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
		<span>${qnadepth}</span><span class=form-control> ${qnaCommentVO.contents}</span>
		</c:when>
		<c:otherwise>
		<span class=form-control> ${qnaCommentVO.contents}</span>
		</c:otherwise>
		</c:choose>
		
		
		</p>
		<div class="text">
		
		</div>
		<div class="col row">
		<button type="button" class="btn btn-danger upup" data-qna-down="${qnaCommentVO.id}">댓글</button>
		
		
		<c:if test="${memberVO.accountId eq qnaCommentVO.writer}">
		
		<button type="button" class="btn btn-primary del" id="commentListResult" data-qna-qna="${qnaCommentVO.id}" style="width : 58px; height : 38px; ">삭제</button>

		<button type="button" class="btn btn-primary edit" id="contentsConfirm" data-comment-num="${qnaCommentVO.id}" >수정</button>
		
		</c:if>
		</div>
		</ul>
</c:forEach>
</ul>
</div>

</form:form>
<script src="/js/qnaReply.js"></script>

</body>
</html>

