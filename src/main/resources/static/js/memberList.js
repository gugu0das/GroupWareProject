$(".memberId").on("click",function(){
	let memberId = $(this).attr("data-Id");
	$("#memberId").val(memberId);//input에 넣기
	$.ajax({
        url: "/member/detail",
        type: "GET",
        data: {
            id: memberId
            
        },
        success: function(data) {
           
            $("#memberDetail").find(".modal-body").html(data)
			
        },
        error: function() {
            alert('관리자 문의 필요.');
        }
    });



})