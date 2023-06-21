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

.change {
	border: none;
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
				<h5 class="mt-0 mb-4">마이페이지</h5>
					<hr class="mt-0 mb-4">
					<div class="row">
						<div class="col-xl-4">
							<!-- Profile picture card-->
							<div class="card mb-4 mb-xl-0">
								<div class="card-header">프로필</div>
								<div class="card-body text-center">
									<!-- Profile picture image-->
									<div>
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
									
									
									<button class="btn btn-outline-primary" type="button" id="fileUpload" data-toggle="modal" data-target="#profileDetail">프로필 변경
										</button>
									
								</div>
							</div>
						</div>
						<div class="col-xl-7 essbox">
							<!-- Account details card-->
							<div class="card mb-4">
								<div class="card-header">계정 정보</div>
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
											<div class="col-md-4">
												<form:label path="accountId">계정 아이디</form:label>
												<form:input path="accountId" cssClass="form-control change essential"
													id="accountId" readonly="true" />
												<form:errors path="accountId"></form:errors>
											</div>
											<div class="col-md-2">
											<label for="idChecking">ID검사</label>
											<div>
											<button class="btn btn-outline-primary" type="button" id="idCheck">Check</button>
											</div>
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
												<form:input path="name" cssClass="form-control change essential"
													id="name" readonly="true" />
												<form:errors path="name"></form:errors>
											</div>
										</div>
										<!-- Form Row        -->
										<div class="mb-3">
											<form:label path="address">주소</form:label>
											<form:input path="address" cssClass="form-control change essential"
												id="address" readonly="true" />
											<form:errors path="address"></form:errors>

										</div>
										<!-- Form Group (email address)-->
										<div class="mb-3">
											<form:label path="email">E-mail</form:label>
											<form:input path="email" cssClass="form-control change essential"
												id="email" readonly="true" />
											<form:errors path="email"></form:errors>
										</div>
										<!-- Form Row-->
										<div class="row gx-3 mb-3">
											<!-- Form Group (phone number)-->
											<div class="col-md-4">
												<form:label path="phone">전화번호</form:label>
												<form:input path="phone" cssClass="form-control change essential"
													id="phone" readonly="true" />
												<form:errors path="phone"></form:errors>
											</div>
											<!-- Form Group (birthday)-->

											<div class="col-md-4">
												<label for="birthDate">생일</label> <input
													class="form-control change essential" name="birthDate"
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
												<c:if test="${not empty departmentVO.name }">
												<form:label path="departmentVO.name">부서</form:label>
												<form:input path="departmentVO.name" cssClass="form-control"
													id="departmentVO.name" cssStyle="border:none;"
													readonly="true" />
												<form:errors path="departmentVO.name"></form:errors>
													</c:if>
												<c:if test="${empty departmentVO.name }">
												<label for="department">부서</label>
												<input name="department" id="department" class="form-control" style="border:none;" placeholder="부서없음" readonly="readonly" disabled="disabled">
												
												</c:if>
														
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
				<div class="modal fade" id="profileDetail" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-l" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="title">프로필 수정</h5>
								<button class="close" type="button" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<form action="/member/memberProfileAdd" method="post"
								enctype="multipart/form-data">
								<div class="modal-body">

									<div class="card mb-4 mb-xl-0">
										
										<div class="card-body text-center">
											<!-- Profile picture image-->

											<img class="img-account-profile rounded-circle mb-2"
												style="width: 453px; height: 453px"
												src="/profile/${memberVO.memberProfileVO.fileName }" alt="">
											<!-- Profile picture help block-->
											<div class="small font-italic text-muted mb-4"></div>
											<!-- Profile picture upload button-->

											<input class="form-control" type="file" name="file">
											

										</div>
									</div>
								</div>

								<div class="modal-footer">
									<button class="btn btn-secondary" type="button"
										data-dismiss="modal">닫기</button>

									<button class="btn btn-success" type="submit" id="fileUpload">변경하기</button>

								</div>
							</form>
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
	<script src="/js/essential.js"></script>

</body>
</html>
