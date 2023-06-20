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
		<c:choose>
			<c:when test="${memberVO.accountId == 'admin'}">
				<c:import url="../temp/adminSidebar.jsp"></c:import>
			</c:when>
			<c:otherwise>
				<c:import url="../temp/sidebar.jsp"></c:import>
			</c:otherwise>
		</c:choose>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:choose>
					<c:when test="${memberVO.accountId == 'admin'}">
						<c:import url="../temp/adminTopbar.jsp"></c:import>
					</c:when>
					<c:otherwise>
						<c:import url="../temp/topbar.jsp"></c:import>
					</c:otherwise>

				</c:choose>

				<!-- contents 작성 -->
				<div class="container-fluid">
					<h1>사원 목록</h1>
					<div class="row">
						<div class="card mb-4 mb-xl-0 col-12">
							<div class="card-body">
								<div class="table-responsive" style="overflow-x: hidden">
									<table class="table table-hover" id="dataTable">
										<thead>
											<tr>
												<th>사원번호</th>
												<th>이름</th>
												<th>입사일</th>
												<th>직책</th>
												<th>부서명</th>


											</tr>
										</thead>
										<tbody>
											<c:forEach items="${memberVOs }" var="memberVO">
												<tr class="memberId" data-Id="${memberVO.id }"
													style="cursor: pointer;" data-toggle="modal"
													data-target="#memberDetail">
													<td>${memberVO.employeeId }</td>
													<td>${memberVO.name }</td>
													<td>${memberVO.hireDate }</td>
													<td>${memberVO.jobVO.name }</td>
													<c:if test="${not empty memberVO.departmentVO.name }">
														<td>${memberVO.departmentVO.name }</td>
													</c:if>
													<c:if test="${empty memberVO.departmentVO.name}">
														<td>부서없음</td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<!-- 멤버 디테일 모달 Modal-->
					<div class="modal fade" id="memberDetail" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-xl" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">사원정보</h5>
									<button class="close" type="button" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body"></div>
								<div class="modal-footer">
									<button class="btn btn-secondary" type="button"
										data-dismiss="modal">닫기</button>
									<c:if test="${memberVO.accountId == 'admin'}">
										<form action="/member/update" method="get">
											<input type="hidden" id="memberId" name="id">
											<button class="btn btn-primary">수정하기</button>
										</form>
									</c:if>
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
	<!-- 모달 -->
	<!-- Button trigger modal -->

	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script>
		$("#dataTable").DataTable({
			// 표시 건수기능 숨기기
			lengthChange : true,
			// 검색 기능 숨기기
			searching : false,
			// 정렬 기능 숨기기
			ordering : true,
			// 정보 표시 숨기기
			info : false,
			// 페이징 기능 숨기기
			paging : true,
			//스크롤바
			scrollX : false
		})
	</script>

	<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
	<script src="/js/memberList.js"></script>
</body>
</html>