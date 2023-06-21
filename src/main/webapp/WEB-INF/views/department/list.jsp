<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/header.jsp"></c:import>
<!-- Custom styles for this template-->
<c:import url="../temp/style.jsp"></c:import>
</head>
<body class="bg-gradient-primary">
	<div id="wrapper">
		<!-- sideBar -->
		<c:choose>
			<c:when test="${memberVO.accountId == 'admin'}">
				<c:import url="../temp/adminSidebar.jsp"></c:import>
			</c:when>
			<c:otherwise>
				<c:import url="../temp/sidebar.jsp"></c:import>
			</c:otherwise>
		</c:choose>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">

				<c:choose>
					<c:when test="${memberVO.accountId == 'admin'}">
						<c:import url="../temp/adminTopbar.jsp"></c:import>
					</c:when>
					<c:otherwise>
						<c:import url="../temp/topbar.jsp"></c:import>
					</c:otherwise>

				</c:choose>

				<!-- contents 작성 -->
				<div class="container-fluid">
					<h2>부서 리스트</h2>
					<div class="card mb-4 mb-xl-0">

						<div class="card-body">

							<div id="tree-container"></div>
						</div>
					</div>
					<br>
					<h2>직책 리스트</h2>
					<div class="row">
						<div class="card mb-4 mb-xl-0 col-6">
							<div class="card-body">
								<div class="table-responsive" style="overflow-x: hidden">
									<table class="table table-hover" id="dataTable"
										style="text-align: center;">
										<thead>
											<tr>
												<th>직책번호</th>
												<th>직책 이름</th>



											</tr>
										</thead>
										<tbody>
											<c:forEach items="${jobList }" var="jobVO" varStatus="i">
												<tr class="jobVO" style="cursor: pointer;" data-job-id="${jobVO.id }" data-job-name="${jobVO.name }">

													<td>${i.index}</td>
													<td>${jobVO.name }</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- END Contents  -->

				<!-- Footer -->
			
				<!-- End of Footer -->
			</div>
			<!-- End of Content Wrapper -->
		</div>
		<!-- End of Page Wrapper -->
	</div>
	<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
	<script src="/js/departmentList.js"></script>
</body>
</html>