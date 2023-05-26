let deptNameList = []
let deptIdList = []
$("#deptId option").map(function(){	
	deptIdList.push($(this).val());
	deptNameList.push($(this).text().trim());
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
				'<select id="jobId" class="form-control">'
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

$('#addCategoryOption').click(function(){
    
    let count = $(document).children().children().children().children().children('.upperOption').length + 1;
	
    let inputHtml = '<div class="row upperOption" id="upperOption' + count + '" data-upper-count="'+ count +'">' + 
		'<br/>' +
	    '<input type="text" name="upperName" id="upperName">' + 
	    '<button id="deleteUpperOption">DELETE UPPER OPTION</button>' +
		'<button id="addUnderOption">ADD UNDER OPTION</button>' + 
 		'<div class="underOption" id="underOption1" data-under-count="1">' + 
		'&nbsp &nbsp<input type="text" name="underName" id="underName">&nbsp' + 
		'<button id="deleteUnderOption">DELETE UNDER OPTION</button>' + 
		'<input type="file" name="fileId" id="fileId">&nbsp'+
		'<div id="approver" data-approver-count="1">' +
		'<select id="deptId" class="form-control">';
		
		for(let i = 0; i < deptNameList.length; i ++){
			if( i == 0 ){
				inputHtml = inputHtml + '<option value="부서" selected>부서</option>';
			}else{
				inputHtml = inputHtml + '<option value="'+ deptIdList[i] +'">'+ deptNameList[i] +'</option>';
			}
		}
	
	inputHtml = inputHtml +
		'</select>&nbsp' +
		'<button id="addApprover">ADD APPROVER</button>' +
		'<button id="deleteApprover">DELETE APPROVER</button>' +
		'</div>' + 
		'</div>' + 
		'</div>' + 
		'</div>';

    
    $('#main').append(inputHtml);
})

$(document).on("click", "#addUnderOption", function() {
    let underCount = $(this).parent().children(":last").attr('data-under-count')*1 + 1;
	if(isNaN(underCount)){
		$(this).parent().children('#fileId').remove();
		$(this).parent().children('#deptId').remove();
		$(this).parent().children('#jobId').remove();
		$(this).parent().children('#approver').remove();
		$(this).parent().children('#addApprover').remove();
		$(this).parent().children('#deleteApprover').remove();
		underCount = 1;
	}
    let inputHtml = '<div class="underOption" id="underOption' + underCount + '" data-under-count="' + underCount + '">' + 
		'&nbsp &nbsp<input type="text" name="underName" id="underName">&nbsp' + 
		'<button id="deleteUnderOption">DELETE UNDER OPTION</button>' + 
		'<input type="file" name="fileId" id="fileId">&nbsp' + 
		'<div id="approver" data-approver-count="1">' +
		'<select id="deptId" class="form-control">';
		
		for(let i = 0; i < deptNameList.length; i ++){
			if( i == 0 ){
				inputHtml = inputHtml + '<option value="부서" selected>부서</option>';
			}else{
				inputHtml = inputHtml + '<option value="'+ deptIdList[i] +'">'+ deptNameList[i] +'</option>';
			}
		}
		inputHtml = inputHtml +
		'</select>&nbsp' +
		'<button id="addApprover">ADD APPROVER</button>' +
		'<button id="deleteApprover">DELETE APPROVER</button>' +
		'</div>' + 
		'</div>';
	
	$(this).parent().append(inputHtml);
});

$(document).on("click", "#deleteUnderOption", function() {
    let optionCount = $(this).parent().parent().children('.underOption').length;
    console.log(optionCount);
    let deleteOptionCount = $(this).parent().attr('data-under-count');

	if( optionCount != 1 ){
		// 지우기전에 다음 자식들의 값을 -1 해준다.
		$(this).parent().parent().children('.underOption').each(function(i, v){
			if($(v).attr('data-under-count') > deleteOptionCount){
				$(v).attr('data-under-count', $(v).attr('data-under-count')*1 - 1);
			}
		})
		$(this).parent().remove();
	}else{
		let inputHtml = '&nbsp<input type="file" name="fileId" id="fileId">&nbsp' + 
		'<select id="deptId" class="form-control">';
		for(let i = 0; i < deptNameList.length; i ++){
			if( i == 0 ){
				inputHtml = inputHtml + '<option value="부서" selected>부서</option>';
			}else{
				inputHtml = inputHtml + '<option value="'+ deptIdList[i] +'">'+ deptNameList[i] +'</option>';
			}
		}
		inputHtml = inputHtml +
		'</select>&nbsp' +
		'<button id="addApprover">ADD APPROVER</button>&nbsp' + 
		'<button id="deleteApprover">DELETE APPROVER</button>';
		console.log($(this).parent().parent().children('#upperName').after(inputHtml));
		$(this).parent().remove();
		
	}
});

$(document).on("click", "#deleteUpperOption", function() {
    let optionCount = $(this).parent().parent().children('.upperOption').length;
    let deleteOptionCount = $(this).parent().attr('data-upper-count');
	if(optionCount != 1){
		if( optionCount != deleteOptionCount ){
		// 지우기전에 다음 자식들의 값을 -1 해준다.
			$(this).parent().parent().children('.upperOption').each(function(i, v){
				if($(v).attr('data-upper-count') > deleteOptionCount){
					$(v).attr('data-upper-count', $(v).attr('data-upper-count')*1 - 1);
				}
			})
			$(this).parent().remove();
		}else{
			$(this).parent().remove();
		}	
	}else{
		alert("옵션은 한개이상 존재해야합니다.");
	}
});



let duplication = false;
//파일 중복 체크 따로 만들기
$('#btn').click(function(){
	
	let upperOptionCount = $(this).parent().parent().children('.upperOption').length;
	let jsonArr = [];
	let result = true;
	let checkUpperName = '';
	let checkUnderName = ''
	let checkFileId = '';

	let checkDept = '';
	let checkJob = '';

	$('#upperName').each(function(i,v){
		if($(v).val() == ''){
			result = false;
			checkUpperName = '상위 카테고리 이름';
		}
	});
	
	$('#underName').each(function(i,v){
		if($(v).val() == ''){
			result = false;
			checkUnderName = '하위 카테고리 이름';
		}
	});
	
	$('#fileId').each(function(i,v){
		if($(v).val() == ''){
			result = false;
			checkFileId = '파일 이름';
		}
	});
	
	$('#deptId').each(function(i,v){
		if($(v).val() == '부서'){
			result = false;
			checkDept = '부서';
		}
	});
	
	$('#jobId').each(function(i,v){
		if($(v).val() == '직책'){
			result = false;
			checkJob = '직책';
		}
	});
	
	
	let name = [];
	let formFile = []
	$('#upperName').each(function(i,v){
		name.push($(v).val());
	})
	$('#underName').each(function(i,v){
		name.push($(v).val());
	})
	$('#fileId').each(function(i,v){
		formFile.push($(v).val().split('\\').pop());
	})
	
	let categoryCheck = false;
	for(let i = 0; i < name.length; i ++){
		for(let j = i+1; j < name.length; j ++){
			if(name[i] == name[j]){
				alert('중복된 카테고리 명이 있습니다.');
				categoryCheck = true;
				return;
			}
		}
	}
	console.log(categoryCheck);
	if(categoryCheck){
		
	}else{
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
					formFileName = data;
				}
				
				if(duplication == true){
					let text = "";
					for(let i = 0; i < formFileName.length; i++){
						if(i == 0){
							text = text + formFileName[i];	
						}else{
							text = text + ', ' + formFileName[i];
						}
					}
					alert('다음 파일 이름이 중복입니다. \n' + text);
				}else{
					$.ajax({
						type : "POST",
						url : "/approval/categoryDuplication",
						traditional:true,
						data : {
							name : name
						},
						success : function(data){
							console.log(data);
							if(data.length == 0){				
								duplication = false;
							}else{
								duplication = true;
								name = data;
							}
							if(duplication == true){
								let text = "";
								for(let i = 0; i < name.length; i++){
									if(i == 0){
										text = text + name[i];	
									}else{
										text = text + ', ' + name[i];
									}
								}
								alert('다음 카테고리 이름이 중복입니다. \n' + text);
							}else{
								if(result == false){
									let text = '';
									if(!checkUpperName == ''){
										text = checkUpperName;		
									}
									if(!checkUnderName == ''){
										if(text != ''){
											text = text + ', ' + checkUnderName;
										}else{
											text = checkUnderName;		
										}
									}
									if(!checkFileId == ''){
										if(text != ''){
											text = text + ', ' + checkFileId;
										}else{
											text = checkFileId;		
										}
									}
									if(!checkDept == ''){
										if(text != ''){
											text = text + ', ' + checkDept;
										}else{
											text = checkDept;		
										}
									}
									if(!checkJob == ''){
										if(text != ''){
											text = text + ', ' + checkJob;
										}else{
											text = checkJob;		
										}
									}
									alert(text + '설정을 완료 해 주십시오.');
								}else{
									for(let i = 0; i < upperOptionCount+1; i ++){
										let json1 = {};
										$('.upperOption').each(function(i,v){
											
											if($(v).children('.underOption').length == 0){
												let approver = [];
												let file = [];
												let approverObject = {
													"jobId" : $(v).children('#jobId').val(),
													"departmentId" : $(v).children('#deptId').val()
												};
												let fileObject = {
													"fileName" : $(v).children('#fileId').val().split('\\').pop()
												};
												approver.push(approverObject);
												file.push(fileObject);
												if($(v).children('#approver') != null){
													$(v).children('#approver').each(function(i2,v2){
														let approverObject = {
														"jobId" : $(v2).children('#jobId').val(),
														"departmentId" : $(v2).children('#deptId').val()
														};
														approver.push(approverObject);
													})
												}
												json1 = {
													"name" : $(v).children('#upperName').val(),
													"approver" : approver,
													"file" : file
												};
											}else {
												let json1Arr = [];
								
												$(v).children('.underOption').each(function(i2,v2){
													let approver = [];
													let file = [];
													$(v2).children('#approver').each(function(i3, v3){
														
														let approverObject = {
															"jobId" : $(v3).children('#jobId').val(),
															"departmentId" : $(v3).children('#deptId').val()
														};
														approver.push(approverObject);
													})
													
													let fileObject = {
														"fileName" : $(v2).children('#fileId').val().split('\\').pop()
													}
													file.push(fileObject);
													let json2 = {
														"name" : $(v2).children('#underName').val(),
														"approver" : approver,
														"file" : file
													};
													
													json1Arr.push(json2);
												})
												
												json1 = {
													"name" : $(v).children('#upperName').val(),
													"sub" : json1Arr
												}
											}
											jsonArr.push(json1);
										})
										
									}
									console.log(jsonArr);
								
								    $("#json1").val(JSON.stringify(jsonArr));
								    
									$('#frm').submit();
								}
							}
							
						}
					})
				}
			}
		})
	}
})
