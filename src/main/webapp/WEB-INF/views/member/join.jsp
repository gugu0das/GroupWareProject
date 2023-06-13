<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/header.jsp"></c:import>

<title>!</title>

<!-- Custom styles for this template-->
<c:import url="../temp/style.jsp"></c:import>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
</head>
<body class="bg-gradient-primary">
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class=""></div>
					<div class="col-lg-8 mx-auto">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">사원 생성 페이지</h1>
							</div>
							<%-- <form class="user" method="post" action=""> --%>
							<form:form cssClass="user" modelAttribute="memberVO"
								method="post" enctype="" action="./join">
								<div class="form-group">
									<form:label path="accountId">사원번호,계정아이디</form:label>
									<form:input cssClass="form-control form-control-user"
										id="accountId" path="accountId" placeholder="사원번호 입력"></form:input>
									<form:errors path="accountId"></form:errors>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<form:label path="password">비밀번호</form:label>
										<!-- <input type="password" class="form-control form-control-user"
											id="password" placeholder="비밀번호 입력"> -->
										<form:password path="password" id="password"
											cssClass="form-control form-control-user"
											placeholder="비밀번호를 입력해주세요" />
										<form:errors path="password"></form:errors>
									</div>
									<div class="col-sm-6">
										<form:label path="passwordCheck">비밀번호 확인</form:label>
										<form:password path="passwordCheck" id="passwordCheck"
											cssClass="form-control form-control-user"
											placeholder="비밀번호 확인" />
										<form:errors path="passwordCheck"></form:errors>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-4 mb-3 mb-sm-0">
										<form:label path="name">이름</form:label>
										<form:input path="name" id="name"
											cssClass="form-control form-control-user" placeholder="이름 입력" />
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
											placeholder="생년월일 입력" name="birthDate">
									</div>
								</div>

								<div class="form-group">
									<form:label path="address">주소</form:label>

									<form:input path="address" id="address"
										cssClass="form-control form-control-user"
										placeholder="주소를 작성해주세요" />
									<form:errors path="address"></form:errors>
									<!-- <input type="email" class="form-control form-control-user"
										id="" placeholder="Address"> -->
								</div>
								<div class="form-group">
									<form:label path="email">이메일</form:label>
									<form:input path="email" id="email"
										cssClass="form-control form-control-user"
										placeholder="E-mail을 작성해주세요" />
									<form:errors path="email"></form:errors>
									<!-- <input type="email" class="form-control form-control-user"
										id="exampleInputEmail" placeholder="Email Address"> -->
								</div>

								<div class="form-group row">
									<div class="col-sm-4 mb-3 mb-sm-0">
										<label for="HireDate">입사일</label> <input type="date"
											class="form-control form-control-user" id="hireDate"
											name="hireDate">
									</div>
									<div class="col-sm-4">
										<form:label path="departmentId">부서선택</form:label>
										<form:select path="departmentId" id="departmentId"
											cssClass="custom-select form-control">
											<c:forEach items="${departmentVOs }" var="depVO">
												<form:option value="${depVO.id }">${depVO.name }</form:option>
											</c:forEach>
										</form:select>
										<form:errors path="departmentId"></form:errors>
									</div>
									<div class="col-sm-4">
										<form:label path="jobId">직위/직책 선택</form:label>
										<form:select path="jobId"
											cssClass="custom-select form-control"
											placeholder="직위/직책을 선택해주세요" >
											<c:forEach items="${jobVOs }" var="jobVO">
												<form:option value="${jobVO.id }">${jobVO.name}</form:option>
											</c:forEach>

										</form:select>
										<form:errors path="jobId"></form:errors>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-10">
								<label for="workTime">근무시간 </label>
										 <input id="startTime"
											name="startTimeString"> ~ <input id="finishTime"
											name="finishTimeString">

									</div>
									<div class="col-2">
									<label for="mealTime">식사 </label>
										<input type="checkbox" checked="checked"
											name="mealTime"> 

									
									</div>
								</div>
								<button class="btn btn-primary btn-user btn-block">Join
									Member</button>
								<hr>
								
							</form:form>
							<%-- </form> --%>


						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="/js/memberJoin.js"></script>
	<c:import url="../temp/common_js.jsp"></c:import>
</body>
</html>