<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
   <head>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
   </head>
    <body>
    <h1>INDEX HOME</h1>
    	<c:choose>
    	<c:when test="${not empty app}">
    	
    	</c:when>
    	<c:otherwise>
    		
    		
    		<form action="./application" method="post" id="fr">
    		<input type="hidden" name="dd" id="ddd">
    		 <input type="hidden" name="categoryId" value="2">  
    		<div id="ttt">
    		<button type="button" class="appBtn" data-category="1">휴가</button>
    		<button type="button" class="appBtn" data-category="2">비품</button>
    		<button type="button" class="appBtn" data-category="3">교육비</button>
    		</div>
    	<!-- 	<button type="button" id="btn2">전송</button> -->
    		</form>
    	</c:otherwise>
       
       
       
       
      

</c:choose>
   
   
   
   
   <script type="text/javascript" src="/js/approvalApplication.js"></script>
<!-- <script type="text/javascript">
  $("#ttt").load("/file/approval/e03c2207-6b85-44b7-886c-dfa9ffbf02e8.html")
   </script>  -->
    </body>
</html>