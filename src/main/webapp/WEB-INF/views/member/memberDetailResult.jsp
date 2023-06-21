<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<style>
.form-control {
	border: none;
}

</style>
<div class="row">
	<div class="col-xl-4">
		<!-- Profile picture card-->
		<div class="card mb-4 mb-xl-0">
		
			<div class="card-body text-center">
				<!-- Profile picture image-->
				<c:if test="${not empty memberVO.memberProfileVO.fileName }">
				<img class="img-account-profile rounded-circle mb-2" style="width: 312px; height: 312px"
					src="/profile/${memberVO.memberProfileVO.fileName }" >
				</c:if>
				<c:if test="${empty memberVO.memberProfileVO.fileName }">
				<img class="img-account-profile rounded-circle mb-2" style="width: 312px; height: 312px"
					src="/images/undraw_profile_1.svg" >
				</c:if>
				<!-- Profile picture upload button-->
				
			</div>
		</div>
	</div>
	<div class="col-xl-7">
		<!-- Account details card-->
		<div class="card mb-4">
			<div class="card-body">
				<form:form modelAttribute="memberVO" method="post" 
					id="updateForm">

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
							<form:input path="name" cssClass="form-control change" id="name"
								readonly="true" />
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
						<form:input path="email" cssClass="form-control change" id="email"
							readonly="true" />
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
							<label for="hireDate">입사일</label> <input class="form-control"
								name="hireDate" value="${memberVO.hireDate}" type="date"
								id="hireDate" style="border: none;" readonly="true" />

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
									id="departmentVO.name" cssStyle="border:none;" readonly="true" />
								<form:errors path="departmentVO.name"></form:errors>
							</c:if>
							<c:if test="${empty departmentVO.name }">
								<label for="department">부서</label>
								<input name="department" id="department" class="form-control"
									style="border: none;" placeholder="부서없음" readonly="readonly"
									disabled="disabled">

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
				</form:form>
			</div>
		</div>
	</div>
</div>