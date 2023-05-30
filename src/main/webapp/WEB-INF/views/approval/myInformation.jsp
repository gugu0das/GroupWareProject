<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/header2.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
     
</head>
<body>
<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    ${name}
  </button>
  
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
  <c:if test="${name ne '전체'}">
    <li  data-id=${s.id}><a class="dropdown-item" href="./myInformation">전체</a></li>
    
       
    </c:if> 
    <li ><a class="dropdown-item" href="./myInformation?confirm=대기">대기</a></li>
      <li><a class="dropdown-item" href="./myInformation?confirm=거절">거절</a></li>
       <li><a class="dropdown-item" href="./myInformation?confirm=승인">승인</a></li>
    
    
  </ul>
</div>
<c:forEach items="${list}" var="vo">
	${vo.id}
	${vo.contents}
	${vo.confirm}
</c:forEach>

<a href="/">돌아가기</a>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>