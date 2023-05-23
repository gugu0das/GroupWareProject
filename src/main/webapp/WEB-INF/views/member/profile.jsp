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

.change {
	border: none;
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
					<nav class="nav nav-borders">
						<a class="nav-link active ms-0" href="/member/profile">Profile</a>
						<a class="nav-link" href="/member/security">Security</a> <a
							class="nav-link" href="/department/add">AddDepartment</a>
					</nav>
					<hr class="mt-0 mb-4">
					<div class="row">
						<div class="col-xl-4">
							<!-- Profile picture card-->
							<div class="card mb-4 mb-xl-0">
								<div class="card-header">Profile Picture</div>
								<div class="card-body text-center">
									<!-- Profile picture image-->
									<img class="img-account-profile rounded-circle mb-2"
										src="/images/undraw_profile_2.svg" alt="">
									<!-- Profile picture help block-->
									<div class="small font-italic text-muted mb-4">JPG or PNG
										no larger than 5 MB</div>
									<!-- Profile picture upload button-->
									<button class="btn btn-primary" type="button">Upload
										new image</button>
								</div>
							</div>
						</div>
						<div class="col-xl-7">
							<!-- Account details card-->
							<div class="card mb-4">
								<div class="card-header">Account Details</div>
								<div class="card-body">
									<form:form modelAttribute="memberVO" method="post"
										action="./update" id="updateForm">
										<!-- Form Group (username)-->
										<%-- 	<div class="mb-3">
											
												<form:label path="accountId">계정 아이디</form:label>
											<form:input path="accountId" cssClass="form-control" id="accountId"/>
											<form:errors path="accountId"></form:errors>
								
										</div> --%>

										<!-- Form Row-->
										<input type="hidden" value="${memberVO.id }" name="id">
										<div class="row gx-3 mb-3">
											<!-- Form Group (ID)-->
											<div class="col-md-6">
												<form:label path="accountId">계정 아이디</form:label>
												<form:input path="accountId" cssClass="form-control change"
													id="accountId" readonly="true" />
												<form:errors path="accountId"></form:errors>
											</div>
											<!-- Form Group (employeeID)-->
											<div class="col-md-3">
												<form:label path="employeeId">사원번호</form:label>
												<form:input path="employeeId" cssClass="form-control "
													id="employeeId" cssStyle="border:none;" readonly="true" />
												<form:errors path="employeeId"></form:errors>
											</div>
											<!-- Form Group (name)-->
											<div class="col-md-3">
												<form:label path="name">이름</form:label>
												<form:input path="name" cssClass="form-control change"
													id="name" readonly="true" />
												<form:errors path="name"></form:errors>
											</div>
										</div>
										<!-- Form Row        -->
										<div class="mb-3">
											<form:label path="address">주소</form:label>
											<form:input path="address" cssClass="form-control change"
												id="address" readonly="true" />
											<form:errors path="address"></form:errors>

										</div>
										<!-- Form Group (email address)-->
										<div class="mb-3">
											<form:label path="email">E-mail</form:label>
											<form:input path="email" cssClass="form-control change"
												id="email" readonly="true" />
											<form:errors path="email"></form:errors>
										</div>
										<!-- Form Row-->
										<div class="row gx-3 mb-3">
											<!-- Form Group (phone number)-->
											<div class="col-md-4">
												<form:label path="phone">전화번호</form:label>
												<form:input path="phone" cssClass="form-control change"
													id="phone" readonly="true" />
												<form:errors path="phone"></form:errors>
											</div>
											<!-- Form Group (birthday)-->

											<div class="col-md-4">
												<label for="birthDate">생일</label> <input
													class="form-control change" name="birthDate"
													value="${memberVO.birthDate}" type="date" id="birthDate"
													readonly="true" />

											</div>
											<div class="col-md-4">
												<label for="hireDate">입사일</label> <input
													class="form-control" name="hireDate"
													value="${memberVO.hireDate}" type="date" id="hireDate"
													style="border: none;" readonly="true" />

											</div>
										</div>
										<div class="row gx-3 mb-3 ">
											<!-- Form Group (phone number)-->
											<div class="col-md-5">
												<form:label path="jobVO.name">직책</form:label>
												<form:input path="jobVO.name" cssClass="form-control"
													cssStyle="border:none;" readonly="true" id="jobVO.name" />
												<form:errors path="jobVO.name"></form:errors>
											</div>
										


											<div class="col-md-5">
												<form:label path="departmentVO.name">부서</form:label>
												<form:input path="departmentVO.name" cssClass="form-control"
													id="departmentVO.name" cssStyle="border:none;"
													readonly="true" />
												<form:errors path="departmentVO.name"></form:errors>
											</div>

											<div class="col-md-2">
												<c:if test="${memberVO.status}">
													<div class="card bg-success text-white shadow">
														<div class="card-body">ON</div>
													</div>
												</c:if>
												<c:if test="${!memberVO.status}">
													<div class="card bg-dark text-white shadow">
														<div class="card-body">OFF</div>
													</div>
												</c:if>
											</div>
										</div>
										<!-- Save changes button-->
										<button class="btn btn-primary" type="button" id="updatebtn">수정하기
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
