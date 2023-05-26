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
					<h1 class="h3 mb-4 text-gray-800">${vo.name}</h1>
					<div class="row">

						<div class="col-xl-4 mb-3">
							<div class="card mb-4 mb-xl-0">

								<div class="card-header px-0">
									<div
										class="d-flex align-items-center justify-content-between px-4">
										<div class="d-flex align-items-center">
											<div class="ms-4">
												<div class="text-dark h5">부서정보</div>
											</div>
										</div>
										<div class="ms-4">
											<div id="updateBtn" class="badge bg-primary text-white me-3"
												style="cursor: pointer">수정하기</div>
											<div id="deleteBtn" class="badge bg-danger text-white me-3"
												style="cursor: pointer">삭제하기</div>
										</div>
									</div>
								</div>
								<form action="./delete" method="post" id="frm">
									<input type="hidden" value="${vo.id }" name="id">
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
												<div class="badge bg-light text-primary me-3"></div>


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
												<!-- <div class="badge bg-light text-primary me-3">
													<a href="#">수정하기</a>
												</div> -->

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
													<!-- <div class="badge bg-light text-primary me-3">
														<a href="#">수정하기</a>
													</div>
 -->
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
												<!-- <div class="badge bg-light text-primary me-3">
													<a href="#">수정하기</a>
												</div> -->

											</div>
										</div>
									</div>
								</form>
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
	<!--  <script src="/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>
 -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="" aria-hidden="true">
		<form action="./update" method="post" id="modalfrm">
		<input type="hidden" value="${vo.id }" name="id">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="">부서수정</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<h4>부서명</h4>
						<input type="text" class="form-control" value="${vo.name}"
							name="name">
						<hr>
						<h4>담당자</h4>
						<div class="row">
							<div class="col-10">
								<c:choose>
									<c:when test="${not empty vo.manager }">
										<c:forEach items="${vo.memberVOs }" var="memberVO">
											<c:if test="${memberVO.id eq vo.manager }">
												<input id="manager" type="text" class="form-control"
													value="${memberVO.name }" readonly="readonly">
												<input id="manager_id" type="hidden" class="form-control"
													value="${memberVO.id }" name="manager" readonly="readonly">
											</c:if>

										</c:forEach>
									</c:when>
									<c:otherwise>
										<input id="manager" type="text" class="form-control" value=""
											placeholder="없음" readonly="readonly">
										<input id="manager_id" type="hidden" class="form-control"
											value="" name="manager" readonly="readonly">


									</c:otherwise>
								</c:choose>

							</div>

							<button class="btn btn-primary" type="button"
								data-toggle="collapse" data-target="#collapseExample"
								aria-expanded="false">Search</button>

						</div>
						<div class="collapse" id="collapseExample">
							<div class="card card-body">

								<div class="table-responsive">

									<table class="table table-hover" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>직책</th>
												<th>사원번호</th>
												<th>이름</th>



											</tr>
										</thead>
										<tbody>
											<c:forEach items="${vo.memberVOs }" var="memberVO">
												<tr class="managerTable" style="cursor: pointer">
													<th>${memberVO.jobVO.name }</th>
													<th id="empId">${memberVO.employeeId }</th>
													<th id="memberName" data-id="${memberVO.id }"
														data-name="${memberVO.name }">${memberVO.name }</th>


												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<hr>
						<h4>상위부서</h4>
						<div class="row gx-3 mb-5">
							<div class="col-md-4">
								<label for="level">level</label> <select class="form-control"
									name="level" id="level">
									<c:forEach begin="0" end="${departmentVOs[0].nextLevel }"
										varStatus="i">
										<c:choose>
											<c:when test="${i.index eq vo.level }">
												<option selected="selected" value="${i.index}">${i.index}</option>

											</c:when>
											<c:otherwise>

												<option value="${i.index}">${i.index}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-8">
								<label for="upper">상위부서 이름</label> <select name="upper"
									class="form-control" id="upper">
									<option id="defaultSelect" disabled="disabled">===========부서선택===========</option>

									<c:forEach items="${departmentVOs}" var="departmentVO">
										<c:if test="${departmentVO.id ne vo.id }">
											<c:choose>
												<c:when test="${departmentVO.id eq vo.upper }">
													<option value="${departmentVO.id }"
														class="level level${departmentVO.level}" hidden="ture"
														selected="selected">${departmentVO.name}</option>

												</c:when>
												<c:otherwise>
													<option value="${departmentVO.id }"
														class="level level${departmentVO.level}" hidden="ture">${departmentVO.name}</option>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>

								</select>
							</div>
							<div></div>
						</div>


						<div class="modal-footer">
							<button class="btn btn-secondary" type="button"
								data-dismiss="modal">취소</button>

							
								<button id="submitBtn" class="btn btn-success" type="button">수정</button>
							
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="/js/demo/datatables-demo.js"></script>
 <script src="/vendor/datatables/jquery.dataTables.min.js"></script>
 <script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<c:import url="../temp/logoutModal.jsp"></c:import>
	<script type="text/javascript" src="/js/addDepartment.js"></script>
	<c:import url="../temp/common_js.jsp"></c:import>
</body>
</html>