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
		<c:import url="../temp/sidebar.jsp"></c:import>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:import url="../temp/topbar.jsp"></c:import>

				<!-- contents 작성 -->
				<div class="container-fluid">
					<h1 class="h3 mb-3 text-gray-800">${vo.name}</h1>
					<div class="row">
					
						<div class="col-xl-4 mb-3">
							<div class="card mb-4 mb-xl-0">
								<div class="card-header">부서정보</div>
								<div class="card-body px-0">
									<div
										class="d-flex align-items-center justify-content-between px-4">
										<div class="d-flex align-items-center">
											<div class="ms-4">
												<div class="small text-Secondary">부서명</div>
												<div class="text-dark h4">${vo.name}</div>
											</div>
										</div>
										<div class="ms-4">
											<div class="badge bg-light text-primary me-3">
												<a href="#">수정하기</a>
											</div>

										</div>
									</div>
									<hr>

									<div
										class="d-flex align-items-center justify-content-between px-4">
										<div class="d-flex align-items-center">
											<div class="ms-4">
												<div class="small text-Secondary">담당자</div>
												<c:if test="${not empty vo.manager }">
													<div class="text-dark h4">${vo.manager}</div>
												</c:if>
												<c:if test="${empty vo.manager}">
													<div class="text-dark h4">없음</div>
												</c:if>
											</div>
										</div>
										<div class="ms-4">
											<div class="badge bg-light text-primary me-3">
												<a href="#">수정하기</a>
											</div>

										</div>
									</div>
									<c:if test="${not empty vo.upper }">
										<hr>
										<div
											class="d-flex align-items-center justify-content-between px-4">
											<div class="d-flex align-items-center">
												<div class="ms-4">
													<div class="small text-Secondary">상위부서</div>
													
														<div class="text-dark h4">${vo.upperDepartment.name}</div>
													
												</div>
											</div>
											<div class="ms-4">
												<div class="badge bg-light text-primary me-3">
													<a href="#">수정하기</a>
												</div>

											</div>
										</div>
									</c:if>
									<hr>

									<div
										class="d-flex align-items-center justify-content-between px-4">
										<div class="d-flex align-items-center">
											<div class="ms-4">
												<div class="small text-Secondary">생성일</div>

												<div class="text-dark h4">${vo.createDate}</div>

											</div>
										</div>
										<div class="ms-4">
											<div class="badge bg-light text-primary me-3">
												<a href="#">수정하기</a>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-7">
							<div class="card mb-4 mb-xl-0">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold ">사원정보</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive">
									
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>직책</th>
													<th>사원번호</th>
													<th>이름</th>
													<th>입사일</th>
													
		
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${vo.memberVOs }" var="memberVO">
													<tr>
														<th>${memberVO.jobVO.name }</th>
														<th>${memberVO.employeeId }</th>
														<th>${memberVO.name }</th>
														<th>${memberVO.hireDate }</th>

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
					<footer class="sticky-footer bg-white">
						<div class="container my-auto">
							<div class="copyright text-center my-auto">
								<span>Copyright © Your Website 2021</span>
							</div>
						</div>
					</footer>
					<!-- End of Footer -->
				</div>
				<!-- End of Content Wrapper -->
			</div>
		</div>
		<!-- End of Page Wrapper -->
	</div>
	<!-- Page level plugins -->
    <script src="/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<!-- 
    Page level custom scripts
    <script src="js/demo/datatables-demo.js"></script> -->
	
	<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
</body>
</html>