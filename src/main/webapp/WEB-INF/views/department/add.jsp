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
							<form action="./add" method="post">
								<div class="card mb-4">
									<div class="card-header">Department Add</div>
									<div class="card-body">
										<div class="mb-3">
											<label for="name">부서명</label> <input class="form-control"
												type="text" name="name">
										</div>
										<div class="row gx-3 mb-5">
											<div class="col-md-2">
												<label for="level">부서레벨</label> <select class="form-control"
													name="level" id="level">
													<c:forEach begin="0" end="5" varStatus="i">
														<option value="${i.index}">${i.index}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-5">
												<label for="upper">상위부서 이름</label> <select name="upper"
													class="form-control" id="upper">
													<option id="defaultSelect" selected="selected"
														disabled="disabled">===========부서선택===========</option>

													<c:forEach items="${departmentVOs}" var="departmentVO">
														<option value="${departmentVO.id }"
															class="level level${departmentVO.level}"
															disabled="disabled" hidden="ture">${departmentVO.name}</option>

													</c:forEach>

												</select>
											</div>

											<div class="col-md-5">

												<button type="submit" class="btn btn-primary">부서추가</button>
											</div>
										</div>
											

									</div>
								</div>
							</form>
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
			</div>
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
	<script src="/js/addDepartment.js"></script>
</body>
</html>