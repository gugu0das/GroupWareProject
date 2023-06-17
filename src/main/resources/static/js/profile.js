let click=false;
$("#updatebtn").click(function(){
    $(".change").each(function(index,data){

        $(data).prop("readonly",false)
        $(data).removeClass("change")
    })
    $("#updatebtn").text("수정완료")
    if(!click){
        click=true;
    }
    else{
        $("#updateForm").submit();
    }
    
})
