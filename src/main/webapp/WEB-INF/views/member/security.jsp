<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>

<body class="d-flex flex-column h-100">
<head>

<c:import url="../temp/header.jsp"></c:import>

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
.change{
border :none;
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
		<c:import url="../temp/sidebar.jsp"></c:import>
		<!-- sideBar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!--top bar  -->
				<c:import url="../temp/topbar.jsp"></c:import>
				<!--top bar  End -->


				<!-- Begin Page Content -->
				<div class="container-fluid px-4 mt-4">
					<!-- Account page navigation-->
					<h5 class="mt-0 mb-4" >보안관리</h5>
					<hr class="mt-0 mb-4" >
					<div class="row">
						<div class="col-xl-4">
							<!-- Profile picture card-->
							<div class="card mb-4 mb-xl-0">
								<div class="card-header">프로필</div>
								<div class="card-body text-center">
									<!-- Profile picture image-->
									<c:if test="${not empty memberVO.memberProfileVO.fileName }">
										<img class="img-account-profile rounded-circle mb-2"
											style="width: 453px; height: 453px"
											src="/profile/${memberVO.memberProfileVO.fileName }">
									</c:if>
									<c:if test="${empty memberVO.memberProfileVO.fileName }">
										<img class="img-account-profile rounded-circle mb-2"
											style="width: 453px; height: 453px"
											src="/images/undraw_profile_1.svg">
									</c:if>
									
								</div>
							</div>
						</div>
						<div class="col-xl-7">
							<!-- Account details card-->
							<div class="card mb-4">
								<div class="card-header">비밀번호 변경</div>
								<div class="card-body">
									<form:form modelAttribute="memberVO" method="post" id="frm"
										action="./security" >

										
										<!-- Form Row        -->
										<div class="mb-3">
											<form:label path="password">변경 비밀번호</form:label>
											<form:password path="password" cssClass="form-control"
												id="password" />
											<form:errors path="password"></form:errors>
											
										</div>
										<div class="mb-3">
											<form:label path="passwordCheck">변경 비밀번호확인</form:label>
											<form:password path="passwordCheck" cssClass="form-control"
												id="passwordCheck"/>
											<form:errors path="passwordCheck"></form:errors>
											
										</div>
										<!-- Save changes button-->
										<button class="btn btn-primary" type="button" id="pwChange">비밀번호 변경
											</button>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<!-- footer없음 -->
				<!-- End of Footer -->
			</div>
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->


	<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
<script src="/js/profile.js"></script>


</body>
</html>
