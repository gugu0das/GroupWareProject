$(document).on('click', '#updateApprover', function(){
	let approver = $(this).parent();
	let categoryId = $(this).parent().parent().parent().attr('id');
	let existDepartmentId = $(this).parent().children('#departmentId').attr('data-department-id');
	let existJobId = $(this).parent().children('#jobId').attr('data-job-id');
	let existDepartmentName = $(this).parent().children('#departmentId').text();
	let existJobName = $(this).parent().children('#jobId').text();
	let approverDepth = $(this).parent().attr('data-approver-depth')
	let inputHtml = '';
	$.ajax({
		type : "POST",
		url : "/approval/getDepartmentList",
		data : {
			
		},
		success : function(data){
			inputHtml = '<select id="deptId" class="form-control">' +
							'<option value="부서">부서</option>';
			for(let i = 0; i < data.length; i ++){
				if(data[i].id == existDepartmentId){
					inputHtml = inputHtml + '<option value="'+ data[i].id +'" selected>'+ data[i].name +'</option>';
				}else{
					inputHtml = inputHtml + '<option value="'+ data[i].id +'">'+ data[i].name +'</option>';
				}
				
			}
			inputHtml = inputHtml + '</select>&nbsp';
			$.ajax({
				type : "POST",
				url : "/approval/getJobList",
				data : {
					id : existDepartmentId
				},
				success : function(data){
					inputHtml = inputHtml + '<select id="jobIdSelect" class="form-control">' +
									'<option value="직책">직책</option>';
					for(let i = 0; i < data.length; i ++){
						if(data[i].id == existJobId){
							inputHtml = inputHtml + '<option value="'+ data[i].id +'" selected>'+ data[i].name +'</option>';
						}else{
							inputHtml = inputHtml + '<option value="'+ data[i].id +'">'+ data[i].name +'</option>';
						}
					}
					inputHtml = inputHtml
								+ '</select>&nbsp'
								+ '<input type="hidden" id="approverCategoryId" value="'+ categoryId +'">'
								+ '<input type="hidden" id="approverDepth" value="'+ approverDepth +'">'
								+ '<button class="btn btn-danger" id="updateApprover1">수정하기</button>';
					approver.html(inputHtml);
				}
			})
		}
	})
})
$(document).on("change", "#deptId", function() {
    let id = $(this);
    let inputHtml = '';
    if(id.val() !== '부서'){
	    $.ajax({
			type: "POST", //"GET", "POST"
			url : "/approval/getJobList",
			data:{
				id : id.val()
			},
			success : function(data){
				console.log(data[Object.keys(data)[0]]);
				let val = data[Object.keys(data)[0]];
				console.log(val['id']);
				inputHtml = 
				'<select id="jobIdSelect" class="form-control">'
				+ '<option value="직책" selected>직책</option>';
				
				for(let i = 0; i < data.length; i ++){
						inputHtml = inputHtml + '<option value="'+ data[Object.keys(data)[i]]['id'] +'">'+ data[Object.keys(data)[i]]['name'] +'</option>';
				}
				inputHtml = inputHtml + '</select>'
				if(id.parent().children('#jobId') != null){
					id.parent().children('#jobId').remove();
				}
				id.after(inputHtml);
			},
			error : function(){
				alert("페이지 오류");
			}
		})
	}else{
		id.parent().children('#jobId').remove();
	}
});
$(document).on('click', '#updateApprover1', function(){
	let departmentId = $(this).parent().children('#deptIdSelect').val();
	let jobId = $(this).parent().children('#jobIdSelect').val();
	let approverCategoryId = $(this).parent().children('#approverCategoryId').val();
	let approverDepth = $(this).parent().children('#approverDepth').val();
	let departmentSelect = $('#deptIdSelect option:selected').text();
	let jobSelect = $('#jobIdSelect option:selected').text();
	
	if(departmentId == '부서' || departmentId == null){
		alert('부서 번호를 확인하세요');
	}else{
		if(jobId == '직책' || jobId == null){
			alert('직책을 확인하세요');
		}else{
			//updateApprover();
		}
	}

	function updateApprover (){
		$.ajax({
			type:"POST",
			url:"/approval/updateApprover",
			data :{
				categoryId : approverCategoryId,
				departmentId : departmentId,
				jobId : jobId,
				depth : approverDepth
			},
			success : function(data){
				if(data == 0){
					alert('수정 실패');
				}else{
					alert('수정 성공');
					let inputHtml = 
					'<span id="departmentId" data-department-id="'+ departmentId +'">'+ departmentSelect + '</span>' + 
					'<span id="jobId" data-job-id="'+ jobId +'">' + jobSelect + '</span>' + 
					'<button class="btn btn-primary" id="updateApprover">수정하기</button>' + 
					'<button class="btn btn-danger" id="deleteApprover">삭제하기</button>';
				}
			}
		})
	};
	
})

