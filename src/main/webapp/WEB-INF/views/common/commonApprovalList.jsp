<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../temp/header.jsp"></c:import>

<c:import url="../temp/style.jsp"></c:import>



<div class="card mb-4">		
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
															
																<tr>
																	<td>${vo.id}</td>
																	<td><a href="./check?id=${vo.id}">${vo.contents}</a></td>
																	<td>${vo.date}</td>
																	<td>${vo.memberId}</td>
																</tr>
															

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
								</div>



	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


<%-- <c:forEach items="${list}" var="vo"> 
<tr>

	<td>${vo.id}</td>
	<td><a href="./check?id=${vo.id}">${vo.contents}</a></td>
	<td>${vo.date}</td>
	<td>${vo.memberId}</td>

</tr>


</c:forEach> --%>