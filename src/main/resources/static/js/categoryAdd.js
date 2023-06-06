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
				'<select id="jobId" class="jobId form-control">'
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

    let count = $('.table').children('tbody').children('.upperOption').length + 1;
	
    let inputHtml = '<tr class="upperOption" data-count="'+ count +'">' +
					'<td class="text-center my-auto">상위 옵션</td>' +
					'<td>' +
					'<input class="upperName" type="text" name="upperName" id="upperName">' +
					'<button type="button" id="deleteUpperOption" class="btn btn-danger">상위옵션 삭제</button>' +
					'<button type="button" id="addUnderOption" class="btn btn-primary">하위옵션 추가</button>' +
					'</td>' +
					'</tr>' +
					'<tr class="underOption" data-count="'+ count +'">' +
					'<td class="text-center my-auto">하위 옵션</td>' +
					'<td>' +
					'<input class="underName" type="text" name="underName" id="underName">' +
					'<button type="button" id="deleteUnderOption" class="btn btn-danger">하위옵션 삭제</button>' +
					'</td>' +
					'<td>' +
					'<input class="fileId" type="file" name="fileId" id="fileId">' +
					'</td>' +
					'<td>' +
					'<div id="approver" data-approver-count="1">' +
					'<select id="deptId" class="deptId form-control">';
								
	for(let i = 0; i < deptNameList.length; i ++){
		if( i == 0 ){
			inputHtml = inputHtml + '<option value="부서" selected>부서</option>';
		}else{
			inputHtml = inputHtml + '<option value="'+ deptIdList[i] +'">'+ deptNameList[i] +'</option>';
		}
	}

	inputHtml = inputHtml + '</select>'	
						 	+ '<button type="button" id="addApprover" class="btn btn-primary">결재자 추가</button>'
							+ '<button type="button" id="deleteApprover" class="btn btn-danger">결재자 삭제</button>'
							+ '</div>'
							+ '</td>'
							+ '</tr>';
    	
    	/*'<div class="row upperOption" id="upperOption' + count + '" data-upper-count="'+ count +'">' + 
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
		'<button id="addApprover" class="btn btn-primary">결재자 추가</button>' +
		'<button id="deleteApprover" class="btn btn-danger">결재자 삭제</button>' +
		'</div>' + 
		'</div>' + 
		'</div>' + 
		'</div>';*/

    
    $('tbody').append(inputHtml);
})

$(document).on("click", "#addUnderOption", function() {
	let upperCount = $(this).parent().parent().attr('data-count');
    let underCount = 0;
    $('.underOption').each(function(i,v){
		if($(v).attr('data-count') == upperCount){
			underCount ++;
		}
	})
	if(underCount == 0){
		$(this).parent().parent().children('td').each(function(i,v){
			$(v).children('#fileId').parent().remove();
			$(v).children('#deptId').parent().remove();
			$(v).children('#jobId').parent().remove();
			$(v).children('#approver').parent().remove();
			$(v).children('#addApprover').parent().remove();
			$(v).children('#deleteApprover').parent().remove();
		})
	}
    let inputHtml = '<tr class="underOption" data-count="'+ upperCount +'">' +
					'<td class="text-center my-auto">하위 옵션</td>' +
					'<td>' +
					'<input class="underName" type="text" name="underName" id="underName">' +
					'<button type="button" id="deleteUnderOption" class="btn btn-danger">하위옵션 삭제</button>' +
					'</td>' +
					'<td>' +
					'<input class="fileId" type="file" name="fileId" id="fileId">' +
					'</td>' +
					'<td>' +
					'<div id="approver" data-approver-count="1">' +
					'<select id="deptId" class="deptId form-control">';
								
	for(let i = 0; i < deptNameList.length; i ++){
		if( i == 0 ){
			inputHtml = inputHtml + '<option value="부서" selected>부서</option>';
		}else{
			inputHtml = inputHtml + '<option value="'+ deptIdList[i] +'">'+ deptNameList[i] +'</option>';
		}
	}

	inputHtml = inputHtml + '</select>'	
						 	+ '<button type="button" id="addApprover" class="btn btn-primary">결재자 추가</button>'
							+ '<button type="button" id="deleteApprover" class="btn btn-danger">결재자 삭제</button>'
							+ '</div>'
							+ '</td>'
							+ '</tr>';

	$(this).parent().parent().parent().children('.underOption[data-count='+ upperCount +']').last().after(inputHtml);
	if($(this).parent().parent().parent().children('.underOption[data-count='+ upperCount +']').length == 0){
		$(this).parent().parent().parent().children('.upperOption[data-count='+ upperCount +']').after(inputHtml);
	}
});

