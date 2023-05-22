<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="/css/rouletteSide.css" rel="stylesheet">
</head>
<body>
<div id="rouletSidebar" class="card my-3">
  <canvas width="300" height='300'></canvas>  
  <button onclick="rotate()">룰렛 돌리기</button>
</div>
<script type="text/javascript" src="../js/roulette.js"></script>
</body>
</html>