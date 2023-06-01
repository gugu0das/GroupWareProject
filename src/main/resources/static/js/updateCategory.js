let deptNameList = []
let deptIdList = []
$("#deptId option").map(function(){	
	deptIdList.push($(this).val());
	deptNameList.push($(this).text().trim());
	document.getElementById("hide").style.visibility ='hidden';
})


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
			inputHtml = '<select id="deptIdSelect" class="form-control">' +
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
					
					$('.btn').each(function(i,v){
						 $(v).hide();
					})
					
					approver.html(inputHtml);
				}
			})
		}
	})
})
$(document).on("change", "#deptIdSelect", function() {
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
				if(id.parent().children('#jobIdSelect') != null){
					id.parent().children('#jobIdSelect').remove();
				}
				id.after(inputHtml);
			},
			error : function(){
				alert("페이지 오류");
			}
		})
	}else{
		id.parent().children('#jobIdSelect').remove();
	}
});
$(document).on('click', '#updateApprover1', function(){
	let departmentId = $(this).parent().children('#deptIdSelect').val();
	let jobId = $(this).parent().children('#jobIdSelect').val();
	let approverCategoryId = $(this).parent().children('#approverCategoryId').val();
	let approverDepth = $(this).parent().children('#approverDepth').val();
	let departmentSelect = $('#deptIdSelect option:selected').text();
	let jobSelect = $('#jobIdSelect option:selected').text();
	let tempApproverDiv = $(this).parent();
	
	if(departmentId == '부서' || departmentId == null){
		alert('부서 번호를 확인하세요');
	}else{
		if(jobId == '직책' || jobId == null){
			alert('직책을 확인하세요');
		}else{
			updateApprover();
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
					'<span id="departmentId" data-department-id="'+ departmentId +'">'+ departmentSelect + '</span>&nbsp' + 
					'<span id="jobId" data-job-id="'+ jobId +'">' + jobSelect + '</span>&nbsp' + 
					'<button class="btn btn-primary" id="updateApprover">수정하기</button>&nbsp' + 
					'<button class="btn btn-danger" id="deleteApprover">삭제하기</button>';
					$('.btn').each(function(i,v){
						 $(v).show();
					})
					tempApproverDiv.html(inputHtml);
				}
			}
		})
	};
	
})


$(document).on('click', '#addApprover', function(){
	let categoryId = $(this).parent().parent().attr('id');
	let approverDepth = $(this).parent().children('#approver').last().attr('data-approver-depth')*1 + 1;
	let inputHtml = '<div id="approver" data-approver-depth="' + approverDepth + '">'
					+ '<select id="deptIdSelect" class="form-control">' 
					+ '<option value="부서" selected>부서</option>';
	for(let i = 0; i < deptIdList.length; i ++){
		inputHtml = inputHtml + '<option value="'+ deptIdList[i] +'">'+ deptNameList[i] +'</option>';
	}
	inputHtml = inputHtml
				+ '</select>&nbsp'
				+ '<input type="hidden" id="approverCategoryId" value="'+ categoryId +'">'
				+ '<input type="hidden" id="approverDepth" value="'+ approverDepth +'">';
	
	let hide = $(this).attr('data-hide');
	if( hide == 'yes'){
		$('.btn').each(function(i,v){
			$(v).hide();
		})
		inputHtml = inputHtml + '<button class="btn btn-primary" id="addApprover1">완료</button>';
	}else{
		inputHtml = inputHtml + '<button class="btn btn-danger" id="deleteApprover" data-btn-type="단순삭제">삭제하기</button>';
	}
	
	$(this).parent().append(inputHtml);
})

$(document).on('click', '#addApprover1', function(){
	let categoryId = $(this).parent().children('#approverCategoryId').val();
	let approverDepth = $(this).parent().children('#approverDepth').val();
	let departmentId = $(this).parent().children('#deptIdSelect').val();
	let jobId = $(this).parent().children('#jobIdSelect').val();
	let departmentSelect = $('#deptIdSelect option:selected').text();
	let jobSelect = $('#jobIdSelect option:selected').text();
	let temp = $(this);
	$.ajax({
		type:"POST",
		url:"/approval/addApprover",
		data :{
			categoryId : categoryId,
			departmentId : departmentId,
			jobId : jobId,
			depth : approverDepth
		},success : function(data){	
			if(data == 0){
				alert('오류');
			}else{
				alert('추가 성공');
				
				let inputHtml = 
					'<span id="departmentId" data-department-id="'+ departmentId +'">'+ departmentSelect + '</span>&nbsp' + 
					'<span id="jobId" data-job-id="'+ jobId +'">' + jobSelect + '</span>&nbsp' + 
					'<button class="btn btn-primary" id="updateApprover">수정하기</button>&nbsp' + 
					'<button class="btn btn-danger" id="deleteApprover">삭제하기</button>';
				
				temp.parent().html(inputHtml);
				$('.btn').each(function(i,v){
		 			$(v).show();
				})
			}
		}
	})
})

