$('#sse').click(function(){
	$.ajax({
		type:"GET",
		url:"/trigger-event",
		success : function(data){	
			console.log(data);
		}
	})
})