<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<c:forEach items="${list0}" var="category">
			<li value="${category.id}">${category.name}
				<div>
					<c:forEach items="${list1}" var="underCategory">					
						<c:if test="${underCategory.ref == category.id}">
							<a id="${underCategory.id}" href="">${underCategory.name}</a>						
						</c:if>
					</c:forEach>
				</div>
			</li>
		</c:forEach>
	</ul>
</body>
</html>