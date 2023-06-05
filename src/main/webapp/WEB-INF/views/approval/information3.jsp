<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/header.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>


<c:import url="../temp/style.jsp"></c:import>
</head>
<body>
	<div id="wrapper">
		<!-- sideBar -->
		<c:import url="../temp/sidebar.jsp"></c:import>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:import url="../temp/topbar.jsp"></c:import>

				<!-- contents 작성 -->
				<div class="container-fluid">
					${fn:length(list)}
					<c:set var="total" value="0" />
					<div class="dropdown offset-md-11">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">${name}</button>

						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<c:if test="${name ne '전체'}">
								<li data-id=${s.id}><a class="dropdown-item"
									href="./information">전체</a></li>
							</c:if>
							<c:forEach items="${cat}" var="s">
								<c:if test="${name ne s.name}">
									<li data-id=${s.id}><a class="dropdown-item"
										href="./information?categoryId=${s.id}">${s.name}</a></li>
								</c:if>
							</c:forEach>

						</ul>
					</div>
					<%-- <c:forEach items="${list}" var="vo">
		<p>${vo.id}
		<p><a href="./check?id=${vo.id}">${vo.contents}</a>
		<p>${vo.date}
		<p>${vo.memberId}
		
	</c:forEach>
	<c:forEach items="${list}" var="vo">
		<p>${vo.id}
		<p><a href="./check?id=${vo.id}">${vo.contents}</a>
		<p>${vo.date}
		<p>${vo.memberId}	
	</c:forEach> --%>


					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="home-tab"
								data-bs-toggle="tab" data-bs-target="#home" type="button"
								role="tab" aria-controls="home" aria-selected="true">전체</button>
						</li>
						<c:if test="${name ne '전체'}">
							<c:forEach items="${cat2}" var="s">
								<c:if test="${name eq s.name}">
									<c:forEach items="${cat1}" var="ss">
										<c:if test="${ss.ref eq s.id}">
											<li class="nav-item" role="presentation">
												<button class="nav-link" id="${ss.id}" data-bs-toggle="tab"
													data-bs-target="#id_${ss.id}" type="button" role="tab"
													aria-controls="${ss.id}" aria-selected="false">${ss.name}</button>
											</li>
										</c:if>
									</c:forEach>

								</c:if>


							</c:forEach>

						</c:if>

					</ul>



					<!-- cat1 ==  ref 1-->
					<!-- cat ==  ref 0-->
					<!-- cat2 ==  전부-->
					<div class="tab-content" id="myTabContent">
						<%-- <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  	
  	<c:forEach items="${list}" var="vo">
  		<c:choose>
  			<c:when test="${name ne '전체'}">
  		<c:forEach items="${cat2}" var="ss">
  		
  		<c:forEach items="${cat}" var="se">
  		<c:if test="${name eq se.name and se.id eq ss.ref and vo.categoryId eq ss.id}">
  		
  			<p>${vo.id}
			<p><a href="./check?id=${vo.id}">${vo.contents}</a>
			<p>${vo.date}
			<p>${vo.memberId}			
			
			</c:if>
			</c:forEach>
			<c:if test="${ss.name eq name and vo.categoryId eq ss.id}">
			<p>${vo.id}
			<p><a href="./check?id=${vo.id}">${vo.contents}</a>
			<p>${vo.date}
			<p>${vo.memberId}
			</c:if>
			
  		
  		</c:forEach>
  		</c:when>
  		<c:otherwise>
  		
			<p>${vo.id}
			<p><a href="./check?id=${vo.id}">${vo.contents}</a>
			<p>${vo.date}
			<p>${vo.memberId}	
			</c:otherwise>
  		</c:choose>
	</c:forEach>
	
  </div> --%>
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="card mb-4">

								<div class="card-body">
									<!-- if문 돌릴 자리 -->
									<c:forEach items="${list}" var="vo">
										<c:choose>
											<c:when test="${name ne '전체'}">
												<c:forEach items="${cat2}" var="ss" varStatus="statuss">

													<c:forEach items="${cat}" var="se" varStatus="status">
														<c:if
															test="${name eq se.name and se.id eq ss.ref and vo.categoryId eq ss.id}">
															<%-- <c:out value="${status.count}"/> --%>
															<c:set var="total" value="${total+ 1}" />
														</c:if>

													</c:forEach>
													<c:if test="${ss.name eq name and vo.categoryId eq ss.id}">
														<c:set var="total" value="${total+ 1}" />

													</c:if>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:set var="total" value="${total+ 1}" />

											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:set var="size" value="${total}" />
									<c:set var="division" value="10" />
									<c:choose>
										<c:when test="${size<division}">
											<c:set var="divCount" value="1" />
										</c:when>
										<c:when test="${size%division == 0}">
											<c:set var="divCount" value="${size/division}" />
										</c:when>
										<c:when test="${size%division != 0}">
											<c:set var="divCount" value="${size/division + 1}" />
										</c:when>
									</c:choose>
									<fmt:parseNumber var="divCount" value="${divCount}"
										integerOnly="true" />

									<c:forEach var="i" begin="0" end="${divCount-1}">
										<div id="div_${i}">
											<c:choose>
												<c:when test="${i*10 + 10 < size}">
													<c:forEach var="k" begin="${i*10 + 1}" end="${i*10 + 10}">
														<span>${k}</span>
													</c:forEach>
												</c:when>
												<c:when test="${i*10 + 10 > size}">
													<c:forEach var="k" begin="${i*10 + 1}" end="${size}">
														<span>${k}</span>
													</c:forEach>
												</c:when>
											</c:choose>
										</div>
									</c:forEach>


									<div
										class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">

										<div class="datatable-container">
											<table class="table table-hover">
												<thead>
													<tr>
														<th>id</th>
														<th>내용</th>
														<th>날짜</th>
														<th>회원 번호</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach items="${list}" var="vo">
														<c:choose>
															<c:when test="${name ne '전체'}">
																<c:forEach items="${cat2}" var="ss" varStatus="statuss">

																	<c:forEach items="${cat}" var="se" varStatus="status">
																		<c:if
																			test="${name eq se.name and se.id eq ss.ref and vo.categoryId eq ss.id}">
																			<%-- <c:out value="${status.count}"/> --%>

																			<tr>

																				<!--  -->


																				<c:set var="size" value="${total}" />
																				<c:set var="division" value="10" />
																				<c:choose>
																					<c:when test="${size<division}">
																						<c:set var="divCount" value="1" />
																					</c:when>
																					<c:when test="${size%division == 0}">
																						<c:set var="divCount" value="${size/division}" />
																					</c:when>
																					<c:when test="${size%division != 0}">
																						<c:set var="divCount" value="${size/division + 1}" />
																					</c:when>
																				</c:choose>
																				<fmt:parseNumber var="divCount" value="${divCount}"
																					integerOnly="true" />

																				<c:forEach var="i" begin="0" end="${divCount-1}">
																					<div id="div_${i}">
																						<c:choose>
																							<c:when test="${i*10 + 10 < size}">
																								<td>${vo.id}</td>
																								<td><a href="./check?id=${vo.id}">${vo.contents}</a></td>
																								<td>${vo.date}</td>
																								<td>${vo.memberId}</td>
																							</c:when>
																							<c:when test="${i*10 + 10 > size}">
																								<td>${vo.id}</td>
																								<td><a href="./check?id=${vo.id}">${vo.contents}</a></td>
																								<td>${vo.date}</td>
																								<td>${vo.memberId}</td>
																							</c:when>
																						</c:choose>
																					</div>
																				</c:forEach>



																				<!--  -->



																				<%-- <td>${vo.id}</td>
																				<td><a href="./check?id=${vo.id}">${vo.contents}</a></td>
																				<td>${vo.date}</td>
																				<td>${vo.memberId}</td> --%>

																			</tr>

																		</c:if>
																	</c:forEach>
																	<c:if
																		test="${ss.name eq name and vo.categoryId eq ss.id}">

																		<tr>

																			<td>${vo.id}</td>
																			<td><a href="./check?id=${vo.id}">${vo.contents}</a></td>
																			<td>${vo.date}</td>
																			<td>${vo.memberId}</td>

																		</tr>
																	</c:if>


																</c:forEach>
															</c:when>
															<c:otherwise>


																<tr>

																	<td>${vo.id}</td>
																	<td><a href="./check?id=${vo.id}">${vo.contents}</a></td>
																	<td>${vo.date}</td>
																	<td>${vo.memberId}</td>

																</tr>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</tbody>

											</table>



											<div class="row d-flex justify-content-center">
												<c:out value="${total}" />
												<nav aria-label="Page navigation example">
													<ul class="pagination ">
														<li class="page-item "><a class="page-link" href="#"
															aria-label="Previous" data-board-page="1"> <!-- 						==page=1 -->

																<span aria-hidden="true">&laquo;</span>
														</a></li>
														<li class="page-item ${pager.before ? 'disabled' : ''}">
															<a class="page-link" href="#" aria-label="Previous"
															data-board-page="${pager.startNum-1}"> <span
																aria-hidden="true">&lsaquo;</span> <!--lsaquo는 꺽쇠 하나 laquo는 꺽쇠 두개  -->
														</a>
														</li>
														<c:forEach begin="${pager.startNum}" end="${divCount}"
															var="i">
															<li class="page-item"><a
																class="page-link ${pager.page eq i ? 'active' : '' }"
																href="#" data-board-page="${i}">${i}</a></li>
														</c:forEach>
														<!-- &gt = <꺽쇠를 표현 &lt는 >꺽쇠를 표현 -->
														<li
															class="page-item ${pager.after eq false ? 'disabled' : ''}">
															<!--  --> <a class="page-link " href="#"
															aria-label="Next" data-board-page="${pager.lastNum+1}">
																<span aria-hidden="true">&rsaquo;</span>
														</a>
														</li>
														<li class="page-item ">
															<!--  --> <a class="page-link " href="#"
															aria-label="Next" data-board-page="${pager.totalPage}">
																<span aria-hidden="true">&raquo;</span>
														</a>
														</li>
													</ul>
												</nav>

											</div>
											<div></div>


										</div>

									</div>
								</div>
							</div>

						</div>
						<!-- cat1 ==  ref 1-->
						<!-- cat ==  ref 0-->
						<!-- cat2 ==  전부-->
						<%--  <c:forEach items="${cat1}" var="s">
  <div class="tab-pane fade" id="id_${s.id}" role="tabpanel">
  	
  	<c:forEach items="${list}" var="vo">
  	<c:if test="${s.id eq vo.categoryId}">
  		<p>${vo.id}
		<p><a href="./check?id=${vo.id}">${vo.contents}</a>
		<p>${vo.date}
		<p>${vo.memberId}
  	</c:if>
  	 
  	 </c:forEach>
  </div>
   </c:forEach> --%>

						<c:forEach items="${cat1}" var="s">
							<div class="tab-pane fade" id="id_${s.id}" role="tabpanel">
								<c:set var="total" value="0" />
								<div class="card mb-4">

									<div class="card-body">
										<!-- if문 돌릴 자리 -->
										<c:forEach items="${list}" var="vo" varStatus="status">
											<c:if test="${s.id eq vo.categoryId}">

												<c:set var="total" value="${total+ 1}" />
											</c:if>
										</c:forEach>
										<div
											class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">

											<div class="datatable-container">
												<table class="table table-hover">
													<thead>
														<tr>
															<th>id</th>
															<th>내용</th>
															<th>날짜</th>
															<th>회원 번호</th>

														</tr>
													</thead>
													<tbody>
														<c:forEach items="${list}" var="vo" varStatus="status">
															<c:if test="${s.id eq vo.categoryId}">

																<%-- <c:set var="total" value="${total+ 1}"/> --%>
																<tr>
																	<td>${vo.id}</td>
																	<td><a href="./check?id=${vo.id}">${vo.contents}</a></td>
																	<td>${vo.date}</td>
																	<td>${vo.memberId}</td>
																</tr>
															</c:if>

														</c:forEach>
													</tbody>

												</table>
												<div class="row d-flex justify-content-center">
													<c:out value="${total}" />
													<nav aria-label="Page navigation example">
														<ul class="pagination">
															<li class="page-item "><a class="page-link" href="#"
																aria-label="Previous" data-board-page="1"> <!-- 						==page=1 -->

																	<span aria-hidden="true">&laquo;</span>
															</a></li>
															<li class="page-item ${pager.before ? 'disabled' : ''}">
																<a class="page-link" href="#" aria-label="Previous"
																data-board-page="${pager.startNum-1}"> <span
																	aria-hidden="true">&lsaquo;</span> <!--lsaquo는 꺽쇠 하나 laquo는 꺽쇠 두개  -->
															</a>
															</li>
															<c:forEach begin="${pager.startNum}"
																end="${pager.lastNum}" var="i">
																<li class="page-item"><a
																	class="page-link ${pager.page eq i ? 'active' : '' }"
																	href="#" data-board-page="${i}">${i}</a></li>
															</c:forEach>
															<!-- &gt = <꺽쇠를 표현 &lt는 >꺽쇠를 표현 -->
															<li
																class="page-item ${pager.after eq false ? 'disabled' : ''}">
																<!--  --> <a class="page-link " href="#"
																aria-label="Next" data-board-page="${pager.lastNum+1}">
																	<span aria-hidden="true">&rsaquo;</span>
															</a>
															</li>
															<li class="page-item ">
																<!--  --> <a class="page-link " href="#"
																aria-label="Next" data-board-page="${pager.totalPage}">
																	<span aria-hidden="true">&raquo;</span>
															</a>
															</li>
														</ul>
													</nav>

												</div>
												<div>
													<c:set var="size" value="${total}" />
													<c:set var="division" value="10" />
													<c:choose>
														<c:when test="${size<division}">
															<c:set var="divCount" value="1" />
														</c:when>
														<c:when test="${size%division == 0}">
															<c:set var="divCount" value="${size/division}" />
														</c:when>
														<c:when test="${size%division != 0}">
															<c:set var="divCount" value="${size/division + 1}" />
														</c:when>
													</c:choose>
													<fmt:parseNumber var="divCount" value="${divCount}"
														integerOnly="true" />

													<c:forEach var="i" begin="0" end="${divCount-1}">
														<div id="div_${i}">
															<c:choose>
																<c:when test="${i*10 + 10 < size}">
																	<c:forEach var="k" begin="${i*10 + 1}"
																		end="${i*10 + 10}">
																		<span>${k}</span>
																	</c:forEach>
																</c:when>
																<c:when test="${i*10 + 10 > size}">
																	<c:forEach var="k" begin="${i*10 + 1}" end="${size}">
																		<span>${k}</span>
																	</c:forEach>
																</c:when>
															</c:choose>
														</div>
													</c:forEach>

												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>



				</div>
			</div>
		</div>
	</div>


	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>