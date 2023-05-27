<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 

    <c:forEach items="${importantList}" var="importantList">
	<tr>
		<td class="id" data-num-id="${importantList.id}">${importantList.id}</td>
		<td class="d-flex align-items-center">
		<a class="title" href="./detail?id=${importantList.id}">${importantList.title}</a>
		</td>
		<td>${importantList.writer}</td>
		<td>${importantList.regDate}</td>
		<td>${importantList.hit}</td>
	</tr>
</c:forEach>