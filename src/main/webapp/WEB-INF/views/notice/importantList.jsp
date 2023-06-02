<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 

    <c:forEach items="${importantList}" var="importantList">
	<tr  style="color: rgb(243, 6, 6); background-color: rgba(182, 182, 165, 0.945);">
		<td class="id" data-num-id="${importantList.id}">${importantList.id}</td>
		<td class="d-flex align-items-center">
		<a class="title" href="./detail?id=${importantList.id}">${importantList.title}</a></td>
		<td>${importantList.writer}</td>
		<td>${importantList.regDate}</td>
		<td>${importantList.hit}</td>
	</tr>
</c:forEach>