$('#sse').click(function(){
	let userId = 4;
	let eventData = "알림이 왔습니다.";
	$.ajax({
		type:"GET",
		url:"/trigger-event",
		data:{
			userId : userId,
			eventData : eventData
		},
		success : function(data){	
			console.log(data);
		}
	})
})