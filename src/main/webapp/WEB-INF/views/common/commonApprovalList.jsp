<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<c:forEach items="${list}" var="vo"> 
<tr>

	<td>${vo.id}</td>
	<td><a href="./check?id=${vo.id}">${vo.contents}</a></td>
	<td>${vo.date}</td>
	<td>${vo.memberId}</td>

</tr>


</c:forEach>