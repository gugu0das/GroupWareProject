<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<style type="text/css">


.change {
	border: none;
}

</style>
<body>


<form:form modelAttribute="qnaCommentVO" method="post" action="./update" id="updateForm">
										
<table class="table table-striped">
<c:forEach items="${list}" var="qnaCommentVO"> 
	<tr>
		<td>${qnaCommentVO.id}</td>
		
		<td><c:forEach begin="1" end="${qnaCommentVO.depth}">ㄴ></c:forEach  cssClass="form-control change"
													id="accountId" readonly="true">${qnaCommentVO.contents}</td>
		
		<td><a href="/qnaComment/reply?id=${qnaCommentVO.id}" class="btn btn-danger">댓글</a></td>
		<td><button type="button" class="btn btn-primary del" id="commentListResult" data-qna-qna="${qnaCommentVO.id}">삭제</button></td>
		
		<td><button type="button" class="btn btn-primary" id="updatebtn">수정</button></td>
		
	</tr>
	
	
</c:forEach>
</table>
</form:form>
<script src="/js/qnaReply.js"></script>
<script src="/js/commentUpdate.js"></script>

<!-- <script src="/js/commentListResult.js"></script> -->
</body>
</html>

