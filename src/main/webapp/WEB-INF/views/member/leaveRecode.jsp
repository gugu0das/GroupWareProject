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

					<div class="card shadow mb-4">
						<div class="card-header py-2">
							<h6 class="m-0 font-weight-bold"></h6>
						</div>
						<div class="card-body">
							<h1 class="h1 text-gray-900 mb-4 text-center">연차</h1>
							<div class="row ">
								<div class="col-lg-4  mb-3">
									<div class="d-flex" style="height: 100px">
										<div class="flex-shrink-0 me-3">
											<c:if test="${not empty memberVO.memberProfileVO.fileName }">
												<img class="img-account-profile rounded-circle mb-2"
													style="width: 100px; height: 100px"
													src="/profile/${memberVO.memberProfileVO.fileName }">
											</c:if>
											<c:if test="${empty memberVO.memberProfileVO.fileName }">
												<img class="img-account-profile rounded-circle mb-2"
													style="width: 100px; height: 100px"
													src="/images/undraw_profile_1.svg">
											</c:if>



										</div>
										<div class="flex-grow-1 align-self-center">
											<div class="text-muted">
												<p class="mb-2" id="timeStemp">
													<a id="month"></a><a id="date"></a>
												</p>
												<h5 class="mb-1">${memberVO.name}&nbsp;${memberVO.jobVO.name}</h5>
												<p class="mb-0">${memberVO.departmentVO.name}</p>
												<p class="mb-0">남은 연차 수 : ${memberVO.annualVO.count}일</p>
											</div>
										</div>
									</div>
								</div>

								<div class="card mb-4 mb-xl-0 col-12">
									<div class="card-body">
										<div class="text-center mt-4"></div>
										<div class="table-responsive" style="overflow-x: hidden">

											<table class="table table-hover" id="employeeTable">
												<thead>
													<tr>
														<th>일자</th>
														<th>일수</th>
														<th>연차구분</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach items="${memberVO.leaveRecordVOs }"
														var="leaveRecodeVO">
														<tr class="leaveData" style="cursor: pointer;"
															data-toggle="modal" data-target="#leaveDetail"
															style="cursor: pointer;"
															data-leaveId="${leaveRecodeVO.id }">
															<td class="td">${leaveRecodeVO.useDate }</td>
															<td class="td">${leaveRecodeVO.count }</td>
															<td class="td">${leaveRecodeVO.annualType }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="modal fade" id="leaveDetail" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-l" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="title">연차 상세</h5>
												<button class="close" type="button" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<form action="/manager/leaveUpdate" method="post">
												<div class="modal-body">

													<input type="hidden" id="leaveId" name="id"> <label
														for="0">일자</label> <input type="date" class="form-control"
														id="0" name="useDate" readonly="readonly"> <label for="1">일수</label> <input
														type="text" readonly="readonly" class="form-control"
														id="1"> <label for="2">연차구분</label> <input
														type="text" class="form-control mb-3" id="2"
														readonly="readonly">
	
													<p style="color: gray ;">수정을 원하면 인사과에 문의하세요<p>
												</div>

												<div class="modal-footer">
													<button class="btn btn-secondary" type="button"
														data-dismiss="modal">닫기</button>


													

												</div>
											</form>
										</div>
									</div>
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
		<!-- End of Page Wrapper -->
	</div>

	<script type="text/javascript" src="/js/annualList.js"></script>
	<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
</body>
</html>