<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Notice</title>

<!-- Custom fonts for this template -->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<link href="/css/sb-admin-2.min.css" rel="stylesheet">
 
<c:import url="../temp/header.jsp"></c:import>
<c:import url="../temp/style.jsp"></c:import>

<style>
   .table-responsive {
       overflow-x: hidden;
    }
</style>
<!-- Custom styles for this page -->
<!-- <link href="/css/dataTables.bootstrap4.min.css" rel="stylesheet"> -->

</head>

<body id="bg-gradient-primary">
<div id="wrapper">

<!-- sideBar -->
		
		<c:choose>
			<c:when test="${id != 'admin'}">
				<c:import url="../temp/sidebar.jsp"></c:import>
			</c:when>
			<c:when test="${id == 'admin'}">
				<c:import url="../temp/adminSidebar.jsp"></c:import>
			</c:when>
		</c:choose>
		
		<!-- sideBar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!--top bar  -->
				<c:choose>
					<c:when test="${id == 'admin'}">
						<c:import url="../temp/adminTopbar.jsp"></c:import>
					</c:when>
					<c:otherwise>
						<c:import url="../temp/topbar.jsp"></c:import>
					</c:otherwise>

				</c:choose>

				<!--top bar  End -->
		<!-- sideBar -->
	
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
		

	
	<div class="container-fluid">
	
	<div class="card shadow mb-3">
	
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
		</div>
		<div class="card-body">
		
			<div class="table-responsive">

				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6">
						
							<div id="dataTable_filter" class="dataTables_filter" style="display: flex; justify-content: flex-end;">
							
							</div>
						</div>
					</div>
					<div class="row">
					
						<div class="col-sm-12">
							<table class="table table-hover dataTable" id="dataTable"
								width="100%" cellspacing="0" role="grid"
								aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr role="row">
										<th class="sorting sorting_asc " tabindex="0"
											aria-controls="dataTable" rowspan="1" colspan="1"
											aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 99px;">번호</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Position: activate to sort column ascending"
											style="width: 148px;">제목</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending"
											style="width: 71px;">작성자</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 31px;">날짜</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Start date: activate to sort column ascending"
											style="width: 74px;">조회수</th>
								</thead>
								<tfoot>
									
								</tfoot>

								<tbody class="importantList">

									

									<c:forEach items="${list}" var="noticeVO">
										<tr class="check-item"
											data-num-important="${noticeVO.important}">
											<td class="id" data-num-id="${noticeVO.id}">${noticeVO.id}</td>
											<td><a href="./detail?id=${noticeVO.id}">${noticeVO.title}</a></td>
											<td>${noticeVO.writer}</td>
											<td>${noticeVO.regDate}</td>
											<td>${noticeVO.hit}</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<a class="btn btn-primary" href="./add"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="-4 -4 20 20" x="80" y="86"><defs><path id="t" d="M0 11.1h12V0H0z"/></defs><g fill="none" fill-rule="evenodd"><path fill="#575756" d="M0 8.056V11.1h3.044L9.39 4.677 6.356 1.642zM10.486 3.58l.017-.019c.327-.387.508-.88.508-1.387C11.01.987 10.045 0 8.859 0c-.507 0-1 .202-1.406.547l-.673.671 3.034 3.034.672-.672z"/><mask id="u" fill="#fff"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#t"/></mask><path fill="#575756" d="M4.8 11.1H12v-.6H4.8z" mask="url(#u)"/></g></svg>글쓰기</a>
					<!-- pager -->
					
					<!-- <div class="row d-flex justify-content-between-center"> -->
					<div class="row d-flex justify-content-center ">
						<nav aria-label="Page navigation example">
							<ul class="pagination  d-flex justify-content-center wow fadeIn"
								data-wow-delay="0.1s"">
								<li class=" page-item ${pager.before ? 'disabled' : '' }">
									<a class="page-link"
									href="./list?page=1&kind=${pager.kind}&search=${pager.search}"
									aria-label="Previous" data-board-page="1"> <span
										aria-hidden="true">&laquo;</span>
								</a>
								</li>
								<li class="page-item ${pager.before ? 'disabled' : ''}"><a
									class="page-link"
									href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"
									aria-label="Previous" data-board-page="${pager.startNum-1}">
										<span aria-hidden="true">&lsaquo;</span>
								</a></li>
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
									var="i">
									<li class="page-item"><a class="page-link"
										href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}"
										data-board-page="${i}">${i}</a></li>
								</c:forEach>
								<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
									<a class="page-link"
									href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"
									aria-label="Next" data-board-page="${pager.lastNum+1}"> <span
										aria-hidden="true">&rsaquo;</span>
								</a>
								</li>
								<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
									<a class="page-link"
									href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}"
									aria-label="Next" data-board-page="${pager.totalPage}"> <span
										aria-hidden="true">&raquo;</span>
								</a>
								</li>
							</ul>
						</nav>
					</div>
						<!-- <div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a></li><li class="paginate_button page-item next" id="dataTable_next"><a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div> -->
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->
	
	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright © Your Website 2020</span>
			</div>
		</div>
	</footer>
	
	<!-- End of Footer -->

	</div>
	</div>
	</div>
	<!-- End of Content Wrapper -->

	
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
	<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

 <script src="/vendor/datatables/jquery.dataTables.min.js"></script>
 <script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<c:import url="../temp/logoutModal.jsp"></c:import>
	
	<script src="/js/dataTable.js"></script>
	<script src="/js/noticeImportant.js"></script>
	<c:import url="../temp/common_js.jsp"></c:import>
	
</body>
</html>






