$(document).on("click", "#deleteUnderOption", function() {
	let dataCount = $(this).parent().parent().attr('data-count');
	
    let optionCount = $(this).parent().parent().parent().children('.underOption[data-count='+ dataCount +']').length;

	if( optionCount != 1 ){
		$(this).parent().parent().remove();
	}else{
		let inputHtml = '<td>' +
						'<input class="fileId" type="file" name="fileId" id="fileId">' +
						'</td>' +
						'<td>' +
						'<div id="approver" data-approver-count="1">' +
						'<select id="deptId" class="deptId form-control">';
						for(let i = 0; i < deptNameList.length; i ++){
							if( i == 0 ){
								inputHtml = inputHtml + '<option value="부서" selected>부서</option>';
							}else{
								inputHtml = inputHtml + '<option value="'+ deptIdList[i] +'">'+ deptNameList[i] +'</option>';
							}
						}

		inputHtml = inputHtml + '</select>' +
								'<button type="button" id="addApprover" class="btn btn-primary">결재자 추가</button>' +
								'<button type="button" id="deleteApprover" class="btn btn-danger">결재자 삭제</button>' +
								'</div>' +
								'</td>';
		
		
		$(this).parent().parent().parent().children('.upperOption[data-count='+ dataCount +']').append(inputHtml);
		
		$(this).parent().parent().remove();
		
	}
});

$(document).on("click", "#deleteUpperOption", function() {
    let optionCount = $(this).parent().parent().parent().children('.upperOption').length;
	if(optionCount != 1){
		$(this).parent().remove();
	}else{
		alert("옵션은 한개이상 존재해야합니다.");
	}
});



