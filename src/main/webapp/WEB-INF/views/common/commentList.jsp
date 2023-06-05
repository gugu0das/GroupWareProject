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


<c:forEach items="${list}" var="qnaCommentVO">
		
		<li>${qnaCommentVO.id}</li>
		<li>${qnaCommentVO.writer}</li>
		
		<p>
		<c:forEach begin="1" end="${qnaCommentVO.depth}">ㄴ></c:forEach>
		<span>${qnaCommentVO.contents}</span>
		</p>
		
		
		<a href="/qnaComment/reply?id=${qnaCommentVO.id}" class="btn btn-danger">댓글</a>
		<c:if test="${memberVO.accountId eq qnaCommentVO.writer}">
		<div class="col-sm-3">
		<button type="button" class="btn btn-primary del" id="commentListResult" data-qna-qna="${qnaCommentVO.id}">삭제</button>
		</div>
		<button type="button" class="btn btn-primary edit" id="contentsConfirm" data-comment-num="${qnaCommentVO.id}">수정</button>
		</c:if>
</c:forEach>
</ul>
</div>

</form:form>
<script src="/js/qnaReply.js"></script>

</body>
</html>

