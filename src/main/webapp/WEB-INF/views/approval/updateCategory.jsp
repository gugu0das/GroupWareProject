<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/header.jsp"></c:import>

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<table class="table table-hover col-md-10 mx-auto my-3">
			<thead>
				<tr>
					<th>상하 구분</th>
					<th>카테고리 아이디</th>
					<th>카테고리 이름</th>
					<th>결재 양식파일</th>
					<th>결재자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list0}" var="upper">
					<tr id="${upper.id}">
						<td>상위 옵션</td>
						<td>
							<span>${upper.id}</span>
							<button class="btn btn-danger" id="deleteOption">삭제하기</button>
						</td>
						<td>
							<span>${upper.name}</span>
							<button class="btn btn-primary" id="updateOptionName">수정하기</button>
						</td>
						<td>
							<c:forEach items="${listFormFile}" var="file">
								<c:if test="${file.categoryId == upper.id}">
									<span>${file.fileId}</span>
									<button class="btn btn-primary" id="updateFile">수정하기</button>
								</c:if>
							</c:forEach>
						</td>
						<td>
							<c:forEach items="${listApprover}" var="approver">
								<c:if test="${approver.categoryId == upper.id}">
									<span id="departmentId">${approver.departmentId}</span>
									<span id="jobId">${approver.jobId}</span>
									<button class="btn btn-primary" id="updateApprover">수정하기</button>
									<button class="btn btn-danger" id="deleteApprover">삭제하기</button>
								</c:if>
							</c:forEach>
						</td>
					</tr>
					<c:forEach items="${list1}" var="under">
						<c:if test="${upper.id == under.ref}">
							<tr id="${under.id}">
								<td>하위 옵션</td>
								<td>
									<span>${under.id}</span>
									<button class="btn btn-danger" id="deleteOption">삭제하기</button>
								</td>
								<td>
									<span>${under.name}</span>
									<button class="btn btn-primary" id="updateOptionName">수정하기</button>
								</td>
								<td>
									<c:forEach items="${listFormFile}" var="file">
										<c:if test="${file.categoryId == under.id}">
											<span>${file.fileId}</span>
											<button class="btn btn-primary" id="updateFile">수정하기</button>
										</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${listApprover}" var="approver" varStatus="i">
										<c:if test="${approver.categoryId == under.id}">
											<c:forEach items="${approver.departmentVOs}" var="department" varStatus="status">
												<div id="approver" data-approver-depth="${approver.depth}">
													<span id="departmentId" data-department-id="${department.id}">${department.name}</span>
													<span id="jobId" data-job-id="${approver.jobVOs[status.index].id}">${approver.jobVOs[status.index].name}</span>
													<button class="btn btn-primary" id="updateApprover">수정하기</button>
													<button class="btn btn-danger" id="deleteApprover">삭제하기</button>
												</div>
											</c:forEach>
										</c:if>
									</c:forEach>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/js/updateCategory.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.js"></script>
	
</body>
</html>