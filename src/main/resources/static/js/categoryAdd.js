

$('#addCategoryOption').click(function(){
    
    let count = $(document).children().children().children().children().children('.upperOption').length + 1;
	
    let inputHtml = 
         
		'<div class="row upperOption" id="upperOption' + count + '" data-upper-count="'+ count +'">' + 
		'<br/>' +
	    '<input type="text" name="upperName" id="upperName">' + 
	    '<button id="deleteUpperOption">DELETE UPPER OPTION</button>' +
		'<button id="addUnderOption">ADD UNDER OPTION</button>' + 
 		'<div class="underOption" id="underOption1" data-under-count="1">' + 
		'&nbsp &nbsp<input type="text" name="underName" id="underName">&nbsp' + 
		'<input type="text" name="fileId" id="fileId">&nbsp' + 
		'<input type="text" name="deptId" id="deptId">&nbsp' + 
		'<input type="text" name="jobId" id="jobId">&nbsp' + 
		'<button id="deleteUnderOption">DELETE UNDER OPTION</button>' + 
		'</div>' + 
		'</div>' + 
		'</div>';

    
    $('#main').append(inputHtml);
})

$(document).on("click", "#addUnderOption", function() {
    let underCount = $(this).parent().children(":last").attr('data-under-count')*1 + 1;
	if(underCount == null){
		underCount = 1;
	}
    let inputHtml = '<div class="underOption" id="underOption' + underCount + '" data-under-count="' + underCount + '">' + 
		'&nbsp &nbsp<input type="text" name="underName" id="underName">&nbsp' + 
		'<input type="text" name="fileId" id="fileId">&nbsp' + 
		'<input type="text" name="deptId" id="deptId">&nbsp' + 
		'<input type="text" name="jobId" id="jobId">&nbsp' + 
		'<button id="deleteUnderOption">DELETE UNDER OPTION</button>' + 
		'</div>';
	
	$(this).parent().append(inputHtml);
});

$(document).on("click", "#deleteUnderOption", function() {
    let optionCount = $(this).parent().parent().children('.underOption').length;
    let deleteOptionCount = $(this).parent().attr('data-under-count');

	if( optionCount != deleteOptionCount ){
		// 지우기전에 다음 자식들의 값을 -1 해준다.
		$(this).parent().parent().children('.underOption').each(function(i, v){
			if($(v).attr('data-under-count') > deleteOptionCount){
				$(v).attr('data-under-count', $(v).attr('data-under-count')*1 - 1);
			}
		})
		$(this).parent().remove();
	}else{
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

$('#btn').click(function(){
	let upperOptionCount = $(this).parent().parent().children('.upperOption').length;
	let jsonArr = [];
	for(let i = 0; i < upperOptionCount+1; i ++){
		let json1 = {};
		$('.upperOption').each(function(i,v){
			console.log($(v));
			let json1Arr = [];
			$(v).children('.underOption').each(function(i2,v2){
				console.log($(v2));
				console.log($(v2).children('#underName').val());
				let approver = [];
				let file = [];
				let approverObject = {
					"jobId" : $(v2).children('#jobId').val(),
					"deptId" : $(v2).children('#deptId').val()
				}
				let fileObject = {
					"fileId" : $(v2).children('#fileId').val()
				}
				approver.push(approverObject);
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
			jsonArr.push(json1);
		})
		
	}
	console.log(jsonArr);

    $("#json1").val(JSON.stringify(jsonArr));
    
	$('#frm').submit();
})
