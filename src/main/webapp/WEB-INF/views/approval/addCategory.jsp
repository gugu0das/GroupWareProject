<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:import url="../temp/header.jsp"></c:import>

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
	
	<div class="container-fluid">
		<div class="col-md-10 mx-auto my-3">
			<button id="addCategoryOption" class="btn btn-primary">상위옵션 추가</button>
		</div>
		<form action="./addCategory" method="post" id="frm" encType="multipart/form-data">
		<table class="table table-hover col-md-10 mx-auto my-3">
			<thead>
				<tr>
					<th><p class="text-center my-auto">상하 구분</p></th>
					<th><p class="text-center my-auto">카테고리 이름</p></th>
					<th><p class="text-center my-auto">결재 양식파일</p></th>
					<th><p class="text-center my-auto">결재자</p></th>
				</tr>
			</thead>
			<tbody>
				<tr class="upperOption" data-count="1">
					<td class="text-center my-auto">
						상위 옵션
					</td>
					<td>
						<input class="upperName" type="text" name="upperName" id="upperName">
						<button type="button" id="deleteUpperOption" class="btn btn-danger">상위옵션 삭제</button>
						<button type="button" id="addUnderOption" class="btn btn-primary">하위옵션 추가</button>
					</td>
				</tr>
				<tr class="underOption" data-count="1">
					<td class="text-center my-auto">
						하위 옵션
					</td>
					<td>
						<input class="underName" type="text" name="underName" id="underName">
						<button type="button" id="deleteUnderOption" class="btn btn-danger">하위옵션 삭제</button>
					</td>
					<td>
						<input class="fileId" type="file" name="fileId" id="fileId">
					</td>
					<td>
						<div id="approver" data-approver-count="1">
							<select id="deptId" class="deptId form-control">
								<option value="부서" selected>부서</option>
								<c:forEach items="${deptList}" var="dept">
									<option value="${dept.id}">${dept.name}</option>
								</c:forEach>
							</select>
							<button type="button" id="addApprover" class="btn btn-primary">결재자 추가</button>
							<button type="button" id="deleteApprover" class="btn btn-danger">결재자 삭제</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
			<input type="hidden" name="json1" id="json1">
			<button type="button" id="submitBtn">SUBMIT</button>
		</form>
	</div>
	
	
	<script src="/js/approver.js"></script>	
	<script src="/js/categoryAdd.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.js"></script>
</body>
</html>