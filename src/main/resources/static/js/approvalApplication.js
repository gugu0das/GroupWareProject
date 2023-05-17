
$(".appBtn").click(function(){
    console.log("버튼 클릭")
    
	
    let num=$(this).attr("data-category");
    if(num == 1){
        $("#ttt").load("/file/approvalForm/vacationForm.html");
    }else if(num == 2){
        $("#ttt").html("비품")
    }else{
        $("#ttt").html("교육비")
    }
    $("#fr").append('<SPAN>결재 상세 내용</SPAN><input type="text" name="contents"><br>')
    $("#fr").append('<button type="button" id="btn">전송</button>');
})


$(document).on("click","#btn",function(){
    $("input").each(function(idx,index){
        console.log($(index).val());
        console.log("index 위치",$(index).parent());
        if($(index).attr("type") != "hidden" && $(index).attr("name") !="contents"){
            if($(index).attr("type") == "radio"){
                $(index).attr('onclick', "return(false);");
                //radio check 여부
                if($(index).is(':checked')){
                    console.log("radio 선택",$(index).val());
                    $(index).attr("checked","checked")
                   
                }
            }else{
                $(index).parent().text($(index).val());
            }
        }
    })
    console.log($("#ttt").html());
    $("#ddd").val($("#ttt").html());
    $("#fr").submit();
})

