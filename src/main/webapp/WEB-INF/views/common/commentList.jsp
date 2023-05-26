<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<body>
<table class="table table-striped">
<c:forEach items="${list}" var="qnaCommentVO"> 
	<tr>
		<td>${qnaCommentVO.id}</td>
		<c:forEach begin="1" end="${qnaCommentVO.depth}">ㄴ></c:forEach>
		<td><a href="/qnaComment/detail2?id=${qnaCommentVO.id}">${qnaCommentVO.contents}</a></td>
		
		<td><a href="/qnaComment/reply?id=${qnaCommentVO.id}" class="btn btn-danger">댓글</a></td>
		<td><button type="button" class="btn btn-primary" id="commentListResult" data-qna-qna="${qnaCommentVO.id}">삭제</button></td>
			
        <td> <a class="btn btn-primary" href="./delete?id=${qnaCommentVO.id}" id="commentListResult" data-qna-qna="${qnaCommentVO.id}">글 삭제</a></td>
			
		<td><button id="update" type="submit" class="btn btn-outline-primary">수정</button></td>
		
	</tr>


</c:forEach>
</table>
<script src="/js/qnaReply.js"></script>

<!-- <script src="/js/commentListResult.js"></script> -->
</body>
</html>

