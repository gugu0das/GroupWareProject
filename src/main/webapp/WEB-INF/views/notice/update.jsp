<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
 
</head>
<body>


	<header style="margin-top: 200px;">
		<div class="container-fluid">
			<div class="row justify-content-center my-4">
				<h1 class="col-md-7 text-center">공지사항 글 업데이트</h1>
			</div>
		
		 	<div class="row justify-content-center my-4">
		
				<form class="col-md-7" action="./update" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${noticeVO.id}">
					
					<div class="mb-3">
						<label for="title" class="form-label">제목</label>
			 			<input class="form-control" type="text" name="title" value="${noticeVO.title}"  id="title" placeholder="변경할 제품명 입력">
			 		</div>
			 		<div class="mb-3">
			 			<label for="writer" class="form-label">작성자</label>
						<input class="form-control" type="text" name="writer" value="${noticeVO.writer}" id="writer" placeholder="변경할 가격 입력">
					</div>
					<div class="mb-3">
						<label for="contents" class="form-label">내용</label>
						<textarea  name="contents" class="form-control" id="contents" placeholder="설명 입력" rows="7">${noticeVO.contents}</textarea>
					</div>

					<%-- <div id="fileList">
						<a class="btn" id="fileAdd">첨부파일</a>
						<c:forEach items="${dto.productImgDTOs}" var="fileDTO">
							<div class="input-group mb-3 my-3">
								<div class="input-group-text">
									<input class="form-check-input mt-0 deleteCheck" type="checkbox" name="fileNum" value="${fileDTO.fileNum}" aria-label="Checkbox for following text input">
								</div>
								<input type="text" disabled value="${fileDTO.upLoad}" class="form-control" aria-label="Text input with checkbox">
							</div>
						</c:forEach>	
					</div> --%>
				
					<!-- <div class="mb-3" id="fileList">
						
					</div> -->
	
					<div class="mb-3">
						<input class="btn btn-info" type="submit" value="수정">
					</div>
				</form>
			</div>	
		</div>
	</header>
	

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
	

	$("#contents").summernote();
</script>			
</body>
</html>