let duplication = false;
//파일 중복 체크 따로 만들기
$(document).on("click", "#submitBtn", function() {
	let upperOptionCount = $('.table').children('tbody').children('.upperOption').length;
	let jsonArr = [];
	let result = true;
	let checkUpperName = '';
	let checkUnderName = ''
	let checkFileId = '';

	let checkDept = '';
	let checkJob = '';

	$('.upperName').each(function(i,v){
		if($(v).val() == ''){
			result = false;
			checkUpperName = '상위 카테고리 이름';
		}
	});
	
	$('.underName').each(function(i,v){
		if($(v).val() == ''){
			result = false;
			checkUnderName = '하위 카테고리 이름';
		}
	});
	
	$('.fileId').each(function(i,v){
		if($(v).val() == ''){
			result = false;
			checkFileId = '파일 이름';
		}
	});
	
	$('.deptId').each(function(i,v){
		if($(v).val() == '부서'){
			result = false;
			checkDept = '부서';
		}
	});
	
	$('.jobId').each(function(i,v){
		if($(v).val() == '직책'){
			result = false;
			checkJob = '직책';
		}
	});
	
	
	let name = [];
	let formFile = []
	$('.upperName').each(function(i,v){
		name.push($(v).val());
	})
	$('.underName').each(function(i,v){
		name.push($(v).val());
	})
	$('.fileId').each(function(i,v){
		formFile.push($(v).val().split('\\').pop());
	})
	
	
	let categoryCheck = false;

	for(let i = 0; i < name.length; i ++){
		if(name[i] != ''){
			for(let j = i+1; j < name.length; j ++){
				if(name[i] == name[j]){
					categoryCheck = true;
					break;
				}
			}
		}		
	}

	
	console.log(categoryCheck)
	
	let fileCheck = false;
	for(let i = 0; i < formFile.length; i ++){
		if(formFile[i] != ''){
			for(let j = i+1; j < formFile.length; j ++){
				if(formFile[i] == formFile[j]){
					fileCheck = true;
					break;
				}
			}
		}	
	}
	
	if(categoryCheck || fileCheck){
		let text = '';
		if(categoryCheck && !fileCheck){
			text = '카테고리 명';
		}else if(fileCheck && !categoryCheck){
			text = '파일 명';
		}else{
			text = '카테고리 명과 파일명'
		}
		
		let text2 = '중복된 ' + text + '이 있습니다.';
		
		alert(text2);
		
	}else if(!categoryCheck && !fileCheck){
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
					
					
					let result = confirm('다음 파일 이름이 중복입니다. \n' + text);
					
					if(result){
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
										for(let i = 1; i < upperOptionCount+1; i ++){
	
											let json1 = {};
											
											if($('.underOption[data-count='+ i +']').length == 0){
												let approver = [];
												let file = [];
												let fileObject = {};
												let name = '';
												$('.upperOption[data-count='+ i +']').children().each(function(i2,v){
													if($(v).children('#upperName').length != 0){
														name = $(v).children('#upperName').val();
													}
													
													if($(v).children('#fileId').length != 0){
														fileObject = {
															"fileName" : $(v).children('#fileId').val().split('\\').pop()
														};
														file.push(fileObject);
													}
	
													if($(v).children('#approver').length != 0){
														$(v).children('#approver').each(function(i2,v2){
															let approverObject = {
															"jobId" : $(v2).children('#jobId').val(),
															"departmentId" : $(v2).children('#deptId').val()
															};
															approver.push(approverObject);
														})
													}
												})
												
												json1 = {
													"name" : name,
													"approver" : approver,
													"file" : file
												};
											}else{
												let json1Arr = [];
												let approver = [];
												let file = [];
												let upperName = '';
												let underName = '';
												$('.upperOption[data-count='+ i +']').children().each(function(i2,v){
													if($(v).children('#upperName').length != 0){
														upperName = $(v).children('#upperName').val();
													}
												})
												
												$('.underOption[data-count='+ i +']').children().each(function(i2,v){
													if($(v).children('#approver').length != 0){
														$(v).children('#approver').each(function(i3,v2){
															let approverObject = {
																"jobId" : $(v2).children('#jobId').val(),
																"departmentId" : $(v2).children('#deptId').val()
															};
															approver.push(approverObject);
														})
													}else if($(v).children('#fileId').length != 0){
														let fileObject = {
															"fileName" : $(v).children('#fileId').val().split('\\').pop()
														}
														file.push(fileObject);
													}else if($(v).children('#underName').length != 0){
														underName = $(v).children('#underName').val();
													}
												})
												let json2 = {
													"name" : underName,
													"approver" : approver,
													"file" : file
												};
												json1Arr.push(json2);
	
												json1 = {
													"name" : upperName,
													"sub" : json1Arr
												}
											}
											jsonArr.push(json1);
										}
										console.log(jsonArr);
									
									    $("#json1").val(JSON.stringify(jsonArr));
									    
										$('#frm').submit();
									}
								}
							}
						})
					}
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
									for(let i = 1; i < upperOptionCount+1; i ++){

										let json1 = {};
										
										if($('.underOption[data-count='+ i +']').length == 0){
											let approver = [];
											let file = [];
											let fileObject = {};
											let name = '';
											$('.upperOption[data-count='+ i +']').children().each(function(i2,v){
												if($(v).children('#upperName').length != 0){
													name = $(v).children('#upperName').val();
												}
												
												if($(v).children('#fileId').length != 0){
													fileObject = {
														"fileName" : $(v).children('#fileId').val().split('\\').pop()
													};
													file.push(fileObject);
												}

												if($(v).children('#approver').length != 0){
													$(v).children('#approver').each(function(i2,v2){
														let approverObject = {
														"jobId" : $(v2).children('#jobId').val(),
														"departmentId" : $(v2).children('#deptId').val()
														};
														approver.push(approverObject);
													})
												}
											})
											
											json1 = {
												"name" : name,
												"approver" : approver,
												"file" : file
											};
										}else{
											let json1Arr = [];
											let approver = [];
											let file = [];
											let upperName = '';
											let underName = '';
											$('.upperOption[data-count='+ i +']').children().each(function(i2,v){
												if($(v).children('#upperName').length != 0){
													upperName = $(v).children('#upperName').val();
												}
											})
											
											$('.underOption[data-count='+ i +']').children().each(function(i2,v){
												if($(v).children('#approver').length != 0){
													$(v).children('#approver').each(function(i3,v2){
														let approverObject = {
															"jobId" : $(v2).children('#jobId').val(),
															"departmentId" : $(v2).children('#deptId').val()
														};
														approver.push(approverObject);
													})
												}else if($(v).children('#fileId').length != 0){
													let fileObject = {
														"fileName" : $(v).children('#fileId').val().split('\\').pop()
													}
													file.push(fileObject);
												}else if($(v).children('#underName').length != 0){
													underName = $(v).children('#underName').val();
												}
											})
											let json2 = {
												"name" : underName,
												"approver" : approver,
												"file" : file
											};
											json1Arr.push(json2);

											json1 = {
												"name" : upperName,
												"sub" : json1Arr
											}
										}
										jsonArr.push(json1);
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



