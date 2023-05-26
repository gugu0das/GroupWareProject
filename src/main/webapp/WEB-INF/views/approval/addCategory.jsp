<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row" id="main">
			<button id="addCategoryOption">ADD CATEGORY OPTION</button>
				<form action="./addCategory" method="post" id="frm" encType="multipart/form-data">
				<div class="row upperOption" id="upperOption1" data-upper-count="1">
					<input type="text" name="upperName" id="upperName">
					<button id="deleteUpperOption">DELETE UPPER OPTION</button>
					<button id="addUnderOption">ADD UNDER OPTION</button>
					<div class="underOption" id="underOption1" data-under-count="1">
						&nbsp &nbsp<input type="text" name="underName" id="underName">
						<button id="deleteUnderOption">DELETE UNDER OPTION</button>
						<input type="file" name="fileId" id="fileId">
						<div id="approver" data-approver-count="1">
							<select id="deptId" class="form-control">
								<option value="부서" selected>부서</option>
								<c:forEach items="${deptList}" var="dept">
									<option value="${dept.id}">${dept.name}</option>
								</c:forEach>
							</select>
							<button id="addApprover">ADD APPROVER</button>
							<button id="deleteApprover">DELETE APPROVER</button>
							
						</div>
						
					</div>
				</div>
				<input type="hidden" name="json1" id="json1">	
				</form>
		</div>
		
		
			
		
		<button id="btn">SUBMIT</button>
	</div>
	<script src="/js/approver.js"></script>	
	<script src="/js/categoryAdd.js"></script>	
</body>
</html>