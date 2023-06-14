<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${empty c}">
<c:forEach items="${list}" var="vo" varStatus="status" end="2">
	<c:choose>
	<!--  전자 결재  신청-->
	<c:when test="${vo.type eq 1}">
    <a class="dropdown-item d-flex align-items-center" href="/approval/information?allimId=${vo.id}">
				
					<div>
						<div class="small text-gray-500">${vo.startDate}</div>
						전자 결재 신청 알림
					</div>
					
				</a> 
				</c:when>
				<!--  전자 결재  신청 결과-->
				<c:when test="${vo.type eq 2}">
    	<a class="dropdown-item d-flex align-items-center" href="/approval/myInformation?allimId=${vo.id}">
				
					<div>
						<div class="small text-gray-500">${vo.startDate }</div>
						전재 결재 신청 결과 알림
					</div>
					
				</a> 
				</c:when>
				<!--  댓글 -->
				<c:when test="${vo.type eq 3}">
				
					 <a class="dropdown-item d-flex align-items-center" href="/qna/detail?id=${vo.qnaId}&&allimId=${vo.id}">
				
					<div>
						<div class="small text-gray-500">${vo.startDate }</div>
						댓글 알림
					</div>
					
				</a> 
				</c:when>
				<!--  대댓글 -->
				<c:when test="${vo.type eq 4}">
				
					 <a class="dropdown-item d-flex align-items-center" href="/qna/detail?id=${vo.qnaId}&& allimId=${vo.id}">
				
					<div>
						<div class="small text-gray-500">${vo.startDate }</div>
						대댓글 알림
					</div>
					
				</a> 
				</c:when>
				</c:choose>
				</c:forEach>
				<a class="dropdown-item text-center small text-gray-500" href="#" id="show">Show
					All Alerts</a>
				</c:when>
				<c:otherwise>
				<h6 class="dropdown-header">Alerts Center</h6>
	
				
					<c:forEach items="${list}" var="vo" varStatus="status">
					<c:choose>
			<c:when test="">
					
    				<a class="dropdown-item d-flex align-items-center" href="#">
				
					<div>
						<div class="small text-gray-500">${vo.startDate}</div>
						${vo.type}
					</div>
					
				</a> 
				</c:when>
				<c:when test="">
				
					 <a class="dropdown-item d-flex align-items-center" href="#">
				
					<div>
						<div class="small text-gray-500">${vo.startDate }</div>
						${vo.type}
					</div>
					
				</a>
				</c:when>
				</c:choose>
				</c:forEach>
				</c:otherwise>
				
				</c:choose>
				
</body>
</html>