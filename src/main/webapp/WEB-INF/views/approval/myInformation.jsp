<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    ${name}
  </button>
  <ul class="dropdown-menu animated--fade-in-up" aria-labelledby="dropdownMenuButton1">
  <c:if test="${name ne '전체'}">
    <li  data-id=${s.id}><a class="dropdown-item" href="./myInformation">전체</a></li>
    
       
    </c:if> 
    <c:if test="${name ne '대기'}"> 
    	<li ><a class="dropdown-item" href="./myInformation?confirm=대기">대기</a></li>
    </c:if>
    
    <c:if test="${name ne '거절'}">
     <li><a class="dropdown-item" href="./myInformation?confirm=거절">거절</a></li>
     </c:if>
      
      <c:if test="${name ne '승인'}"> 
      	<li><a class="dropdown-item" href="./myInformation?confirm=승인">승인</a></li>
      </c:if>
       
    
    
  </ul>
</div>
<div class="card mb-4">
									<div class="card-header">
										
										
									</div>
									<div class="card-body">
										<div
											class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
											
											<div class="datatable-container">
												<table class="table table-hover">
												<thead>
													<tr>
														<th>id</th>
														<th>내용</th>
														<th>날짜</th>
														<th>상태</th>
														
													</tr>
												</thead>
												<tbody>
					<c:forEach items="${list}" var="vo">
												<tr>
														  	
												<td>${vo.id}</td>
												<td><a href="./myPayment?id=${vo.id}&&confirm=${vo.confirm}">${vo.contents}</a></td>
												<td>${vo.date}</td>
												<td>${vo.confirm}</td>
														  	
														  	 </tr>
					</c:forEach>
</tbody>
												
												</table>
											</div>
											
										</div>
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
			
			<form class="row g-3" action="./myInformation" method="get" id="searchForm">
			<input type="hidden" name="confirm" value="${caa}" id="cdt">
				<input type="hidden" name="page" value="1" id="page">
				<%-- <div class="col-auto">
					<label for="kind" class="visually-hidden">Kind</label>
					<select class="form-select" name="kind" id="kind" aria-label="Default select example">
						<option value="contents" ${pager.kind eq 'contents' ? 'selected' : '' }>내용</option>
					</select>
				</div> --%>
				<div class="col-auto row">
					<!-- <label for="Search" class="visually-hidden">Search</label> -->
					<input type="hidden" class="form-control" name="search" id="search" placeholder="검색어 입력" value="${pager.search}">
				</div>
				<!-- <div class="col-auto">
					<button type="submit" class="btn btn-primary mb-3">검색</button>
				</div> -->
			</form>
										
									</div>
								</div>
								
<a href="/">돌아가기</a>
					


				</div>
				</div>
				</div>
				</div>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<c:import url="../temp/footer.jsp"></c:import>
<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
	<script src="/js/paging.js"></script>

</body>
</html>