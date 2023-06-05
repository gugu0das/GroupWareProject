<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<th><p class="text-center my-auto">상하 구분</p></th>
					<th><p class="text-center my-auto">카테고리 아이디</p></th>
					<th><p class="text-center my-auto">카테고리 이름</p></th>
					<th><p class="text-center my-auto">결재 양식파일</p></th>
					<th><p class="text-center my-auto">결재자</p></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list0}" var="upper">
					<tr id="${upper.id}" class="upperOption" data-count="1">
						<td>
							<span>상위 옵션</span>
							<button class="btn btn-primary" id="addUnderOption">하위 옵션 추가</button>
						</td>
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
									<span>${file.fileName}</span>
									<button class="btn btn-primary" id="updateFile">수정하기</button>
								</c:if>
							</c:forEach>
						</td>
						<td>
							<c:set var="check" value="0"/>
							<c:forEach items="${listApprover}" var="approver" varStatus="i">
								<c:if test="${approver.categoryId == upper.id}">
									<c:set var="check" value="1"/>
									<c:forEach items="${approver.departmentVOs}" var="department" varStatus="status">
										<div id="approver" data-approver-depth="${approver.depth}">
											<span id="departmentId" data-department-id="${department.id}">${department.name}</span>
											<span id="jobId" data-job-id="${approver.jobVOs[status.index].id}">${approver.jobVOs[status.index].name}</span>
											<button class="btn btn-primary" id="updateApprover">수정하기</button>
											<button class="btn btn-danger" id="deleteApprover">삭제하기</button>
										</div>
										<br>
									</c:forEach>
								</c:if>
							</c:forEach>
							<c:if test="${check == 1}">
								<button class="btn btn-primary" id="addApprover" data-hide="yes">추가하기</button>
							</c:if>
						</td>
					</tr>
					<c:forEach items="${list1}" var="under" varStatus="status">
						<c:if test="${upper.id == under.ref}">
							<tr id="${under.id}" class="underOption" data-count="${status.count}">
								<td><span>하위 옵션</span></td>
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
											<span>${file.fileName}</span>
											<button class="btn btn-primary" id="updateFile">수정하기</button>
										</c:if>
									</c:forEach>
								</td>
								<td>
								<button class="btn btn-primary" id="addApprover" data-hide="yes">추가하기</button>
									<c:forEach items="${listApprover}" var="approver" varStatus="i">
										<c:if test="${approver.categoryId == under.id}">
											<c:forEach items="${approver.departmentVOs}" var="department" varStatus="status">
												<div id="approver" data-approver-depth="${approver.depth}">
													<span id="departmentId" data-department-id="${department.id}">${department.name}</span>
													<span id="jobId" data-job-id="${approver.jobVOs[status.index].id}">${approver.jobVOs[status.index].name}</span>
													<button class="btn btn-primary" id="updateApprover">수정하기</button>
													<button class="btn btn-danger" id="deleteApprover">삭제하기</button>
												</div>
												<br>
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
	<div id="hide">
		<select id="deptId" class="form-control">
			<c:forEach items="${listDepartment}" var="dept">
				<option value="${dept.id}">${dept.name}</option>
			</c:forEach>
		</select>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/js/updateCategory.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.js"></script>
	
</body>
</html>