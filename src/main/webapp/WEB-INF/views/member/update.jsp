<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- 인사팀  -->
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/header.jsp"></c:import>

<style type="text/css">
.updateBlock {
	display: none;
}

.updateBlock.show {
	display: block;
	height: 900px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/style.jsp"></c:import>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
</head>
<body class="bg-gradient-primary">
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0" style="height: 1000px" id="cardBody">
				<div class="updateBlock show" id="mainInfo">
					<div style="height: 900px">
						<div class="text-center mt-4">
							<h1 class="h1 text-gray-900 mb-4">사원 수정 페이지</h1>
						</div>
						<div class="row">
							<div class="card mb-4 col-10 mx-auto ">
								<div class="card-header">
									<h3 class="h3 font-weight-bold">${memberVO.name }
										${memberVO.jobVO.name }</h3>
								</div>

								<div class="card-body">
									<ul>
										<li>사원번호 : ${memberVO.employeeId}</li>
										<li>아이디 : ${memberVO.accountId }</li>
										<c:if test="${not empty memberVo.departmentVO.name }">
											<li>부서명 : ${memberVO.departmentVO.name }</li>
										</c:if>
										<c:if test="${empty memberVo.departmentVO.name }">
											<li>부서없음</li>
										</c:if>

									</ul>
								</div>
							</div>
						</div>
						<div id="contents">
							<div class="form-group row">
								<div class="col-6">
									<div class="box" id="member" data-c=1>
										<div class="line">
											<h4 class="h4 text-Secondary">정보 수정</h4>
											<span class="text-Secondary">회원정보, 부서, 아이디, 근무시간</span>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="box" id="security" data-c=2>
										<div class="line">
											<h4 class="h4 text-Secondary">보안 관리</h4>
											<span class="text-Secondary">비밀번호 초기화</span>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-6">
									<div class="box" id="employeeStatus" data-c=3>
										<div class="line">
											<h4 class="h4 text-Secondary">근태 수정</h4>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="box" id="annual" data-c=4>
										<div class="line">
											<h4 class="h4 text-Secondary">연차 관리</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 1.회원 정보 -->
				<div class="updateBlock" id="memberInfo">
					<div class="row">
						
						<div class="col-lg-8 mx-auto">
							<div class="p-5">
								<div class="text-center mt-4">
									<h1 class="h1 text-gray-900 mb-4">사원 정보 수정</h1>
								</div>
								<%-- <form class="user" method="post" action=""> --%>
								<form:form cssClass="user" modelAttribute="memberVO"
									method="post" enctype="" action="/manager/memberUpdate">
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<form:label path="employeeId">사원번호</form:label>
											<form:input cssClass="form-control form-control-user"
												id="employeeId" path="employeeId"></form:input>
											<form:errors path="employeeId"></form:errors>
										</div>
										<div class="col-sm-6 mb-3 mb-sm-0">
											<form:label path="accountId">계정아이디</form:label>
											<form:input cssClass="form-control form-control-user"
												id="accountId" path="accountId"></form:input>
											<form:errors path="accountId"></form:errors>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<form:label path="name">이름</form:label>
											<form:input path="name" id="name"
												cssClass="form-control form-control-user"
												placeholder="이름 입력" />
											<form:errors path="name"></form:errors>

										</div>
										<div class="col-sm-4">
											<form:label path="phone">전화번호</form:label>
											<form:input path="phone" id="phone"
												cssClass="form-control form-control-user"
												placeholder="전화번호 입력" />
											<form:errors path="phone"></form:errors>

										</div>
										<div class="col-sm-4">
											<label for="birth">생년월일</label> <input type="date"
												class="form-control form-control-user" id="exampleLastName"
												placeholder="생년월일 입력" name="birthDate"
												value="${memberVO.birthDate }">
										</div>
									</div>

									<div class="form-group">
										<form:label path="address">주소</form:label>
										<form:input path="address" id="address"
											cssClass="form-control form-control-user"
											placeholder="주소를 작성해주세요" />
										<form:errors path="address"></form:errors>
									</div>
									<div class="form-group">
										<form:label path="email">이메일</form:label>
										<form:input path="email" id="email"
											cssClass="form-control form-control-user"
											placeholder="E-mail을 작성해주세요" />
										<form:errors path="email"></form:errors>
									</div>

									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<label for="HireDate">입사일</label> <input type="date"
												class="form-control form-control-user" id="hireDate"
												value="${memberVO.hireDate }" name="hireDate">
										</div>
										<div class="col-sm-4">
											<label for="depName">부서 선택</label> <input
												id="departmentInputId" name="departmentId" type="hidden"
												value="${memberVO.departmentId }"> <input
												class="custom-select form-control" id="depName"
												value="${memberVO.departmentVO.name }"
												style="cursor: pointer" data-toggle="collapse"
												data-target="#departmentList" aria-expanded="false"
												readonly="readonly">
										</div>
										<div class="col-sm-4">
											<label for="jobId">직위/직책 선택</label> <input type="hidden"
												value="${memberVO.jobId }" name="jobId" id="jobInputId">
											<input class="custom-select form-control" id="jobName"
												value="${memberVO.jobVO.name }" style="cursor: pointer"
												data-toggle="collapse" data-target="#jobList"
												aria-expanded="false" readonly="readonly">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-5">
											<label for="birth">퇴사일</label> <input type="date"
												class="form-control form-control-user" id="exampleLastName"
												placeholder="퇴사일 입력" name="endDate"
												value="${memberVO.endDate }">
										</div>
										<div class="col-sm-7">
											<label for=""> </label>
											<div class="form-check">
												<c:if test="${memberVO.status eq false}">
													<input class="form-check-input" type="checkbox"
														value="${memberVO.status }" name="memberStatus">
													<label class="form-check-label" for="mealTime">계정상태
													</label>
												</c:if>
												<c:if test="${memberVO.status eq true}">
													<input class="form-check-input" type="checkbox" checked="checked"
														value="${memberVO.status }" name="memberStatus">
													<label class="form-check-label" for="mealTime">계정상태
													</label>
												</c:if>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-10">
											<label for="workTime">근무시간 </label> <input
												style="cursor: pointer" class="" id="startTime"
												readonly="readonly" name="startTimeString"
												value="${memberVO.workTimeVO.startTime }"> ~ <input
												style="cursor: pointer" class="" id="finishTime"
												name="finishTimeString" readonly="readonly"
												value="${memberVO.workTimeVO.finishTime }">

										</div>
										<div class="col-2">
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													checked="checked" name="mealTime"> <label
													class="form-check-label" for="mealTime">식사 </label>
											</div>
										</div>
									</div>
									<hr>
									<div class="collapse" id="departmentList">
										<div class="card card-body">

											<div class="table-responsive"
												style="height: 250px; overflow: scroll;">

												<table class="table table-hover" id="dataTable">
													<thead>
														<tr>

															<th>번호</th>
															<th>부서 이름</th>

														</tr>
													</thead>
													<tbody>
														<c:forEach items="${departmentVOs }" var="departmentVO"
															varStatus="i">
															<tr style="cursor: pointer" data-toggle="collapse"
																data-target="#departmentList" aria-expanded="false"
																class="depTables">

																<th id="depId" data-depId="${departmentVO.id }"
																	data-name="${departmentVO.name }">${i.index }</th>
																<th>${departmentVO.name }</th>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="collapse" id="jobList">
										<div class="card card-body">

											<div class="table-responsive"
												style="height: 250px; overflow: scroll;">

												<table class="table table-hover" id="dataTable">
													<thead>
														<tr>

															<th>번호</th>
															<th>직책 이름</th>

														</tr>
													</thead>
													<tbody>
														<c:forEach items="${jobVOs }" var="jobVO" varStatus="i">
															<tr style="cursor: pointer" data-toggle="collapse"
																data-target="#jobList" aria-expanded="false"
																class="jobTables">

																<th id="jobId" data-jobId="${jobVO.id }"
																	data-name="${jobVO.name }">${i.index }</th>
																<th>${jobVO.name }</th>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div><input type="hidden" value="${memberVO.id }" name="id">
									<button type="submit" class="btn btn-primary">수정하기</button>
								</form:form>
							</div>
						</div>
					</div>

				</div>
				<!-- 2번 -->

				<div class="updateBlock" id="securityInfo">
					<div style="height: 900px">
						<div class="text-center mt-4">
							<h1 class="h1 text-gray-900 mb-4">보안 관리</h1>
						</div>
						<div class="row">
							<div class="card mb-4 col-10 mx-auto ">
								<div class="card-header">
									<h3 class="h3 font-weight-bold">${memberVO.name }
										${memberVO.jobVO.name }</h3>
								</div>

								<div class="card-body">
									<ul>
										<li>사원번호 : ${memberVO.employeeId}</li>
										<li>아이디 : ${memberVO.accountId }</li>
										<c:if test="${not empty memberVo.departmentVO.name }">
											<li>부서명 : ${memberVO.departmentVO.name }</li>
										</c:if>
										<c:if test="${empty memberVo.departmentVO.name }">
											<li>부서없음</li>
										</c:if>

									</ul>
								</div>
							</div>
						</div>
						<div id="contents">
								<form action="/manager/initSecurity" method="post" id="pwForm" >
									<div class="securityBox" id="initSecurity"
										data-name="${memberVO.name }">
											<div class="line">
												<h4 class="h4 text-Secondary">비밀번호 초기화</h4>
												<input type="hidden" value="${memberVO.id }" name="id"
													id="memberId"> 
													<input type="hidden" value="${memberVO.name }" name="name">
													<input type="hidden" value=""
													id="initPw" name="password">
											</div>
									</div>
								</form>
						</div>
					</div>
				</div>

				<!-- 3q번 -->
				<div class="updateBlock" id="employeeStatusInfo">
					<div class="card mb-4 mb-xl-0 col-12">
						<div class="card-body">
							<div class="text-center mt-4">
								<h1 class="h1 text-gray-900 mb-4">사원 근태 수정</h1>
							</div>
							<div class="table-responsive" style="overflow-x: hidden">
								<table class="table table-hover" id="employeeTable">
									<thead>
										<tr>
											<th>일자</th>
											<th>출근시간</th>
											<th>퇴근시간</th>
											<th>상태</th>



										</tr>
									</thead>
									<tbody>
										<c:forEach items="${employeeStatusVOs }"
											var="employeeStatusVO">
											<tr class="employeeStatusData" style="cursor: pointer;"
												data-toggle="modal" data-target="#employeeStatusDetail"
												data-empId=${employeeStatusVO.id }>
												<td class="td">${employeeStatusVO.reg }</td>
												<td class="td">${employeeStatusVO.strOnTime }</td>
												<td class="td">${employeeStatusVO.strOffTime }</td>
												<td class="td">${employeeStatusVO.status }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 근태 수정모달 -->
					<div class="modal fade" id="employeeStatusDetail" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-l" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="title"></h5>
									<button class="close" type="button" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<form action="/manager/employeeStatusUpdate" method="post">
									<div class="modal-body">
										<input type="hidden" id="employeeStatusId" name=id> <input
											type="hidden" name="memberId" id="employeeMemeberId" value="">
										<label>일자</label> <input type="date" class="form-control"
											id="0" name="reg"> <label>출근시간</label> <input
											type="text" class="form-control" id="1" name="strOnTime">
										<label>퇴근시간</label> <input type="text" class="form-control"
											id="2" name="strOffTime"> <label>상태</label> <input
											type="text" class="form-control" id="3" name="empStatus">

									</div>

									<div class="modal-footer">
										<button class="btn btn-secondary" type="button"
											data-dismiss="modal">닫기</button>



										<button class="btn btn-primary">수정하기</button>

									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 4번 -->
				<div class="updateBlock" id="annualInfo">
					<div class="card mb-4 mb-xl-0 col-12">
						<div class="card-body">
							<div class="text-center mt-4">
								<h1 class="h1 text-gray-900 mb-4">연차 수정</h1>
							</div>
							<div class="table-responsive" style="overflow-x: hidden">
								<h6 class="h6 text-small">연차내역</h6>
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
												style="cursor: pointer;" data-leaveId="${leaveRecodeVO.id }">
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
					<!-- 연차 수정모달 -->
					<div class="modal fade" id="leaveDetail" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-l" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="title">연차 수정</h5>
									<button class="close" type="button" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<form action="/manager/leaveUpdate" method="post">
									<div class="modal-body">
										
										<input type="hidden" id="leaveId" name="id"> 
										<label for="0">일자</label>
										<input type="date" class="form-control" id="0" name="useDate">
										
										<label for="1">일수</label> 
										<input type="text" readonly="readonly" class="form-control" id="1"> 
										<label for="2">연차구분</label>
										<input type="text" class="form-control" id="2" readonly="readonly">
										
									</div>

									<div class="modal-footer">
										<button class="btn btn-secondary" type="button"
											data-dismiss="modal">닫기</button>


										<input type="hidden" value="${memberVO.id }" name="memberId">
										<button class="btn btn-primary">수정하기</button>

									</div>
								</form>
							</div>
						</div>
					</div>

				</div>

				<div class="btns ">
					<button class="btn btn-dark float-right mr-4" type="button"
						id="back">돌아가기</button>

					<div class="block" data-memberId=${memberVO.id } id="memberList">
						<a class="btn btn-Secondary  float-right"
							href="/member/memberList?id=${memberVO.id }">목록으로</a>
					</div>

				</div>
			</div>

		</div>
	</div>



	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script type="text/javascript" src="/js/memberUpdate.js">
		
	</script>
	<c:import url="../temp/common_js.jsp"></c:import>
</body>
</html>