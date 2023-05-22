<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="row col-md-5">
		<table class="table table-hover">
			<thead>
				<td>제목</td>
			</thead>
			 <tbody>
				<c:forEach items="${list}" var="noticeVO">
					<tr>
						
                       <td>
                       <a href="./detail?id=${noticeVO.id}">${noticeVO.title}</a></td>
                        
                   		<c:if test="${i.first}">
                   		 	${noticeVO.contents}
                   		</c:if>				
					</tr>
				</c:forEach>
			</tbody>
		
		</table>
	</div>