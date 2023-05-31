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
					
					<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    ${name}
  </button>
  <ul class="dropdown-menu animated--fade-in-up" aria-labelledby="dropdownMenuButton1">
  <c:if test="${name ne '전체'}">
    <li  data-id=${s.id}><a class="dropdown-item" href="./myInformation">전체</a></li>
    
       
    </c:if> 
    <li ><a class="dropdown-item" href="./myInformation?confirm=대기">대기</a></li>
      <li><a class="dropdown-item" href="./myInformation?confirm=거절">거절</a></li>
       <li><a class="dropdown-item" href="./myInformation?confirm=승인">승인</a></li>
    
    
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
												<td><a href="./myPayment?id=${vo.id}">${vo.contents}</a></td>
												<td>${vo.date}</td>
												<td>${vo.confirm}</td>
														  	
														  	 </tr>
					</c:forEach>
</tbody>
												
												</table>
											</div>
											
										</div>
									</div>
								</div>

<a href="/">돌아가기</a>
					


				</div>
				</div>
				</div>
				</div>

<c:import url="../temp/footer.jsp"></c:import>
<c:import url="../temp/logoutModal.jsp"></c:import>
	<c:import url="../temp/common_js.jsp"></c:import>

</body>
</html>