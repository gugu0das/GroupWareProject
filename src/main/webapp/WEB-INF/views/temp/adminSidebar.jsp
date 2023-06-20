<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.upperCategory a {
	cursor: pointer;
}

.upperCategory .hide {
	display: none;
}
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
			class="fas fa-fw fa-tachometer-alt"></i> <span>HOME</span></a></li>
	<!-- Divider -->
	<hr class="sidebar-divider">
	<div class="sidebar-heading">유저관리</div>
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#member" aria-expanded="true"
		aria-controls="collapsePages"> <i class="fas fa-fw fa-folder"></i>
			<span>사원관리</span>
	</a>
		<div id="member" class="collapse" aria-labelledby="headingPages"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">


				<a class="collapse-item" href="/member/memberList"> <i
					class="mr-2 text-gray-400"><img
						src="   https://cdn-icons-png.flaticon.com/512/3171/3171593.png "
						style="height: 12.42px; width: 13.88px"></i> 사원목록
				</a> <a class="collapse-item" href="/member/join"> <i
					class="mr-2 text-gray-400"><img
						src="   https://cdn-icons-png.flaticon.com/512/1387/1387940.png "
						style="height: 12.42px; width: 13.88px"></i> 계정 생성
				</a>

				<!-- <div class="collapse-divider"></div>
				<h6 class="collapse-header">Other Pages:</h6>
				<a class="collapse-item" href="404.html">404 Page</a> <a
					class="collapse-item" href="blank.html">Blank Page</a> -->
			</div>
		</div></li>
	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">회사관리</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#department" aria-expanded="true"
		aria-controls="collapsePages"> <i class="fas fa-fw fa-folder"></i>
			<span>부서 및 직책</span>
	</a>
		<div id="department" class="collapse" aria-labelledby="headingPages"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">


				<a class="collapse-item" href="/department/list"> <i
					class="mr-2 text-gray-400"><img
						src="   https://cdn-icons-png.flaticon.com/512/3142/3142885.png "
						style="height: 12.42px; width: 13.88px"></i> 부서 및 직책 리스트
				</a> <a class="collapse-item" href="/department/add"> <i
					class="mr-2 text-gray-400"><img
						src="   https://cdn-icons-png.flaticon.com/512/2648/2648330.png "
						style="height: 12.42px; width: 13.88px"></i> 부서 및 직책 추가
				</a>

				<!-- <div class="collapse-divider"></div>
				<h6 class="collapse-header">Other Pages:</h6>
				<a class="collapse-item" href="404.html">404 Page</a> <a
					class="collapse-item" href="blank.html">Blank Page</a> -->
			</div>
		</div></li>
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseThree"
		aria-expanded="true" aria-controls="collapseTwo"> <i
			class="fas fa-fw fa-cog"></i> <span>결재 카테고리 관리</span>
	</a>
		<div id="collapseThree" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Components:</h6>
				<ul>
					<li><span class="collapse-item" id="information"><a
							href="/approval/addCategory" class="link">추가</a></span></li>
					<li><span class="collapse-item" id="myInformation"><a
							href="/approval/updateCategory" class="link">수정</a></span></li>
				</ul>
			</div>
		</div></li>







</ul>
<!-- End of Sidebar -->

