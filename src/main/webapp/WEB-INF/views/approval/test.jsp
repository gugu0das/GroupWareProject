<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/header.jsp"></c:import>

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
<!-- Tab을 구성할 영역 설정-->
<div style="margin:10px;">
	<!-- Tab 영역 태그는 ul이고 클래스는 nav와 nav-tabs를 설정한다. -->
	<ul class="nav nav-tabs">
		<!-- Tab 아이템이다. 태그는 li과 li > a이다. li태그에 active는 현재 선택되어 있는 탭 메뉴이다. -->
		<c:forEach items="${ref0}" var="ref0" varStatus="status">
			<c:choose>
				<c:when test="${status.index == 0 }">
					<li class="active"><a href="#all" data-toggle="tab">${ref0.name}</a></li>
				</c:when>
				<c:when test="${status.index != 0 }">
					<li><a href="${ref0.name }" data-toggle="tab">${ref0.name }</a></li>
				</c:when>
			</c:choose>
			
		</c:forEach>
		<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
		<!-- a 태그의 href는 아래의 tab-content 영역의 id를 설정하고 data-toggle 속성을 tab으로 설정한다. -->
		<li><a href="#profile" data-toggle="tab">Profile</a></li>
		<li><a href="#messages" data-toggle="tab">Messages</a></li>
		<li><a href="#settings" data-toggle="tab">Settings</a></li>
	</ul>
	<!-- Tab이 선택되면 내용이 보여지는 영역이다. -->
	<!-- 태그는 div이고 class는 tab-content로 설정한다. -->
	<div class="tab-content">
		<!-- 각 탭이 선택되면 보여지는 내용이다. 태그는 div이고 클래스는 tab-pane이다. -->
		<!-- active 클래스는 현재 선택되어 있는 탭 영역이다. -->
		<div class="tab-pane fade in active" id="#all">ALL</div>
		<!-- id는 고유한 이름으로 설정하고 tab의 href와 연결되어야 한다. -->
		<div class="tab-pane fade" id="profile">Profile 메뉴</div>
		<!-- fade 클래스는 선택적인 사항으로 트랜지션(transition)효과가 있다.
<!-- in 클래스는 fade 클래스를 선언하여 트랜지션효과를 사용할 때 in은 active와 선택되어 있는 탭 영역의 설정이다. -->
		<div class="tab-pane fade" id="messages">Messages 메뉴</div>
		<div class="tab-pane fade" id="settings">Settings 메뉴</div>
	</div>
</div>

	<c:set var="size" value="31"/>
	<c:set var="division" value="10"/>
	<c:choose>
		<c:when test="${size%division == 0}">
			<c:set var="divCount" value="${size/division}"/>
		</c:when>
		<c:when test="${size%division != 0}">
			<c:set var="divCount" value="${size/division + 1}"/>
		</c:when>
	</c:choose>
	<fmt:parseNumber var="divCount" value="${divCount}" integerOnly="true" />
	
	<c:forEach var="i" begin="0" end="${divCount-1}">
		<div id="div_${i}">
			<c:choose>
				<c:when test="${i*10 + 10 < size}">
					<c:forEach var="k" begin="${i*10 + 1}" end="${i*10 + 10}">
						<span>${k}</span>
					</c:forEach>
				</c:when>
				<c:when test="${i*10 + 10 > size}">
					<c:forEach var="k" begin="${i*10 + 1}" end="${size}">
						<span>${k}</span>
					</c:forEach>
				</c:when>
			</c:choose>	
		</div>
	</c:forEach>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script src="/vendor/bootstrap/js/bootstrap.js"></script>
</body>

</html>