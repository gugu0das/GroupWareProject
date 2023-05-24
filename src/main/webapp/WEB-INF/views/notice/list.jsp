<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en"><head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Notice</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
  	<link href="/css/sb-admin-2.min.css" rel="stylesheet">
 

    <!-- Custom styles for this page -->
    <link href="/css/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

	
		<c:import url="../temp/header2.jsp"></c:import>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">공지사항 테이블</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4"><div class="row"><div class="col-sm-12 col-md-6"><div class="dataTables_length" id="dataTable_length"><label>Show <select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div></div><div class="col-sm-12 col-md-6"><div id="dataTable_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable"></label></div></div></div><div class="row"><div class="col-sm-12"><table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                    <thead>
                                        <tr role="row"><th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 99px;">번호</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 148px;">제목</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 71px;">작성자</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 31px;">날짜</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 74px;">조회수</th><!-- <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 67px;">Salary</th> --></tr>
                                    </thead>
                                    <tfoot>
                                        <tr><th rowspan="1" colspan="1">번호</th><th rowspan="1" colspan="1">제목</th><th rowspan="1" colspan="1">작성자</th><th rowspan="1" colspan="1">날짜</th><th rowspan="1" colspan="1">조회수</th><!-- <th rowspan="1" colspan="1">Salary</th> --></tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${list}" var="noticeVO">
                                        <tr class="odd">
                                            <td class="sorting_1">${noticeVO.id}</td>
                                            <td><a href="./detail?id=${noticeVO.id}">${noticeVO.title}</a></td>
                                            <td>${noticeVO.writer}</td>
                                            <td>${noticeVO.regDate}</td>
                                            <td>${noticeVO.hit}</td>
                                            
                                        </tr>
                                     </c:forEach>
                                        </tbody>
                                </table></div></div>
                                <!-- pager -->
        		<div class="row d-flex justify-content-between">
					<nav aria-label="Page navigation example">
						<ul class="pagination  d-flex justify-content-center wow fadeIn" data-wow-delay="0.1s"">
					 		<li class=" page-item ${pager.before ? 'disabled' : '' }">
								<a class="page-link" href="./list?page=1&kind=${pager.kind}&search=${pager.search}" aria-label="Previous" data-board-page="1">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="page-item ${pager.before ? 'disabled' : ''}">
								<a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous" data-board-page="${pager.startNum-1}">
									<span aria-hidden="true">&lsaquo;</span>
								</a>
							</li>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}" data-board-page="${i}">${i}</a></li>
							</c:forEach>
							<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
								<a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next" data-board-page="${pager.lastNum+1}">
									<span aria-hidden="true">&rsaquo;</span>
								</a>
							</li>
							<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
								<a class="page-link" href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}" aria-label="Next" data-board-page="${pager.totalPage}">
									<span aria-hidden="true">&raquo;</span>
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
            <a class="btn btn-primary" href="./add">글쓰기</a>   
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
     
    </div>
    

</body>
</html>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
