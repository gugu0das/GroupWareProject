$(".leaveData").on("click",function(){
    $("#leaveDetail").find("#leaveId").val($(this).attr("data-leaveId"))
    $(this).children(".td").each(function(i,data){
        console.log($(data).html());
        $("#leaveDetail").find("#"+i).val($(data).html());
    })
})
$(".leaveDetail").on("click","#0",function(){
    $(this).val("");
    console.log($(this).val())
})
//뒤로가기
$(document).on("click", "#back", function () {
    $(".updateBlock").each(function(i,data){
        $(data).removeClass("show");
    })
    $("#mainInfo").addClass("show")
})