<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	  <thead>
                                        <tr role="row"><th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 99px;">번호</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 148px;">제목</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 71px;">작성자</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 31px;">날짜</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 74px;">조회수</th>                                    
                                    </thead>
                                    <tfoot>
                                        <tr><th rowspan="1" colspan="1">번호</th><th rowspan="1" colspan="1">제목</th><th rowspan="1" colspan="1">작성자</th><th rowspan="1" colspan="1">날짜</th><th rowspan="1" colspan="1">조회수</th>
                                    </tfoot>

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