$(document).on('click', '#deleteApprover', function(){
	
})

$(document).on('click', '#deleteOption', function(){
	
})

$(document).on('click', '#updateOptionName', function(){
	let existValue = $(this).parent().children('span').text();
	let categoryOptionId = $(this).parent().prev().children('span').text();
	console.log(categoryOptionId);
	let inputHtml = '<input type="text" id="categoryName" value="'+ existValue +'">'
					+ '<input type="hidden" name="categoryId" id="categoryId" value="'+ categoryOptionId +'">'
					+ '&nbsp<button id="changeOptionName" class="btn btn-primary" type="button">옵션 변경</button>'
					;
	$('.btn').each(function(i,v){
		 $(v).hide();
	})
	
	$(this).parent().html(inputHtml);
})

$(document).on('click', '#changeOptionName', function(){
	//수정 경고를 한번 해야하나??
	let text = $('#categoryName').val();
	let id = $('#categoryId').val();
	let tempParent = $(this).parent();
	
	$.ajax({
		type : "POST",
		url : "/approval/categoryDuplication",
		data : {
			name : text
		},
		success : function(data){
			if(data.length != 0){
				alert('중복된 카테고리명이 있습니다.')
			}else{
				$.ajax({
					type: "POST",
					url : "/approval/updateCategoryName",
					data : {
						id : id,
						name : text
					},
					success : function(data){
						alert(data);
						$('.btn').each(function(i,v){
							$(v).show();
						})
						let inputHtml = '<span>'+ text +'</span>'
										+ '&nbsp<button class="btn btn-primary" id="updateOptionName">수정하기</button>';
						tempParent.html(inputHtml);
					}
					
				})
			}
		}
	})
	
	/*
	
	*/
})

$(document).on('click', '#updateFile', function(){
	console.log($(this).parent().children('span').text());
	let existValue = $(this).parent().children('span').text();
	let inputHtml = '<form id="uploadForm" enctype="multipart/form-data" method="post">'
					+ '<input type="file" name="file" id="oriName">'
	 				+ '<input type="hidden" name="fileId" id="fileId" value="'+ existValue +'">'
	 				+ '<button id="changeFile" class="btn btn-primary" type="button">파일 변경</button>'
	 				+ '</form>';
	
	$('.btn').each(function(i,v){
		 $(v).hide();
	})
	
	$(this).parent().html(inputHtml);
})

$(document).on('click', '#changeFile', function(){
	let existId = $(this).parent().children('#fileId').val();
	let file = $(this).parent();
	let formFile = $(this).parent().children('#oriName').val().split('\\').pop();
	let tempParent = $(this).parent().parent();
	let fileData = new FormData(file[0]);
	$.ajax({
		type: "POST",
		url : "/approval/formFileDuplication",
		traditional: true,
		data : {
			formFileName : formFile
		},
		success : function(data){
			if(data.length == 0){
				duplication = false;
			}else{
				duplication = true;
			}
			if(duplication){
				alert('중복된 파일명입니다.');
			}else{
				$.ajax({
					type : "post",
					url : "/approval/updateFormFile",
					data : fileData,
					contentType : false,
			        processData : false,
			        success : function(data){
						alert(data);
						let inputHtml = '<span>'+ existId +'</span>'
									 	+ '&nbsp<button class="btn btn-primary" id="updateFile">수정하기</button>'
						$('.btn').each(function(i,v){
							 $(v).show();
						})
						tempParent.html(inputHtml);
					}
				})
			}
		}
	})	
})