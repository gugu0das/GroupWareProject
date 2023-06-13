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
		<c:import url="../temp/sidebar.jsp"></c:import>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:import url="../temp/topbar.jsp"></c:import>

				<!-- contents 작성 -->
				<div class="container-fluid">
					<div class="row">
					<div class="card mb-4">
									<div class="card-header">
										
										
									</div>
									<div class="card-body">
										<div
											class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
											
											<div class="datatable-container">
					
					<c:choose>
							<c:when test="${not empty app}">

							</c:when>
							<c:otherwise>


								<form action="./application" method="post" id="fr">
									<input type="hidden" name="dd" id="ddd"> <input
										type="hidden" name="categoryId" value="${cat}"> <input
										type="hidden" name="count" id="vacation"> <input
										type="hidden" name="reason" id="reason"> <input
										type="hidden" name="useDate" id="useDate"> 
										 
									<div id="ttt">
										
									</div>
									<!-- 	<button type="button" id="btn2">전송</button> -->
								
								</form>
							</c:otherwise>

						</c:choose>
						</div>
											
										</div>
									</div>
								</div>
					</div>


				</div>
				<!-- END Contents  -->

				<!-- Footer -->
				<c:import url="../temp/footer.jsp"></c:import>
				<!-- End of Footer -->
			</div>
			<!-- End of Content Wrapper -->
		</div>
		<!-- End of Page Wrapper -->
	</div>

	<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
	<script type="text/javascript">
	$("#ttt").load("/files/approvalForm/${file}");
	  /* $("#ttt").load("/files/approvalFormFile/${file}");  */
	 $("#fr").append('<SPAN>결재 상세 내용</SPAN><input type="text" name="contents"><br>')
	    $("#fr").append('<button type="button" id="btn">전송</button>');
	</script>
		<script type="text/javascript" src="/js/approvalApplication.js"></script>
</body>
</html>