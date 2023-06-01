<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>

<html>

<body class="d-flex flex-column h-100">
<head>
<c:import url="./temp/header.jsp"></c:import>

<title>SB Admin 2 - Dashboard</title>
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">/* Chart.js */
@
keyframes chartjs-render-animation {
	from {opacity: .99
}

to {
	opacity: 1
}

}
.chartjs-render-monitor {
	animation: chartjs-render-animation 1ms
}

.chartjs-size-monitor, .chartjs-size-monitor-expand,
	.chartjs-size-monitor-shrink {
	position: absolute;
	direction: ltr;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	overflow: hidden;
	pointer-events: none;
	visibility: hidden;
	z-index: -1
}

.chartjs-size-monitor-expand>div {
	position: absolute;
	width: 1000000px;
	height: 1000000px;
	left: 0;
	top: 0
}

.chartjs-size-monitor-shrink>div {
	position: absolute;
	width: 200%;
	height: 200%;
	left: 0;
	top: 0
}
</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- sideBar -->
		<c:import url="./temp/sidebar.jsp"></c:import>
		<!-- sideBar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!--top bar  -->
				<c:import url="./temp/topbar.jsp"></c:import>
				<!--top bar  End -->


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Content Row -->
					<div class="row">

						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<form id="timeHistory" action="/member/statusUpdate"
										method="post">
										<div class="" id="timeStemp">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1"
												id="month">0000년 00월 00일</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800" id="date">00:00:00</div>

										</div>
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<i class="fas fa-calendar fa-2x text-gray-300"> 
												<c:if test="${not empty employeeVO.onTime }">
														<a class="text-xs" id="">출근시간</a>
														<a class="text-xs"   data-onTime="${employeeVO.onTime }" id="timeStatus">${employeeVO.strOnTime }</a>
													</c:if> <%-- <c:if test="${employeeVO.status ne 0 }"> 상태 : ${employeeVO.status }</c:if> --%>
												</i>


											</div>
											<div class="col-auto" id="statusBtns"
												data-status="${employeeVO.status }">
												<c:forEach items="${btns }" var="btn">
												
													<button class="btn btn-primary" type="button">${btn }</button>
												</c:forEach>
													<input id="statusVal" type="hidden" name="timeStatus">
												
												
												<%-- <c:choose>
													<c:when test="${employeeVO.status eq '출근'}">


														<button type="button" class="btn btn-primary">조퇴</button>
														<button type="button" class="btn btn-primary">외근</button>
													</c:when>
													<c:when test="${employeeVO.status eq '퇴근' }">
														<button type="button" class="btn btn-primary">초과근무</button>
													</c:when>
													
													<c:otherwise>
														<c:if test="${empty employeeVO.onTime }">
														<button type="button" class="btn btn-primary">출근</button>
														</c:if>
													</c:otherwise>
												</c:choose> --%>

											</div>
												

										</div>
									</form>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<button type="button" id="testStatusUp">testMakeStatus</button>
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												Earnings (Annual)</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 50%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Pending Requests</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->

					<div class="row">

						<!-- Area Chart -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										공지사항 홈페이지
										<h6>
											<div class="dropdown no-arrow">
												<a class="dropdown-toggle" href="#" role="button"
													id="dropdownMenuLink" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false"> <i
													class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
												</a>
												<div
													class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
													aria-labelledby="dropdownMenuLink">
													<div class="dropdown-header">Dropdown Header:</div>
													<a class="dropdown-item" href="#">Action</a> <a
														class="dropdown-item" href="#">Another action</a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#">Something else here</a>
												</div>
											</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
										<canvas id="myAreaChart"
											style="display: block; width: 407px; height: 320px;"
											width="407" height="320" class="chartjs-render-monitor"></canvas>
									</div>
								</div>
							</div>
						</div>

						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">공지사항TEST</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400">안녕</i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body" id="noticeList">
									<div class="chart-pie pt-4 pb-2">

										<div class="chartjs-size-monitor">


											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
										<canvas id="myPieChart" width="272" height="245"
											style="display: block; width: 272px; height: 245px;"
											class="chartjs-render-monitor">여기인가?</canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"> <i
											class="fas fa-circle text-primary">누구냐</i> Direct
										</span> <span class="mr-2"> <i
											class="fas fa-circle text-success"></i> Social
										</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
											Referral
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Content Column -->
						<div class="col-lg-6 mb-4">

							<!-- Project Card Example -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
								</div>
								<div class="card-body">
									<h4 class="small font-weight-bold">
										Server Migration <span class="float-right">20%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-danger" role="progressbar"
											style="width: 20%" aria-valuenow="20" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										Sales Tracking <span class="float-right">40%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: 40%" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										Customer Database <span class="float-right">60%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar" role="progressbar"
											style="width: 60%" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										Payout Details <span class="float-right">80%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-info" role="progressbar"
											style="width: 80%" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										Account Setup <span class="float-right">Complete!</span>
									</h4>
									<div class="progress">
										<div class="progress-bar bg-success" role="progressbar"
											style="width: 100%" aria-valuenow="100" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>

							<!-- Color System -->
							<div class="row">
								<div class="col-lg-6 mb-4">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											Primary
											<div class="text-white-50 small">#4e73df</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-success text-white shadow">
										<div class="card-body">
											Success
											<div class="text-white-50 small">#1cc88a</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-info text-white shadow">
										<div class="card-body">
											Info
											<div class="text-white-50 small">#36b9cc</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-warning text-white shadow">
										<div class="card-body">
											Warning
											<div class="text-white-50 small">#f6c23e</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-danger text-white shadow">
										<div class="card-body">
											Danger
											<div class="text-white-50 small">#e74a3b</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-secondary text-white shadow">
										<div class="card-body">
											Secondary
											<div class="text-white-50 small">#858796</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-light text-black shadow">
										<div class="card-body">
											Light
											<div class="text-black-50 small">#f8f9fc</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-dark text-white shadow">
										<div class="card-body">
											Dark
											<div class="text-white-50 small">#5a5c69</div>
										</div>
									</div>
								</div>
							</div>

						</div>

						<div class="col-lg-6 mb-4">

							<!-- Illustrations -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
								</div>
								<div class="card-body">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 25rem;" src="img/undraw_posting_photo.svg"
											alt="...">
									</div>
									<p>
										Add some quality, svg illustrations to your project courtesy
										of <a target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
										a constantly updated collection of beautiful svg images that
										you can use completely free and without attribution!
									</p>
									<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse
										Illustrations on unDraw →</a>
								</div>
							</div>

							<!-- Approach -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Development
										Approach</h6>
								</div>
								<div class="card-body">
									<p>SB Admin 2 makes extensive use of Bootstrap 4 utility
										classes in order to reduce CSS bloat and poor page
										performance. Custom CSS classes are used to create custom
										components and custom utility classes.</p>
									<p class="mb-0">Before working with this theme, you should
										become familiar with the Bootstrap framework, especially the
										utility classes.</p>
								</div>
							</div>

						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

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

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"
		style="display: none;"> <i class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>

					<form action="/member/logout" method="post">
						<button class="btn btn-primary">Logout</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<c:import url="./temp/common_js.jsp"></c:import>

	<script src="/js/employeeStatus.js"></script>
	<script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="/js/demo/datatables-demo.js"></script>
	<!--Notice 공지사항 메인으로 빼는 기능-->
	<script src="/js/noticeTop5.js"></script>


</body>
</html>
