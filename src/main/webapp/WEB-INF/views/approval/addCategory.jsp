<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="row upperOption" id="upperOption1" data-upper-count="1">
				<input type="text" name="upperName" id="upperName">
				<button id="deleteUpperOption">DELETE UPPER OPTION</button>
				<button id="addUnderOption">ADD UNDER OPTION</button>
				<div class="underOption" id="underOption1" data-under-count="1">
					&nbsp &nbsp<input type="text" name="underName" id="underName">
					<input type="text" name="fileId" id="fileId">
					<input type="text" name="deptId" id="deptId">
					<input type="text" name="jobId" id="jobId">
					<button id="deleteUnderOption">DELETE UNDER OPTION</button>
				</div>
			</div>
		</div>
		
		<form action="./addCategory" method="post" id="frm">
			<input type="hidden" name="json1" id="json1">
			
		</form>
		<button id="btn">SUBMIT</button>
	</div>
	<script src="/js/categoryAdd.js"></script>	
</body>
</html>