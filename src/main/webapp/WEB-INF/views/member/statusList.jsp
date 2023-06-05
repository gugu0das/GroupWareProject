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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
					<h1 class="h3 mb-0 text-gray-800 mb-3">근태관리</h1>
					<div class="card shadow mb-4">
						<div class="card-header py-2">
							<h6 class="m-0 font-weight-bold">내정보</h6>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-lg-4">
									<div class="d-flex" style="height: 100px">
										<div class="flex-shrink-0 me-3">
											<img src="/images/후드입은_라이언.png" alt=""
												class="avatar-md rounded-circle img-thumbnail"
												style="width: 100px; height: 100px">
										</div>
										<div class="flex-grow-1 align-self-center">
											<div class="text-muted">
												<p class="mb-2" id="timeStemp">
													<a id="month"></a><a id="date"></a>
												</p>
												<h5 class="mb-1">${memberVO.name}&nbsp;${memberVO.jobVO.name}</h5>
												<p class="mb-0">${memberVO.departmentVO.name}</p>
											</div>
										</div>
									</div>
								</div>

								<div class="col-lg-4 align-self-center">
									<div class="text-lg-center mt-4 mt-lg-0">
										<div class="row">
											<div class="col-4">
												<div></div>
											</div>
											<div class="col-4">
												<div></div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-lg-4 d-none d-lg-block">
									<div class="clearfix mt-4 mt-lg-0"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="card shadow mb-4">
						<div class="col-xl-18">
							<div class="row">
								<div class="col-sm-6">
									<div class="card">
										<div class="card-body" style="height: 180px">
											<div class="d-flex align-items-center mb-3">
												<h5 class="font-weight-bold mb-0">이번달 근무시간</h5>
											</div>
											<h4 class="small font-weight-bold">
												Server Migration <span class="float-right">20%</span>
											</h4>
											<div class="progress mb-4">
												<div class="progress-bar bg-danger" role="progressbar"
													style="width: 20%" aria-valuenow="20" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>


										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="card">
										<div class="card-body" style="height: 180px">
											<div class="d-flex align-items-center mb-2">
												<h5 class="font-weight-bold mb-0">근태</h5>
											</div>
											<h4 class="small font-weight-bold">
												출근시간 :
												<c:if test="${not empty employeeVO.onTime }">
											${employeeVO.strOnTime }
											</c:if>

											</h4>
											<h4 class="small font-weight-bold">
												퇴근시간 :
												<c:if test="${not empty employeeVO.offTime }">
											${employeeVO.strOffTime }
											</c:if>
											</h4>
											<br>
											<div align="right" id="statusBtns"
												data-status="${employeeVO.status }">
												<c:forEach items="${btns }" var="btn">
													<button type="button" class="btn btn-light waves-effect">${btn }</button>

												</c:forEach>
												<form id="timeHistory" action="/member/statusUpdate"
													method="post">

													<input id="statusVal" type="hidden" name="timeStatus">
												</form>
												<br>
											</div>
										</div>
									</div>
								</div>



								<!-- end row -->
							</div>
						</div>
					</div>
					<div class="card shadow mb-4">
						<div class="card-header py-2">
							<h6 class="m-0 font-weight-bold">총 근무시간</h6>

						</div>
						<div class="card-body">
							<div class="accordion accordion-flush" id="EmployeeList">
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingOne">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
											aria-expanded="false" aria-controls="flush-collapseOne">
											Accordion Item #1</button>
									</h2>
									<div id="flush-collapseOne" class="accordion-collapse collapse"
										aria-labelledby="flush-headingOne"
										data-bs-parent="#EmployeeList">
										<div class="accordion-body">
											Placeholder content for this accordion, which is intended to
											demonstrate the
											<code>.accordion-flush</code>
											class. This is the first item's accordion body.
										</div>
									</div>
								</div>


							</div>
						</div>
					</div>
					<div class="row"></div>


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
	<script src="/js/employeeStatus.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
</body>
</html>