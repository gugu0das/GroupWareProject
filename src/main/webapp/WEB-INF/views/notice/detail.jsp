<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Modern Business - Start Bootstrap Template</title>
<link rel="stylesheet" href="/css/noticeDesign.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<c:import url="../temp/header.jsp"></c:import>
<c:import url="../temp/style.jsp"></c:import>
</head>
<body id="bg-gradient-primary">
<div id="wrapper">
		<!-- sideBar -->
		
		<c:choose>
			<c:when test="${id != 'admin'}">
				<c:import url="../temp/sidebar.jsp"></c:import>
			</c:when>
			<c:when test="${id == 'admin'}">
				<c:import url="../temp/adminSidebar.jsp"></c:import>
			</c:when>
		</c:choose>
		
		<!-- sideBar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!--top bar  -->
				<c:choose>
					<c:when test="${id == 'admin'}">
						<c:import url="../temp/adminTopbar.jsp"></c:import>
					</c:when>
					<c:otherwise>
						<c:import url="../temp/topbar.jsp"></c:import>
					</c:otherwise>

				</c:choose>
		<!-- sideBar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
	

  
   	
       						
        							
        						

    <div class="notice-container">
    <div><a href="./list">공지사항</a></div>
	 <h1 class="notice-title" style="font-size: 50px; margin-top: 50px;">${noticeVO.title}</h1>
	 <div class="notice-writer">작성자: ${noticeVO.writer}</div>
	 <div class="notice-date">작성일: ${noticeVO.regDate}</div>
	</div>
    <div class="notice-container">
					<div class="dropdown" style="float: right">
						<a class="dropdown-toggle" href="#" id="fileDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-600 small">첨부파일</span>

						</a>
						<div class="dropdown-menu shadow animated--grow-in"
							aria-labelledby="fileDropdown">

							<c:forEach items="${noticeVO.boardFileVOs}" var="boardFileVO">

								<a class="dropdown-item" href="./fileDown?id=${boardFileVO.id}">${boardFileVO.oriName}<svg
										xmlns="http://www.w3.org/2000/svg" width="22" height="22"
										viewBox="-4 -4 22 22" y="86">
										<g fill="#999" fill-rule="evenodd">
										<path d="M5.6 0h2.8v14H5.6z" />
										<path d="M0 5.6h14v2.8H0z" /></g></svg></a>

							</c:forEach>

						</div>
					</div>
					<div class="notice-contents">${noticeVO.contents}</div>
				</div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                   
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2"></div>
                                    <!-- Post categories-->
                                    
                                </header>
                                <!-- Preview image figure-->
                               
                                <!-- Post content-->
                                <div class="mb-5">
                                     
                                    <%--  <c:forEach items="${noticeVO.boardFileVOs}" var="boardFileVO">
                                    	<c:if test="${boardFileVO ne null}">	
                                    	<img alt="2" src="/file/notice/${boardFileVO.fileName}">
                                    	<div>클릭시 다운로드 가능 : 
                                    	<a href="./fileDown?id=${boardFileVO.id}">${boardFileVO.oriName}</a></div>
                                    	</c:if>
                                    </c:forEach> --%>
                                 
                                    
                                </div>
                            </article>
                            <div class="text-center"">
                          	<c:if test="${memberVO.id eq noticeVO.memberId or id == 'admin'}">
                            <button type="button" class="btn btn-outline-danger" id="dele" data-list-dele="${noticeVO.id}"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
											viewBox="-4 -4 20 20" x="60" y="86">
											<path fill="none" stroke="#D3D3D3"
												d="M9.6 2.4L2.4 9.6m-.044-7.244L9.6 9.6" /></svg>삭제</button>
							</c:if>
							<c:if test="${memberVO.id eq noticeVO.memberId}">
                            <a id="update" class="btn btn-outline-primary" href="./update?id=${noticeVO.id}"><svg
											xmlns="http://www.w3.org/2000/svg" width="18" height="18"
											viewBox="-4 -4 18 18" x="37" y="108">
											<defs>
											<path id="g" d="M12 12V0H0v12h12z" /></defs>
											<g fill="none" fill-rule="evenodd" opacity=".9"
												transform="translate(-1 -1)">
											<mask id="h" fill="#fff">
											<use xmlns:xlink="http://www.w3.org/1999/xlink"
												xlink:href="#g" /></mask>
											<path fill="#A3A9A9"
												d="M9.82 6.49c.02-.16.036-.32.036-.49 0-.17-.015-.33-.036-.49l1.085-.825a.248.248 0 0 0 .062-.32l-1.028-1.73a.262.262 0 0 0-.314-.11l-1.28.5a3.782 3.782 0 0 0-.869-.49L7.281 1.21A.249.249 0 0 0 7.03 1H4.973a.249.249 0 0 0-.252.21l-.195 1.325a3.977 3.977 0 0 0-.869.49l-1.28-.5a.254.254 0 0 0-.313.11l-1.028 1.73a.242.242 0 0 0 .061.32l1.085.825c-.02.16-.036.325-.036.49 0 .165.015.33.036.49l-1.085.825a.248.248 0 0 0-.061.32l1.028 1.73c.061.11.2.15.313.11l1.28-.5c.267.2.555.365.869.49l.195 1.325a.25.25 0 0 0 .252.21H7.03c.129 0 .237-.09.252-.21l.195-1.325c.314-.125.602-.295.87-.49l1.279.5c.118.045.252 0 .314-.11l1.028-1.73a.248.248 0 0 0-.062-.32L9.82 6.49zM6.001 7.75c-.992 0-1.799-.785-1.799-1.75s.807-1.75 1.8-1.75c.99 0 1.798.785 1.798 1.75s-.807 1.75-1.799 1.75z"
												mask="url(#h)" /></g></svg>수정</a>
                            </c:if>
                       		<button id="list" type="button" class="btn btn-outline-secondary"><a href="./list"><svg xmlns="http://www.w3.org/2000/svg"
											width="18" height="18" viewBox="-4 -4 18 18" x="55" y="108">
											<path fill="#A3A9A9" fill-rule="evenodd"
												d="M2 2h6v1H2V2zm0 2h6v1H2V4zm0 2h3v1H2V6zm-2 4h10V0H0v10z" /></svg>목록</a></button>
                       		</div>
                        </div>
                        
                    </div>
                </div>
              </div>
           </div>
                </div>


	
	<!-- Footer -->
 <script src="/js/noticeImportant.js"></script>
 <c:import url="../temp/logoutModal.jsp"></c:import>
 <c:import url="../temp/common_js.jsp"></c:import>
    <!-- Footer -->
</body>
</html>
