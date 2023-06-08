<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .upperCategory a{cursor:pointer;}
    .upperCategory .hide{display:none;}
</style>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="/">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			SB Admin <sup>2</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="/"> <i
			class="fas fa-fw fa-tachometer-alt"></i> <span>홈 화면</span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Interface</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>전자
				문서</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Components:</h6>
				<ul>
					<c:forEach items="${categoryList0}" var="upper">
						<li class="upperCategory">
							<span class="collapse-item" id="${upper.id}"><a href="/approval/application?id=${upper.id}" class="link">${upper.name}</a></span>
							<ul class="hide">
								<c:forEach items="${categoryList1}" var="under">
									<c:if test="${upper.id == under.ref}">
										<li id="${under.id}"><a class="collapse-item" href="/approval/application?id=${under.id}">${under.name}</a></li>
									</c:if> 
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
					<li>
						<span class="collapse-item" id="information"><a href="/approval/information" class="link">결재 승인</a></span>
					</li>
					<li>
						<span class="collapse-item" id="myInformation"><a href="/approval/myInformation" class="link">내 결재 정보</a></span>
					</li>
				</ul>
			</div>
		</div></li>

	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseUtilities"
		aria-expanded="true" aria-controls="collapseUtilities"> <i
			class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
	</a>
		<div id="collapseUtilities" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Utilities:</h6>
				<a class="collapse-item" href="utilities-color.html">Colors</a> <a
					class="collapse-item" href="utilities-border.html">Borders</a> <a
					class="collapse-item" href="utilities-animation.html">Animations</a>
				<a class="collapse-item" href="utilities-other.html">Other</a>
			</div>
		</div></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Addons</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapsePages"
		aria-expanded="true" aria-controls="collapsePages"> <i
			class="fas fa-fw fa-folder"></i> <span>게시판</span>
	</a>
		<div id="collapsePages" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Login Screens:</h6>
				<a class="collapse-item" href="login.html">Login</a> <a
					class="collapse-item" href="/qna/list">커뮤니티&QnA</a> <a
					class="collapse-item" href="/notice/list">공지사항</a>
				<div class="collapse-divider"></div>
				<h6 class="collapse-header">Other Pages:</h6>
				<a class="collapse-item" href="404.html">404 Page</a> <a
					class="collapse-item" href="blank.html">Blank Page</a>
			</div>
		</div></li>

	<!-- Nav Item - Charts -->
	<li class="nav-item"><a class="nav-link" href="charts.html"> <i
			class="fas fa-fw fa-chart-area"></i> <span>Charts</span></a></li>

	<!-- Nav Item - Tables -->
	<li class="nav-item"><a class="nav-link" href="/notice/list">
			<i class="fas fa-fw fa-table"></i> <span>Notice</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

	<!-- Sidebar Message -->
	<div class="sidebar-card d-none d-lg-flex">
		<img class="sidebar-card-illustration mb-2"
			src="/images/undraw_rocket.svg" alt="...">
		<p class="text-center mb-2">
			<strong>SB Admin Pro</strong> is packed with premium features,
			components, and more!
		</p>
		<a class="btn btn-success btn-sm"
			href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to
			Pro!</a>
	</div>

</ul>
<!-- End of Sidebar -->