$(document).on('click', '#deleteApprover', function(){
	let length = $(this).parent().parent().children('#approver').length;
	let categoryId = $(this).parent().parent().parent().attr('id');
	let approverDepth = $(this).parent().attr('data-approver-depth');
	let lastDepth = $(this).parent().parent().children('#approver').last().attr('data-approver-depth');
	let departmentId = $(this).parent().children('#departmentId').attr('data-department-id');
	let jobId = $(this).parent().children('#jobId').attr('data-job-id');
	let temp = $(this).parent();
	let temp2 = $(this).parent().parent();

	if(length > 1){
		if($(this).attr('data-btn-type') != "단순삭제"){
			$.ajax({
				type:"POST",
				url:"/approval/deleteApprover",
				data :{
					categoryId : categoryId,
					departmentId : departmentId,
					jobId : jobId,
					depth : approverDepth
				},success : function(data){	
					if(data == 0){
						alert('오류');
					}else{
						alert('삭제 성공');
						
						temp.remove();
					}
				}
			})
		}else{
			temp.remove();
		}
		if(approverDepth < lastDepth){
			temp2.children('#approver').each(function(i,v){
				if($(v).attr('data-approver-depth') > approverDepth){
					$(v).attr('data-approver-depth', $(v).attr('data-approver-depth')*1 - 1);
				}
			})
		}
	}else{
		alert('결재자의 수는 최소 한명 이상이어야 합니다.');
	}
})

$(document).on('click', '#addUnderOption', function(){
	let inputHtml = '<tr>'
					+ '<td>'
					+ 	'하위 옵션'
					+ 	'<button class="btn btn-danger" id="addUnderOption1">추가 완료</button>'
					+ '</td>'
					+ '<td></td>'
					+ '<td><input type="text" id="categoryName"></td>'
					+ '<td><input type="file" id="fileId"></td>'
					+ '<td>'
					+ '<button class="btn btn-primary" id="addApprover" data-hide="no">추가하기</button>'
					+ '<div id="approver" data-approver-depth="1">'
					+ '<select id="deptIdSelect" class="form-control">' 
					+ '<option value="부서" selected>부서</option>';
	
	for(let i = 0; i < deptIdList.length; i ++){
		inputHtml = inputHtml + '<option value="'+ deptIdList[i] +'">'+ deptNameList[i] +'</option>';
	}
	
						
	inputHtml = inputHtml 	+ '</select>'
							+ '<button class="btn btn-danger" id="deleteApprover" data-btn-type="단순삭제">삭제하기</button>'
							+ '</div>'
							+ '</td>'
							+ '</tr>';
	$('.btn').each(function(i,v){
		 $(v).hide();
	})						
	
	$(this).parent().parent().parent().append(inputHtml);
})

$(document).on('click', '#deleteOption', function(){
	let id = $(this).parent().children('.span').text().trim();
	$.ajax({
		type : "POST",
		url:"/approval/deleteOption",
		data : {
			id : id
		},
		success : function(data){
			if(data == 0){
				alert('')
			}else{
				
			}
		}
	})
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
	 				+ '<input type="hidden" name="fileName" id="fileName" value="'+ existValue +'">'
	 				+ '<button id="changeFile" class="btn btn-primary" type="button">파일 변경</button>'
	 				+ '</form>';
	
	$('.btn').each(function(i,v){
		 $(v).hide();
	})
	
	$(this).parent().html(inputHtml);
})

$(document).on('click', '#changeFile', function(){
	let file = $(this).parent();
	let categoryId = $(this).parent().parent().parent().attr('id');
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
						let inputHtml = '<span>'+ formFile +'</span>'
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