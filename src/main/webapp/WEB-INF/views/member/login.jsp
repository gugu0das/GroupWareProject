<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/header.jsp"></c:import>

<title>login</title>
<style type="text/css">
body {
	margin: 0;
}

.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
}

.item {
	padding: 50px;
	font-weight: 900;
}
.form-control:{
	height: 50px;
}
</style>
<!-- Custom styles for this template-->
<c:import url="../temp/style.jsp"></c:import>
</head>
<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row wrapper">

			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5" style="">
					<div class="card-body p-0 ">

						<div class="row">

							<div class="col-lg-12" style="">
								<div class="p-5">
									<div class="text-center">
								
									<div class="mb-3">
									<img alt="" src="https://search.pstatic.net/common/?autoRotate=true&quality=100&type=f640_380&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210625_264%2F1624581020532HHm0t_GIF%2FYn7tpk0b2TFax2P0avPpGBjY.gif" style="height: 200px; width: 400px">
									</div>
									

									</div>
									<form class="user" action="./login" method="post">
										<div class="form-group row">
											<div class="col-1"
												style="border-radius: 50%; border-color: gray;">
												
												<img src="   https://cdn-icons-png.flaticon.com/512/8484/8484069.png " width="45px" height="45px" alt="" title="" class="img-small">
												
												</div>
											<div class="col-11">
												<input type="text" class="form-control" id="accountId"
													aria-describedby="emailHelp" name="accountId"
													value="${cookie.remember.value }" placeholder="ID">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-1"
												style="border-radius: 50%; border-color: gray;">
												<img src="   https://cdn-icons-png.flaticon.com/512/8816/8816424.png " width="45px" height="45px" alt="" title="" class="img-small">
												</div>
											<div class="col-11">
												<input type="password" class="form-control " id="password"
													placeholder="Password" name="password">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-1"
												style="border-radius: 50%; border-color: gray;">
												
												</div>
											<div class="col-11">
												<div class="custom-control custom-checkbox small">
													<input type="checkbox" class="custom-control-input"
														name="remember" value="remember" id="customCheck">
													<label class="custom-control-label" for="customCheck">아이디
														기억하기</label>
												</div>
											</div>
										</div>
										<div class="form-group">
											<button class="btn btn-primary btn-block" type="submit"
												style="height: 50px">Login</button>
											<!-- <a class="btn btn-primary">로그인</a> -->
										</div>

									</form>
									<hr>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<c:import url="../temp/common_js.jsp"></c:import>
</body>
</html>