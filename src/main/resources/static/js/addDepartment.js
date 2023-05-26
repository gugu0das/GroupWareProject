

// 부서 Level Select
$("#level").on("change", function () {
    $("#defaultSelect").prop("selected", true)
 
    $("#defaultSelect").attr("disabled", true)    
    $(".level").each(function (index, data) {

        $(data).attr("hidden", true);
        $(data).attr("disabled", true);

    })
    if ($("#level").val() * 1 > 0) {
        let uppderLevel = $("#level").val() * 1 - 1;

        $(".level" + uppderLevel).each(function (index, v) {

            $(v).removeAttr("hidden")
            $(v).removeAttr("disabled")

        })
    }
})
// --------------------------------------------------------------------------------------------------------------------------
// detail
$("#updateBtn").on("click",function(e){
    $('#updateModal').modal("show");
 
})

$("#deleteBtn").on("click",function(){
    $("#frm").attr("action","./delete")
    $("#frm").submit();
})
$("#memberSearch").on("click",function(){
    $("#memberModal").modal("show");
})

$(".managerTable").on("click",function(e){
    
    memberName=$(this).find("#memberName").attr("data-name")
    console.log(memberName)
    memberid=$(this).find("#memberName").attr("data-id")
    console.log(memberid)
    $("#manager").val(memberName)
    $("#manager_id").val(memberid)
    
})
 $("#submitBtn").on("click",function(){
    if($("#level").val()*1>0&&$("#upper").val()==null){

        alert("상위부서를 입력해주세요")
    }
    else{
        
        $("#modalfrm").submit()
    }
 })

// $("#upper").on("change",function(e){
//     console.log($(this).val())
// })
// $("#upper").on("click",function(e){
//     console.log($(this).val())
// })