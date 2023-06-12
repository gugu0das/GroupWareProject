<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									<li data-id="${s.id}"><a class="dropdown-item"  href="./information?categoryId=${s.id}"
									>${s.name}</a></li>
								</c:if>
							</c:forEach>

						</ul>
					</div>
					


					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="home-tab"
								data-bs-toggle="tab" data-bs-target="#home1" type="button"
								role="tab" aria-controls="home1" aria-selected="true">전체</button>
						</li>
						<!-- cat1 ==  ref 1-->
					<!-- cat ==  ref 0-->
					<!-- cat2 ==  전부-->
						<c:if test="${name ne '전체'}">
							<c:forEach items="${cat2}" var="s">
								<c:if test="${name eq s.name}">
									<c:forEach items="${cat1}" var="ss">
										<c:if test="${ss.ref eq s.id}">
											<li class="nav-item" role="presentation">
												<button class="nav-link tabName tabar" id="${ss.id}" data-bs-toggle="tab" class="tabar"
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
						
						<div class="tab-pane fade show active" id="home1" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="card mb-4">
								
								<div class="card-body">
									<div
										class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">

										<div class="datatable-container">
										<!-- 전체 내용 들어갈 자리 -->
											<table class="table table-hover">
												<thead>
													<tr>
														<th>id</th>
														<th>내용</th>
														<th>날짜</th>
														<th>회원 이름</th>
														<th>부서</th>

													</tr>
												</thead>
												<tbody>
												
													<c:forEach items="${list}" var="vo">

																<tr>

																	<td>${vo.id}</td>
																	<td><a href="./check?id=${vo.id}">${vo.contents}</a></td>
																	<td>${vo.date}</td>
																	<td>${vo.memberVO.name}</td>
																	<td>${vo.memberVO.departmentId}</td>

																</tr>
	
													</c:forEach>
													
												</tbody>

											</table>
											<!-- 전체 내용 들어갈 자리 -->
											<div class="row d-flex justify-content-center">
				<nav aria-label="Page navigation example">
		 			<ul class="pagination " >
			    		<li class="page-item ">
			      			<a class="page-link" href="#" aria-label="Previous" data-board-page="1">
			        			<!-- 						==page=1 -->
			        			
			        			<span aria-hidden="true">&laquo;</span>
			      			</a>
			    		</li>
			    		<li class="page-item ${pager.before ? 'disabled' : ''}">
			      			<a class="page-link" href="#" aria-label="Previous" data-board-page="${pager.startNum-1}">
			        			<span aria-hidden="true">&lsaquo;</span> <!--lsaquo는 꺽쇠 하나 laquo는 꺽쇠 두개  -->
			      			</a>
			    		</li>
			    		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    		<li class="page-item"><a class="page-link ${pager.page eq i ? 'active' : '' }" href="#" data-board-page="${i}">${i}</a></li>
			    		</c:forEach>
			    		<!-- &gt = <꺽쇠를 표현 &lt는 >꺽쇠를 표현 -->
			    		<li class="page-item ${pager.after eq false ? 'disabled' : ''}"> <!--  -->
			      			<a class="page-link " href="#"  aria-label="Next" data-board-page="${pager.lastNum+1}">
			        			<span aria-hidden="true">&rsaquo;</span>
			      			</a>
			    		</li>
			    		<li class="page-item "> <!--  -->
			      			<a class="page-link " href="#"  aria-label="Next" data-board-page="${pager.totalPage}">
			        			<span aria-hidden="true">&raquo;</span>
			      			</a>
			    		</li>
		  			</ul>
				</nav>
		
			</div>
			
			<form class="row g-3" action="./information" method="get" id="searchForm">
			<input type="hidden" name="categoryId" value="${caa}" id="cdt">
				<input type="hidden" name="page" value="1" id="page">
				<%-- <div class="col-auto">
					<label for="kind" class="visually-hidden">Kind</label>
					<select class="form-select" name="kind" id="kind" aria-label="Default select example">
						<option value="title" ${pager.kind eq 'title' ? 'selected' : '' }>제목</option>
						<option value="contents" ${pager.kind eq 'contents' ? 'selected' : '' }>내용</option>
						<option value="wrtier" ${pager.kind eq 'writer' ? 'selected' : '' }>작성자</option>
					</select>
				</div> --%>
				<div class="col-auto">
					<!-- <label for="Search" class="visually-hidden">Search</label> -->
					<input type="hidden" class="form-control" name="search" id="search" placeholder="검색어 입력" value="${pager.search}">
				</div>
				<!-- <div class="col-auto">
					<button type="submit" class="btn btn-primary mb-3">검색</button>
				</div> -->
			</form>
			
			
										</div>

									</div>
								</div>
							</div>

						</div>
						
						<c:forEach items="${cat1}" var="s">
							<div class="tab-pane fade" id="id_${s.id}" role="tabpanel">
								<%-- <div class="card mb-4">
									
									<div class="card-body">
										<div
											class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">

											<div class="datatable-container">
												<!--  하위 옵션 내용이 들어갈 자리 -->
												
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
															<c:if test="${s.id eq vo.categoryId}">
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
												
												
												<!-- 내용이 들어갈 자리 -->
												<div class="row d-flex justify-content-center">
				<nav aria-label="Page navigation example">
		 			<ul class="pagination">
			    		<li class="page-item ">
			      			<a class="page-link" href="#" aria-label="Previous" data-board-page="1">
			        			<!-- 						==page=1 -->
			        			
			        			<span aria-hidden="true">&laquo;</span>
			      			</a>
			    		</li>
			    		<li class="page-item ${pager.before ? 'disabled' : ''}">
			      			<a class="page-link" href="#" aria-label="Previous" data-board-page="${pager.startNum-1}">
			        			<span aria-hidden="true">&lsaquo;</span> <!--lsaquo는 꺽쇠 하나 laquo는 꺽쇠 두개  -->
			      			</a>
			    		</li>
			    		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    		<li class="page-item"><a class="page-link ${pager.page eq i ? 'active' : '' }" href="#" data-board-page="${i}">${i}</a></li>
			    		</c:forEach>
			    		<!-- &gt = <꺽쇠를 표현 &lt는 >꺽쇠를 표현 -->
			    		<li class="page-item ${pager.after eq false ? 'disabled' : ''}"> <!--  -->
			      			<a class="page-link " href="#"  aria-label="Next" data-board-page="${pager.lastNum+1}">
			        			<span aria-hidden="true">&rsaquo;</span>
			      			</a>
			    		</li>
			    		<li class="page-item "> <!--  -->
			      			<a class="page-link " href="#"  aria-label="Next" data-board-page="${pager.totalPage}">
			        			<span aria-hidden="true">&raquo;</span>
			      			</a>
			    		</li>
		  			</ul>
				</nav>
		
			</div>
			<form class="row g-3" action="./information" method="get" id="searchForm">
				<input type="hidden" name="page" value="1" id="page">
				<div class="col-auto">
					<label for="kind" class="visually-hidden">Kind</label>
					<select class="form-select" name="kind" id="kind" aria-label="Default select example">
						<option value="title" ${pager.kind eq 'title' ? 'selected' : '' }>제목</option>
						<option value="contents" ${pager.kind eq 'contents' ? 'selected' : '' }>내용</option>
						<option value="wrtier" ${pager.kind eq 'writer' ? 'selected' : '' }>작성자</option>
					</select>
				</div>
				<div class="col-auto">
					<label for="Search" class="visually-hidden">Search</label>
					<input type="text" class="form-control" name="search" id="search" placeholder="검색어 입력" value="${pager.search}">
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-primary mb-3">검색</button>
				</div>
			</form>
											</div>

										</div>
									</div>
								</div> --%>
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
		
		<script src="/js/paging.js"></script>
		<script src="/js/approvalInformation.js"></script>

</body>
</html>