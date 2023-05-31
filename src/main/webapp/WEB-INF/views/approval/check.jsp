<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <c:import url="../temp/header.jsp"></c:import>
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
					<div class="row">
					<div class="card mb-4">
									<div class="card-header">
										<c:choose>
										<c:when test="${checkNum eq 1}">
										<h3>승인 신청서</h3>
										</c:when>
										<c:otherwise>
											<h3>내 결재 정보</h3>
										</c:otherwise>
										</c:choose>
									</div>
									<div class="card-body">
										<div
											class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
											
											<div class="datatable-container">
					<div id ="dd">
</div>
							<form action="./approval" method="post" id="fm">
								<input type="hidden" name="fileName" value="${file}">
								<input type="hidden" name="ddd" id="ddd">
								<input type="hidden" name="approval" id="approval">
								<input type="hidden" name="id1" value="${id}">
								<%-- <input type="hidden" name="id2" value="${id}"> --%>
								<c:choose>
										<c:when test="${checkNum eq 1}">
										<button type="button"  value="1" class="btn">승인</button>
										<button type="button"  value="0" class="btn">거절</button>
										</c:when>
										<c:otherwise>
											
										</c:otherwise>
										</c:choose>
								
							</form>
</div>
											
										</div>
									</div>
								</div>
					</div>


				</div>
				</div>
				</div>
				</div>




<c:import url="../temp/footer.jsp"></c:import>
<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>
<script type="text/javascript">
  $("#dd").load("/file/approval/${file}")
 </script> 
 <script type="text/javascript" src="/js/approvalApproval.js">	
 </script>
</body>
</html>