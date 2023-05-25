<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
   <head>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
      
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   </head>
    <body>
    <h1>INDEX HOME</h1>
    <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
   ${board}
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="#">Action</a></li>
    <li><a class="dropdown-item" href="#">Another action</a></li>
    <li><a class="dropdown-item" href="#">Something else here</a></li>
  </ul>
</div>
    	<c:choose>
    	<c:when test="${not empty app}">
    	
    	</c:when>
    	<c:otherwise>
    		
    		
    		<form action="./application" method="post" id="fr">
    		<input type="hidden" name="dd" id="ddd">
    		 <input type="hidden" name="categoryId" value="2">  
    		 <input type="hidden" name="count" id="vacation">
    		 <input type="hidden" name="reason" id="reason">
    		 <input type="hidden" name="useDate" id="useDate">
    		 <input type="hidden" name="degree" id="type">
    		<div id="ttt">
    		<button type="button" class="appBtn" data-category="1">휴가</button>
    		<button type="button" class="appBtn" data-category="2">비품</button>
    		<button type="button" class="appBtn" data-category="3">교육비</button>
    		</div>
    	<!-- 	<button type="button" id="btn2">전송</button> -->
    		</form>
    	</c:otherwise>
       
       
       
       
      

</c:choose>
   
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   
   <script type="text/javascript" src="/js/approvalApplication.js"></script>
<!-- <script type="text/javascript">
  $("#ttt").load("/file/approval/e03c2207-6b85-44b7-886c-dfa9ffbf02e8.html")
   </script>  -->
    </body>
</html>