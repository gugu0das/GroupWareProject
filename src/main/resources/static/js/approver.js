$(document).on('click', '#addApprover', function(){
	let underCount = $(this).parent().parent().children(":last").attr('data-approver-count')*1 + 1;
	let inputHtml = 
		'<div id="approver" data-approver-count="'+ underCount +'">' +
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
		'<button id="deleteApprover">DELETE APPROVER</button>';
	if($(this).parent().attr('class') == 'row upperOption'){
		$(this).parent().append(inputHtml);
	}else{		
		$(this).parent().parent().append(inputHtml);
	}
});

$(document).on('click', '#deleteApprover', function(){
    let length = $(this).parent().parent().children('#approver').length;
    let deleteApprover = $(this).parent().attr('data-approver-count');

	if(length <= 1){
		alert('결재자는 최소 한명 이상 존재해야합니다.');
	}else{
		$(this).parent().parent().children('#approver').each(function(i,v){
			if($(v).attr('data-approver-count') == deleteApprover){
				$(v).remove();
			}else if($(v).attr('data-approver-count') > deleteApprover){
				$(v).attr('data-approver-count', $(v).attr('data-approver-count')*1-1);
			}
		})
		
	}
});