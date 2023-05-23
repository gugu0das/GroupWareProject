<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<!DOCTYPE html>

<html lang="en">
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
    <body>
    
    	<h1>INDEX HOME</h1>
    	
    	<div id="header"></div>
    	<!-- <iframe src="./1.html" name="left" width="200" height="500"></iframe> -->

	<script type="text/javascript">
		$('#header').load("/file/1.html");
	</script>
	
    </body>
</html>
