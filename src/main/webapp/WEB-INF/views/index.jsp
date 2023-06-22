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
<link href="/css/noticeTop5.css" rel="stylesheet">
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

		<c:choose>
			<c:when test="${id != 'admin'}">
				<c:import url="./temp/sidebar.jsp"></c:import>
			</c:when>
			<c:when test="${id == 'admin'}">
				<c:import url="./temp/adminSidebar.jsp"></c:import>
			</c:when>
		</c:choose>

		<!-- sideBar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!--top bar  -->
				<c:choose>
					<c:when test="${id == 'admin'}">
						<c:import url="./temp/adminTopbar.jsp"></c:import>
					</c:when>
					<c:otherwise>
						<c:import url="./temp/topbar.jsp"></c:import>
					</c:otherwise>

				</c:choose>

				<!--top bar  End -->


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Content Row -->
					<div class="row">
						<div class="col-xl-9 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-4  mb-3">
											<div class="d-flex" style="height: 100px">
												<div class="flex-shrink-0 me-3">
													<c:if
														test="${not empty memberVO.memberProfileVO.fileName }">
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
						</div>
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<form id="timeHistory" action="/member/statusUpdate"
										method="post">
										<div class="" id="timeStemp2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1"
												id="month">0000년 00월 00일</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800" id="date">00:00:00</div>

										</div>
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<i class="fas fa-calendar fa-2x text-gray-300"> <c:if
														test="${not empty employeeVO.onTime }">
														<a class="text-xs" id="">출근시간</a>
														<a class="text-xs" data-onTime="${employeeVO.onTime }"
															id="timeStatus">${employeeVO.strOnTime }</a>
													</c:if> <%-- <c:if test="${employeeVO.status ne 0 }"> 상태 : ${employeeVO.status }</c:if> --%>
												</i>


											</div>
											<div class="col-auto" id="statusBtns"
												data-status="${employeeVO.status }">
												<c:if test="${not empty employeeVO.offTime }">
													<i class="fas fa-2x"> <a class="text-xs" id="">퇴근시간</a>
														<a class="text-xs" data-onTime="${employeeVO.offTime }"
														id="timeStatus">${employeeVO.strOffTime }</a>
													</i>
												</c:if>
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
							<button type="button" id="testStatusUp">testMakeStatus</button>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<!-- <div class="col-xl-3 col-md-6 mb-4">
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
 -->
						<!-- Earnings (Monthly) Card Example -->
						<!-- <div class="col-xl-3 col-md-6 mb-4">
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
						</div> -->

						<!-- Pending Requests Card Example -->
						<!-- <div class="col-xl-3 col-md-6 mb-4">
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
						</div> -->
					</div>

					<!-- Content Row -->

					<div class="row">

						<!-- Area Chart -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">이번달 근무시간</h6>
									<span class="text-small" style="float: right; font-size: 5px"><a
										href="/member/statusList">바로가기</a></span>
								</div>
								<!-- Card Body -->
								<div class="card-body" style="height: 180px">

									<h6 class="text small">
										시작시간 : ${memberVO.workTimeVO.startTime}<span
											class="float-right">종료시간 :
											${memberVO.workTimeVO.finishTime}</span>
									</h6>

									<c:if test="${empty workTimeStatusVOs}">

										<h1 class="h1">근무정보가없습니다.</h1>
									</c:if>
									<c:forEach items="${workTimeStatusVOs }" var="vo">
										<c:if
											test="${vo.monthVO.year eq  employeeVO.monthVO.year && vo.monthVO.month eq employeeVO.monthVO.month}">
											<h4 class="small font-weight-bold">
												이번달 총 근무 <span class="float-right">${vo.persent}%</span>
											</h4>
											<div class="progress mb-4">
												<div class="progress-bar bg-success" role="progressbar"
													style="width: ${vo.persent}%" aria-valuenow="${vo.persent}"
													aria-valuemin="0" aria-valuemax="100">${vo.monthStatusWork }</div>
											</div>
											<span class="float-right">${vo.monthTotalWork }</span>
										</c:if>
									</c:forEach>
								</div>



							</div>
						</div>

						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
									<div class="dropdown no-arrow">
										<a href="./notice/list">바로가기</a>
										
										<!-- <div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div> -->
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body word" id="noticeList">
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
											class="chartjs-render-monitor"></canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"> <i
											class="fas fa-circle text-primary"></i> Direct
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
						<div class="col-lg-12 mb-4">

							<div class="card shadow mb-4">
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">연차 사용내역</h6>
									<span class="text-small" style="float: right; font-size: 5px"><a
										href="/member/leaveRecode">바로가기</a></span>
								</div>

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


	<c:import url="./temp/logoutModal.jsp"></c:import>
	<c:import url="./temp/common_js.jsp"></c:import>
	<script src="/js/employeeStatus.js"></script>
	<!-- Page level custom scripts -->

	<!--Notice 공지사항 메인으로 빼는 기능-->
	<script src="/js/noticeTop5.js"></script>
	<script src="/js/SSE.js"></script>


</body>
</html>
